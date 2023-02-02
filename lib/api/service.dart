import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mygateapp/api/city_modal.dart';

class CityService {
  static final url = "https://countriesnow.space/api/v0.1/countries/cities";

  static Future<CityModal?> getCity() async {
    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {} ,
        body: jsonEncode({
          {"country": "india"}
        }),
      );
      print("rrrrr---${response.body}");

      return CityModal.fromJson(response.body)/*fromJson(jsonDecode(response.body))*/;
    } catch (e) {
      print("error---->$e");
    }
  }
}
