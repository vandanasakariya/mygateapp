// To parse this JSON data, do
//
//     final cityModal = cityModalFromJson(jsonString);

import 'dart:convert';

CityModal cityModalFromJson(String str) => CityModal.fromJson(json.decode(str));

String cityModalToJson(CityModal data) => json.encode(data.toJson());

class CityModal {
  CityModal({
     this.city,
  });

  List<String>? city;

  factory CityModal.fromJson(Map<String, dynamic> json) => CityModal(
    city: List<String>.from(json["city"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "city": List<dynamic>.from(city!.map((x) => x)),
  };
}
