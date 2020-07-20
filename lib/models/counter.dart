// To parse this JSON data, do
//
//     final client = clientFromMap(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

final String inc = "inc";
final String dec = "dec";

enum CounterUpdateType { inc, dec }

class CounterModel {
  CounterModel({
    @required this.id,
    @required this.title,
    @required this.count,
  });

  final String id;
  final String title;
  final int count;

  CounterModel copyWith({
    String id,
    String title,
    int count,
  }) =>
      CounterModel(
        id: id ?? this.id,
        title: title ?? this.title,
        count: count ?? this.count,
      );

  factory CounterModel.fromJson(String str) =>
      CounterModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CounterModel.fromMap(Map<String, dynamic> json) => CounterModel(
        id: json["id"],
        title: json["title"],
        count: json["count"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "title": title,
        "count": count,
      };
}
