import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mini_project2/domain/models/user_model.dart';

Future<List<UserModel>> fetchAllData() async {
  String url = "https://jsonplaceholder.typicode.com/posts";
  final response = await http.get(Uri.parse(url));
  if (response.statusCode == 200) {
    final data = json.decode(response.body);
    List<dynamic> datas = data;
    return datas.map((json) => UserModel.fromJson(json)).toList();
  } else {
    throw Exception('Could Not Fetch User Data');
  }
}

Future<bool> deleteData(int id) async {
  String url = "https://jsonplaceholder.typicode.com/posts/";
  final response = await http.delete(Uri.parse('$url$id'));
  if (response.statusCode == 200) {
    return true;
  }
  return false;
}

Future<dynamic> updateData(int id, String body, String title) async {
  String url = "https://jsonplaceholder.typicode.com/posts/";
  try{
    final response = await http.patch(Uri.parse('$url$id'),
      headers: {
        'Content-type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({
        'id': id,
        'title': title,
        'body': body,

      }));
      if (response.statusCode == 200) {
    return true;
  }
  }catch(e){
    throw Exception(e);
  }

 
}

Future<dynamic> addData(String body, String title,int userId) async {
  String url = "https://jsonplaceholder.typicode.com/posts/";

    final response = await http.post(Uri.parse(url),
      headers: {
        'Content-type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({
        'title': title,
        'body': body,
        'userId':userId
      }));
      if (response.statusCode == 201) {
    return true;
  }else{
    return false;
  }

 
}
