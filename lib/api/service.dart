import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:mygateapp/api/city_modal.dart';

class CityService {
    static final url = "http://clickontech.in/AdConfig.json";

  //static final Dio _dio = Dio();
  static getdata() async {
    var dio = Dio();
    var res = await dio.get(
      "http://clickontech.in/AdConfig.json",
      options: Options(
        responseType: ResponseType.plain,
      ),
    );
    if (res.statusCode == 200) {
      print("Connection successful");
      print(res.data);
      return res;
    }
    else{
      print("Error while connecting to server.");
    }
  }
/*static Future<CityModal?> getCity() async {
    var response;
    print(response);
    try {
      response = await Dio().get("http://clickontech.in/AdConfig.json",
          options: Options(
            headers: {
              HttpHeaders.contentTypeHeader: "application/json",
            },
          ));
      return response;
    } catch (e) {
      print(e);
    }
  }*/
/* static Future<CityModal?> getCity() async {

    try {
      CityModal response = (await _dio.get(
        url,
        options: Options(
          followRedirects: false,
          headers: {
            HttpHeaders.contentTypeHeader: "application/json",
           // "Content-Type": "application/json"
          },
        ),
       */ /* data: {
          "country": "india",
        } */ /**/ /*jsonEncode(par) */ /**/ /*,*/ /*
      ))as CityModal;
      print("jjj$response");
      return response;

    } on Exception catch (e) {
      // TODO
      print("${e.printError}");
    }

  }
*/
}
