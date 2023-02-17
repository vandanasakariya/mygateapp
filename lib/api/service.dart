import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:mygateapp/api/city_modal.dart';

class CityService {
  static final String url = "http://clickontech.in/city.json";

  /*static Future<CityModal?> getRequest() async {


    final response = await http.get(Uri.parse(url));
    return CityModal.fromJson(json.decode(response.body));

  }
*/
  static Future<CityModal?> getdata() async {

     var dio = Dio();
    var res = await dio.get(
      url,
      options: Options(headers: {"Accept": "application/json"}),
    );
    if (res.statusCode == 200) {
      print("Connection successful");

      return CityModal.fromJson(res.data);
    } else {
      print("Error while connecting to server.");
    }
  }
}
