import 'package:dio/dio.dart';
class ApiClient {
  ApiClient({Dio? dio}) : dio = dio ?? Dio(BaseOptions(baseUrl: 'https://jsonplaceholder.typicode.com'));
  final Dio dio;
  Future<List<dynamic>> getTodos() async { final response = await dio.get('/todos', queryParameters: {'_limit': 20}); return response.data as List<dynamic>; }
}
