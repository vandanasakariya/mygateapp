// To parse this JSON data, do
//
//     final cityModal = cityModalFromJson(jsonString);

import 'dart:convert';

CityModal cityModalFromJson(String str) => CityModal.fromJson(json.decode(str));

String cityModalToJson(CityModal data) => json.encode(data.toJson());

class CityModal {
  CityModal({
     this.error,
     this.msg,
     this.data,
  });

  bool? error;
  String? msg;
  List<String>? data;

  factory CityModal.fromJson(Map<String, dynamic> json) => CityModal(
    error: json["error"],
    msg: json["msg"],
    data: List<String>.from(json["data"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "error": error,
    "msg": msg,
    "data": List<dynamic>.from(data!.map((x) => x)),
  };
}
