import 'package:dio/dio.dart';
import 'dart:io';

class ApiService {
  // Use 10.0.2.2 for Android Emulator, localhost for iOS/Web
  static const String baseUrl = "http://10.0.2.2:8000"; 
  final Dio _dio = Dio();

  // 1. Upload Medical Record (Image/PDF)
  Future<Map<String, dynamic>> uploadRecord(File file, String userId) async {
    String fileName = file.path.split('/').last;
    FormData formData = FormData.fromMap({
      "file": await MultipartFile.fromFile(file.path, filename: fileName),
      "user_id": userId,
    });

    try {
      var response = await _dio.post("$baseUrl/records/upload", data: formData);
      return response.data;
    } catch (e) {
      throw Exception("Failed to upload record: $e");
    }
  }

  // 2. Fetch All Records for a User
  Future<List<dynamic>> getRecords(String userId) async {
    try {
      var response = await _dio.get("$baseUrl/records/$userId");
      return response.data; // List of records
    } catch (e) {
      throw Exception("Failed to fetch records: $e");
    }
  }

  // 3. Get AI Insights/Summary
  Future<Map<String, dynamic>> getInsights(String userId) async {
    try {
      var response = await _dio.get("$baseUrl/insights/$userId");
      return response.data;
    } catch (e) {
      throw Exception("Failed to fetch insights: $e");
    }
  }
}