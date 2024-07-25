import 'dart:convert';
import 'package:http/http.dart' as http;
import 'house.dart';

class ApiService {
  static const String baseUrl = 'http://18.235.24.106:2024/api';

  Future<List<House>> fetchHouses() async {
    final response = await http.get(Uri.parse('$baseUrl/houses'));

    print('Status code: ${response.statusCode}');
    print('Response body: ${response.body}');

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((house) => House.fromJson(house)).toList();
    } else {
      throw Exception('Failed to load houses');
    }
  }

  Future<List<House>> fetchUserHouses(String userId) async {
    final response = await http.get(Uri.parse('$baseUrl/houses/user/$userId'));

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((house) => House.fromJson(house)).toList();
    } else {
      throw Exception('Failed to load user houses');
    }
  }
}
