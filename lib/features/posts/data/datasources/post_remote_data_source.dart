// Importing necessary libraries and files
import 'dart:convert'; // For JSON encoding and decoding
import '../../../../core/errors/exceptions.dart'; // Custom exceptions
import '../models/post_model.dart'; // Post model
import 'package:dartz/dartz.dart'; // For functional programming constructs like Either and Unit
import 'package:http/http.dart' as http; // For making HTTP requests

// Abstract class defining the contract for the remote data source
abstract class PostRemoteDataSource {
  Future<List<PostModel>> getAllPosts(); // Method to get all posts
  Future<Unit> deletePost(int postId); // Method to delete a post by ID
  Future<Unit> updatePost(PostModel postModel); // Method to update a post
  Future<Unit> addPost(PostModel postModel); // Method to add a new post
}

// Base URL for the API
const BASE_URL = "https://jsonplaceholder.typicode.com";

// Implementation of the PostRemoteDataSource
class PostRemoteDataSourceImpl implements PostRemoteDataSource {
  final http.Client client; // HTTP client for making requests

  // Constructor to initialize the HTTP client
  PostRemoteDataSourceImpl({required this.client});

  // Method to get all posts
  @override
  Future<List<PostModel>> getAllPosts() async {
    final response = await client.get(
      Uri.parse("$BASE_URL/posts/"), // API endpoint for getting posts
      headers: {"Content-Type": "application/json"}, // Request headers
    );

    if (response.statusCode == 200) {
      // If the request is successful
      final List decodedJson =
          json.decode(response.body) as List; // Decode the JSON response
      final List<PostModel> postModels =
          decodedJson
              .map<PostModel>(
                (jsonPostModel) => PostModel.fromJson(
                  jsonPostModel,
                ), // Convert JSON to PostModel
              )
              .toList();

      return postModels; // Return the list of PostModel
    } else {
      throw ServerException(); // Throw an exception if the request fails
    }
  }

  // Method to add a new post
  @override
  Future<Unit> addPost(PostModel postModel) async {
    final body = {
      "title": postModel.title,
      "body": postModel.body,
    }; // Request body

    final response = await client.post(
      Uri.parse(BASE_URL + "/posts/"), // API endpoint for adding a post
      body: body, // Request body
    );

    if (response.statusCode == 201) {
      // If the request is successful
      return Future.value(unit); // Return a Unit value
    } else {
      throw ServerException(); // Throw an exception if the request fails
    }
  }

  // Method to delete a post by ID
  @override
  Future<Unit> deletePost(int postId) async {
    final response = await client.delete(
      Uri.parse(
        BASE_URL + "/posts/${postId.toString()}",
      ), // API endpoint for deleting a post
      headers: {"Content-Type": "application/json"}, // Request headers
    );

    if (response.statusCode == 200) {
      // If the request is successful
      return Future.value(unit); // Return a Unit value
    } else {
      throw ServerException(); // Throw an exception if the request fails
    }
  }

  // Method to update a post
  @override
  Future<Unit> updatePost(PostModel postModel) async {
    final postId = postModel.id.toString(); // Get the post ID
    final body = {
      "title": postModel.title,
      "body": postModel.body,
    }; // Request body

    final response = await client.patch(
      Uri.parse(
        BASE_URL + "/posts/$postId",
      ), // API endpoint for updating a post
      body: body, // Request body
    );

    if (response.statusCode == 200) {
      // If the request is successful
      return Future.value(unit); // Return a Unit value
    } else {
      throw ServerException(); // Throw an exception if the request fails
    }
  }
}
