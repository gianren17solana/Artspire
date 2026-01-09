import 'package:artspire/models/artItem.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  //TODO: Connect to production service later
  static const String baseUrl = "https://artspire-seven.vercel.app"; 

  static Future<List<ArtItem>> fetchItems() async {
    try {
      print("Fetching from: ${baseUrl}/fetchItem");
      final response = await http.get(
        Uri.parse('${baseUrl}/fetchItem'),
      );
      print("Response status: ${response.statusCode}");
      print("Response body: ${response.body}");

      if (response.statusCode == 200) {
        final List data = jsonDecode(response.body); 
        return data.map((e) => ArtItem.fromJson(e)).toList();
      } else {
        throw Exception("Failed to load items: ${response.statusCode}");
      }
    } catch (e) {
      print("API Error: $e");
      rethrow;
    }
  }

  static Future<ArtItem> fetchItemById(int id) async {
    final response = await http.get(Uri.parse('$baseUrl/fetchItem/$id'));

    if (response.statusCode == 200) {
     final data = jsonDecode(response.body);
     return ArtItem.fromJson(data);
    } else {
     throw Exception('Failed to load item with id $id');
    }
  }
}
