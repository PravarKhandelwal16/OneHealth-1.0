import 'package:dio/dio.dart';

class ApiService {
  // Use your local IP or 10.0.2.2 for Android Emulator to connect to localhost:8000
  final String baseUrl = "http://127.0.0.1:8000"; 
  final Dio _dio = Dio();

  // Test connection to the backend
  Future<bool> checkBackendStatus() async {
    try {
      final response = await _dio.get('$baseUrl/');
      return response.statusCode == 200;
    } catch (e) {
      return false;
    }
  }

  // Fetch Medical Records (integrates with /records backend route)
  Future<List<dynamic>> getMedicalRecords() async {
    try {
      final response = await _dio.get('$baseUrl/records/');
      return response.data;
    } catch (e) {
      throw Exception("Failed to load records: $e");
    }
  }

  // Upload a new medical record
  Future<void> uploadRecord(Map<String, dynamic> recordData) async {
    try {
      await _dio.post('$baseUrl/records/', data: recordData);
    } catch (e) {
      throw Exception("Failed to upload record: $e");
    }
  }
}