/*import 'dart:convert';

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
}*/
// To parse this JSON data, do
//
//     final cityModal = cityModalFromJson(jsonString);

import 'dart:convert';

CityModal cityModalFromJson(String str) => CityModal.fromJson(json.decode(str));

String cityModalToJson(CityModal data) => json.encode(data.toJson());

class CityModal {
  CityModal({
     this.allStatusDownloader,
     this.splitify,
     this.pdfReader,
     this.callerLocationTracker,
  });

  AllStatusDownloader? allStatusDownloader;
  AllStatusDownloader? splitify;
  AllStatusDownloader? pdfReader;
  AllStatusDownloader? callerLocationTracker;

  factory CityModal.fromJson(Map<String, dynamic> json) => CityModal(
    allStatusDownloader: AllStatusDownloader.fromJson(json["AllStatusDownloader"]),
    splitify: AllStatusDownloader.fromJson(json["Splitify"]),
    pdfReader: AllStatusDownloader.fromJson(json["PdfReader"]),
    callerLocationTracker: AllStatusDownloader.fromJson(json["CallerLocationTracker"]),
  );



  Map<String, dynamic> toJson() => {
    "AllStatusDownloader": allStatusDownloader?.toJson(),
    "Splitify": splitify?.toJson(),
    "PdfReader": pdfReader?.toJson(),
    "CallerLocationTracker": callerLocationTracker!.toJson(),
  };
}

class AllStatusDownloader {
  AllStatusDownloader({
     this.appId,
     this.bannerUnitId,
     this.nativeUnitId,
     this.interstitialId,
  });

  String? appId;
  String? bannerUnitId;
  String? nativeUnitId;
  String? interstitialId;

  factory AllStatusDownloader.fromJson(Map<String, dynamic> json) => AllStatusDownloader(
    appId: json["AppId"],
    bannerUnitId: json["BannerUnitId"],
    nativeUnitId: json["NativeUnitId"],
    interstitialId: json["InterstitialId"],
  );

  Map<String, dynamic> toJson() => {
    "AppId": appId,
    "BannerUnitId": bannerUnitId,
    "NativeUnitId": nativeUnitId,
    "InterstitialId": interstitialId,
  };
}
