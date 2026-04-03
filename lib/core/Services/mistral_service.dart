
import 'package:dio/dio.dart';


class MistralService {
  static final MistralService _instance = MistralService._internal();
  factory MistralService() => _instance;
  late final Dio _dio;
  MistralService._internal();
  void init(String apiKey) {
    _dio = Dio(BaseOptions(
      baseUrl: "https://api.mistral.ai/v1",
      headers: {
        "Authorization": "Bearer $apiKey",
        "Content-Type": "application/json",
      },
    ));
  }
  Future<String> getChatCompletion(String prompt) async {
    try {
      final response = await _dio.post("/chat/completions", data: {
        "model": "mistral-small-latest",
        "messages": [
          {"role": "user", "content": prompt}
        ]
      });
      return response.data["choices"][0]["message"]["content"];
    } catch (e) {
      return "Error: $e";
    }
  }
}
