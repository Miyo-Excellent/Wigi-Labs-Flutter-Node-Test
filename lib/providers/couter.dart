import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:http/io_client.dart';

import 'package:wg_test/models/counter.dart';

class CountersProvider {
  // final String apiUrl = "https:/my-domain.com/api/v1";
  // final String apiUrl = "http://localhost:3000/api/v1";
  final String apiUrl = "http://10.0.2.2:3000/api/v1";
  // final String apiUrl = "http://192.168.2.4:3000/api/v1";

  Future<List<CounterModel>> getCounters() async {
    final String url = "$apiUrl/counters";

    final response = await http.get(
      url,
      headers: <String, String>{"Accept": "application/json"},
    );

    if (response.statusCode == 200) {
      final List<dynamic> decodeData = await json.decode(response.body);

      return decodeData
          .map((dynamic counter) => CounterModel.fromMap(counter))
          .toList();
    }

    return <CounterModel>[];
  }

  Future<List<CounterModel>> setCounter({@required String counterTitle}) async {
    final String url = "$apiUrl/counter";

    final response = await http.post(
      url,
      headers: <String, String>{"Accept": "application/json"},
      body: {"title": counterTitle},
    );

    if (response.statusCode == 200) {
      final List<dynamic> decodeData = await json.decode(response.body);

      return decodeData
          .map((dynamic counter) => CounterModel.fromMap(counter))
          .toList();
    }

    return <CounterModel>[];
  }

  Future<List<CounterModel>> updateCounter({
    @required String id,
    @required CounterUpdateType type,
  }) async {
    String _type = "";

    switch (type.index) {
      case 0:
        _type = "inc";
        break;

      case 1:
        _type = "dec";
        break;

      default:
        break;
    }

    final String url = "$apiUrl/counter/$_type";

    final response = await http.post(
      url,
      headers: <String, String>{"Accept": "application/json"},
      body: {"id": id},
    );

    if (response.statusCode == 200) {
      final List<dynamic> decodeData = await json.decode(response.body);

      return decodeData
          .map((dynamic counter) => CounterModel.fromMap(counter))
          .toList();
    }

    return <CounterModel>[];
  }

  //@TODO: This EndPoint should return an updated list.
  Future<List<CounterModel>> deleteCounter({@required String id}) async {
    final String url = "$apiUrl/counter";

    final client = http.Client();

    try {
      final meta = http.Request("DELETE", Uri.parse(url));
      meta.bodyFields = {"id": id};

      final IOStreamedResponse metaResult = await client.send(meta);

      if (metaResult.statusCode == 200) {
        final String stream = await metaResult.stream.bytesToString();

        final List<dynamic> decodeData = await json.decode(stream);

        return decodeData
            .map((dynamic counter) => CounterModel.fromMap(counter))
            .toList();
      }

      return <CounterModel>[];
    } finally {
      client.close();
    }
  }
}
