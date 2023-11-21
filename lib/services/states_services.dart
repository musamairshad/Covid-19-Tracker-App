import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:covid_19_tracker/models/world_states_model.dart';
import 'package:covid_19_tracker/services/utilities/app_url.dart';

class StatesServices {
  Future<WorldStatesModel> fetchWorldStatesRecords() async {
    final url = Uri.https(AppUrl.baseUrl);
    final response = await http.get(url);
    final resData = json.decode(response.body);
    if (response.statusCode == 200) {
      return WorldStatesModel.fromJson(resData);
    } else {
      throw Exception("Error.");
    }
  }
}
