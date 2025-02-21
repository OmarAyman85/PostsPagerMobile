// Importing necessary packages and modules
import 'dart:convert'; // For encoding and decoding JSON data
import 'package:dartz/dartz.dart'; // For functional programming constructs like Either and Unit
import 'package:shared_preferences/shared_preferences.dart'; // For accessing shared preferences
import '../../../../core/errors/exceptions.dart'; // For custom exceptions
import '../models/post_model.dart'; // For the PostModel class

// Abstract class defining the contract for local data source
abstract class PostLocalDataSource {
  // Method to get cached posts
  Future<List<PostModel>> getCachedPosts();
  // Method to cache posts
  Future<Unit> cachePosts(List<PostModel> postModels);
}

// Constant key for cached posts
const CACHED_POSTS = "CACHED_POSTS";

// Implementation of the PostLocalDataSource
class PostLocalDataSourceImpl implements PostLocalDataSource {
  // SharedPreferences instance to interact with local storage
  final SharedPreferences sharedPreferences;

  // Constructor to initialize sharedPreferences
  PostLocalDataSourceImpl({required this.sharedPreferences});

  // Method to cache posts
  @override
  Future<Unit> cachePosts(List<PostModel> postModels) {
    // Convert list of PostModel to JSON
    List postModelsToJson =
        postModels
            .map<Map<String, dynamic>>((postModel) => postModel.toJson())
            .toList();
    // Save JSON string to shared preferences
    sharedPreferences.setString(CACHED_POSTS, json.encode(postModelsToJson));
    // Return a unit value indicating completion
    return Future.value(unit);
  }

  // Method to get cached posts
  @override
  Future<List<PostModel>> getCachedPosts() {
    // Retrieve JSON string from shared preferences
    final jsonString = sharedPreferences.getString(CACHED_POSTS);
    if (jsonString != null) {
      // Decode JSON string to list
      List decodeJsonData = json.decode(jsonString);
      // Convert list of JSON to list of PostModel
      List<PostModel> jsonToPostModels =
          decodeJsonData
              .map<PostModel>(
                (jsonPostModel) => PostModel.fromJson(jsonPostModel),
              )
              .toList();
      // Return the list of PostModel
      return Future.value(jsonToPostModels);
    } else {
      // Throw exception if no cached data is found
      throw EmptyCacheException();
    }
  }
}
