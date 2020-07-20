import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wg_test/models/counter.dart';
import 'package:wg_test/providers/couter.dart';
import 'package:wg_test/widgets/Material_Ink_Button.dart';
import 'package:wg_test/widgets/counter.dart';
import 'package:wg_test/widgets/modal.dart';
import 'package:wg_test/widgets/new_counter_modal.dart';
import 'package:wg_test/widgets/total_bar.dart';

class HomePage extends StatefulWidget {
  static final String routeName = "home";
  static final String title = "WG Counters Test";

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final CountersProvider _provider = CountersProvider();

  List<CounterModel> counters = <CounterModel>[];

  void updateCounters() async {
    final List<CounterModel> _counters = await _provider.getCounters();

    setState(() {
      counters = _counters;
    });
  }

  void addCounter({@required String title}) async {
    final List<CounterModel> _newCounter =
        await _provider.setCounter(counterTitle: title);

    setState(() {
      counters = _newCounter;
    });
  }

  void updateCounter({
    @required String id,
    @required CounterUpdateType updateType,
  }) async {
    final List<CounterModel> _counters =
        await _provider.updateCounter(id: id, type: updateType);

    setState(() {
      counters = _counters;
    });
  }

  void onSubmit({@required String title}) async {
    addCounter(title: title);
  }

  void deleteCounter({
    @required String id,
  }) async {
    final List<CounterModel> _counters = await _provider.deleteCounter(id: id);

    setState(() {
      counters = _counters;
    });
  }

  @override
  void initState() {
    super.initState();
    updateCounters();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.orange,
        title: Text(
          HomePage.title,
          style: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          MaterialInkButtton(
            color: Colors.orange,
            splashColor: Colors.white,
            onTap: () => Modal.show(
              context: context,
              child: NewCounterModal(onSubmit: onSubmit),
            ),
            child: Container(
              padding: EdgeInsets.all(5.0),
              decoration: BoxDecoration(),
              child: Center(
                child: Icon(
                  Icons.library_add,
                  color: Colors.white,
                  size: 30.0,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: counters
                  .map((CounterModel counter) => Counter(
                        data: counter,
                        onInc: () => updateCounter(
                          id: counter.id,
                          updateType: CounterUpdateType.inc,
                        ),
                        onDec: () => counter.count > 0
                            ? updateCounter(
                                id: counter.id,
                                updateType: CounterUpdateType.dec,
                              )
                            : null,
                        onDrop: () => deleteCounter(id: counter.id),
                      ))
                  .toList(),
            ),
          ),
          Divider(
            color: Color.fromRGBO(0, 0, 0, 0.5),
            height: 1.0,
            thickness: 1.0,
          ),
          TotalBar(counters: counters),
        ],
      ),
    );
  }
}
