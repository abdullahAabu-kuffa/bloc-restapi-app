import 'package:bloc_app/constants/strings.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class CharactersAPI {
  late Dio dio;
  CharactersAPI() {
    BaseOptions option = BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: Duration(seconds: 20),
      receiveTimeout: Duration(seconds: 20),
    );
    dio = Dio(option);
  }

  Future<List<dynamic>> getAllCharacters() async {
    try {
      Response response = await dio.get('character');
      if (kDebugMode) {
        print({'response': response.data['results'].toString()});
      }
      return response.data['results'];
    } catch (e, stack) {
      if (kDebugMode) {
        print('Error fetching characters:${e.toString()}');
        print('Stack trace: $stack');
      }
      return [];
    }
  }
}
