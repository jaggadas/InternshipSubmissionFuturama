import 'package:http/http.dart' as http;
import 'dart:convert';
class NetworkHelper{
  NetworkHelper();
  Future getData() async{
    http.Response response =await http.get(Uri.parse("https://api.sampleapis.com/futurama/characters"));
    if(response.statusCode==200){
      String responseBody=response.body;
      var decodedData=jsonDecode(responseBody);
    return decodedData;}
    else{
      print(response.statusCode);
    }
}}