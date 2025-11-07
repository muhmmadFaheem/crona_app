import 'dart:convert';

import 'package:crona_app/model/model_case.dart';
import 'package:crona_app/utils/app_url.dart';
import 'package:http/http.dart' as http;
class WorldCase{


  Future<CaseModel> fetchdata () async{

    final response = await http.get(Uri.parse(AppUrl.allstateUrl));

    if(response.statusCode == 200){
      var data = jsonDecode(response.body);

      return CaseModel.fromJson(data);

    }
    else{
      throw Exception("Loading Error");
    }
  }


  Future<List<dynamic>> countryhdata () async{
    var dataCountry;

    final response = await http.get(Uri.parse(AppUrl.countryUrl));

    if(response.statusCode == 200){
      dataCountry =jsonDecode(response.body);

      return dataCountry;

    }
    else{
      throw Exception("Loading Error");
    }
  }
}