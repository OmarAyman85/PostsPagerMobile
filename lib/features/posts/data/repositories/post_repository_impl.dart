import 'package:dartz/dartz.dart'; // Importing Either and Unit from the dartz package

import '../../../../core/errors/exceptions.dart'; // Importing custom exceptions
import '../../../../core/errors/failures.dart'; // Importing custom failures
import '../../../../core/network/network_info.dart'; // Importing network info utility
import '../../domain/entities/post.dart'; // Importing Post entity
import '../../domain/repositories/posts_repository.dart'; // Importing PostsRepository interface
import '../datasources/post_local_data_source.dart'; // Importing local data source
import '../datasources/post_remote_data_source.dart'; // Importing remote data source
import '../models/post_model.dart'; // Importing PostModel

// Typedef for a function that returns a Future<Unit>
typedef DeleteOrUpdateOrAddPost = Future<Unit> Function();

// Implementation of the PostsRepository interface
class PostsRepositoryImpl implements PostsRepository {
  final PostRemoteDataSource remoteDataSource; // Remote data source dependency
  final PostLocalDataSource localDataSource; // Local data source dependency
  final NetworkInfo networkInfo; // Network info dependency

  // Constructor with required dependencies
  PostsRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  // Method to get all posts
  @override
  Future<Either<Failure, List<Post>>> getAllPosts() async {
    if (await networkInfo.isConnected) {
      // Check if the device is connected to the internet
      try {
        final remotePosts =
            await remoteDataSource
                .getAllPosts(); // Fetch posts from remote data source
        localDataSource.cachePosts(
          remotePosts,
        ); // Cache the fetched posts locally
        return Right(
          remotePosts,
        ); // Return the posts wrapped in a Right (success) Either
      } on ServerException {
        return Left(
          ServerFailure(),
        ); // Return a ServerFailure wrapped in a Left (failure) Either
      }
    } else {
      try {
        final localPosts =
            await localDataSource
                .getCachedPosts(); // Fetch posts from local cache
        return Right(
          localPosts,
        ); // Return the cached posts wrapped in a Right (success) Either
      } on EmptyCacheException {
        return Left(
          EmptyCacheFailure(),
        ); // Return an EmptyCacheFailure wrapped in a Left (failure) Either
      }
    }
  }

  // Method to add a post
  @override
  Future<Either<Failure, Unit>> addPost(Post post) async {
    final PostModel postModel = PostModel(
      title: post.title,
      body: post.body,
    ); // Convert Post entity to PostModel

    return await _getMessage(() {
      return remoteDataSource.addPost(
        postModel,
      ); // Add post using remote data source
    });
  }

  // Method to delete a post
  @override
  Future<Either<Failure, Unit>> deletePost(int postId) async {
    return await _getMessage(() {
      return remoteDataSource.deletePost(
        postId,
      ); // Delete post using remote data source
    });
  }

  // Method to update a post
  @override
  Future<Either<Failure, Unit>> updatePost(Post post) async {
    final PostModel postModel = PostModel(
      id: post.id,
      title: post.title,
      body: post.body,
    ); // Convert Post entity to PostModel

    return await _getMessage(() {
      return remoteDataSource.updatePost(
        postModel,
      ); // Update post using remote data source
    });
  }

  // Helper method to handle network operations and return appropriate Either
  Future<Either<Failure, Unit>> _getMessage(
    DeleteOrUpdateOrAddPost deleteOrUpdateOrAddPost,
  ) async {
    if (await networkInfo.isConnected) {
      // Check if the device is connected to the internet
      try {
        await deleteOrUpdateOrAddPost(); // Execute the provided function
        return Right(
          unit,
        ); // Return success wrapped in a Right (success) Either
      } on ServerException {
        return Left(
          ServerFailure(),
        ); // Return a ServerFailure wrapped in a Left (failure) Either
      }
    } else {
      return Left(
        OfflineFailure(),
      ); // Return an OfflineFailure wrapped in a Left (failure) Either
    }
  }
}
