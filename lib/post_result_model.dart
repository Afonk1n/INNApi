import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;



class PostResult{
  String value;
  String query;


  PostResult({this.value, this.query});

  factory PostResult.createPostResult(Map<String, dynamic> object){
    return PostResult(
      value: object['value'],
      query: object['query'],
    );
  }

  static Future<PostResult> connectToAPI(String inn) async {
    var body = json.encode({ "query" : inn, "branch_type": "MAIN" });
    Map<String, String> headers =  {"Content-Type": "application/json", "Accept": "application/json", "Authorization" : "Token 389a7a1b4e620686322cdca86561dcaffab7ae57"};
    String apiURL = "https://suggestions.dadata.ru/suggestions/api/4_1/rs/findById/party";
    var apiResult = await http.post(apiURL, headers: headers, body: body);
    Map jsonObject = json.decode(apiResult.body);
    print(jsonObject['suggestions']);
    return PostResult.createPostResult(jsonObject);
  }
}