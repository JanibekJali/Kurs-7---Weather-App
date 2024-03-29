import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

class AppHttp {
  // get
  Future<Map<String, dynamic>> get(String endpoint,
      {Map<String, String> headers}) async {
    final client = http.Client();
    try {
      Uri uri = Uri.parse(endpoint);

      final response = await client.get(uri);
      if (response.statusCode == 200 || response.statusCode == 201) {
        final body = response.body;

        final data = jsonDecode(body) as Map<String, dynamic>;
        return data;
      } else {
        return null;
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  // post
  Future<Map<String, dynamic>> post(String url,
      {Map<String, String> headers}) async {
    final client = http.Client();
    try {
      Uri uri = Uri.parse(url);

      final response = await client.post(uri);
      if (response.statusCode == 200 || response.statusCode == 201) {
        final body = response.body;

        final data = jsonDecode(body) as Map<String, dynamic>;
        return data;
      } else {
        return null;
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  // update
  Future<Map<String, dynamic>> update(String url,
      {Map<String, String> headers}) async {
    final client = http.Client();
    try {
      Uri uri = Uri.parse(url);

      final response = await client.put(uri);
      if (response.statusCode == 200 || response.statusCode == 201) {
        final body = response.body;

        final data = jsonDecode(body) as Map<String, dynamic>;
        return data;
      } else {
        return null;
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  // delete
  Future<Map<String, dynamic>> delete(String url,
      {Map<String, String> headers}) async {
    final client = http.Client();
    try {
      Uri uri = Uri.parse(url);

      final response = await client.delete(uri);
      if (response.statusCode == 200 || response.statusCode == 201) {
        final body = response.body;

        final data = jsonDecode(body) as Map<String, dynamic>;
        return data;
      } else {
        return null;
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}

// Future<Map<String, dynamic>> getDio(String url,
//       {Map<String, String> headers}) async {
//     final dio = Dio();
//     try {
//       Uri uri = Uri.parse(url);

//       final response = await dio.get(uri.toString());
//       if (response.statusCode == 200 || response.statusCode == 201) {
//         final body = response.data.toString();

//         final data = jsonDecode(body) as Map<String, dynamic>;
//         return data;
//       } else {
//         return null;
//       }
//     } catch (e) {
//       throw Exception(e);
//     }
//   }
