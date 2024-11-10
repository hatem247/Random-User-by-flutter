import 'package:dio/dio.dart';

import '../Models/random_user.dart';

class RandomUserService {
  static Dio dio = Dio();

  static Future<List<RandomUser>> fetchRandomUsers(int count) async {
    try {
      final response = await dio.get('https://randomuser.me/api/',
          queryParameters: {'results': count});
      final data = response.data;
      return (data["results"] as List<dynamic>)
          .map((user) => RandomUser.fromJson(user))
          .toList();
    } catch (e) {
      throw Exception('Failed to fetch random users: $e');
    }
  }
}
