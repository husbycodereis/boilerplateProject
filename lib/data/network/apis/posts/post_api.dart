import 'dart:async';

import 'package:boilerplate/data/network/constants/endpoints.dart';
import 'package:boilerplate/data/network/dio_client.dart';
import 'package:boilerplate/models/post/post_list.dart';
import 'package:boilerplate/models/todos/todos.dart';

class PostApi {
  // dio instance
  final DioClient _dioClient;

  // rest-client instance

  // injecting dio instance
  PostApi(this._dioClient,);

  /// Returns list of post in response
  Future<PostList> getPosts() async {
    try {
      final res = await _dioClient.get(Endpoints.getPosts);
      return PostList.fromJson(res);
    } catch (e) {
      print(e.toString());
      throw e;
    }
  }

   Future<List<Todos>> getTodos() async {
    try {
      final List<dynamic>response = await _dioClient.get(Endpoints.getTodos);
      return response.map((todo) => Todos.fromJson(todo)).toList() ;
    } catch (e) {
      print(e.toString());
      throw e;
    }
  }

  /// sample api call with default rest client
//  Future<PostsList> getPosts() {
//
//    return _restClient
//        .get(Endpoints.getPosts)
//        .then((dynamic res) => PostsList.fromJson(res))
//        .catchError((error) => throw NetworkException(message: error));
//  }

}
