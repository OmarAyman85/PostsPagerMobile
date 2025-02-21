// Importing necessary files and packages
import 'core/network/network_info.dart';
import 'features/posts/data/datasources/post_local_data_source.dart';
import 'features/posts/data/datasources/post_remote_data_source.dart';
import 'features/posts/data/repositories/post_repository_impl.dart';
import 'features/posts/domain/repositories/posts_repository.dart';
import 'features/posts/domain/usecases/add_post.dart';
import 'features/posts/domain/usecases/delete_post.dart';
import 'features/posts/domain/usecases/get_all_posts.dart';
import 'features/posts/domain/usecases/update_post.dart';
import 'features/posts/presentation/bloc/add_delete_update_post/bloc/add_delete_update_post_bloc.dart';
import 'features/posts/presentation/bloc/posts/posts_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Creating an instance of GetIt for dependency injection
final sl = GetIt.instance;

// Function to initialize dependencies
Future<void> init() async {
  //! Features - posts

  // Bloc

  // Registering PostsBloc with GetIt
  sl.registerFactory(() => PostsBloc(getAllPosts: sl()));
  // Registering AddDeleteUpdatePostBloc with GetIt
  sl.registerFactory(
    () => AddDeleteUpdatePostBloc(
      addPost: sl(),
      updatePost: sl(),
      deletePost: sl(),
    ),
  );

  // Usecases

  // Registering GetAllPostsUsecase with GetIt
  sl.registerLazySingleton(() => GetAllPostsUsecase(sl()));
  // Registering AddPostUsecase with GetIt
  sl.registerLazySingleton(() => AddPostUsecase(sl()));
  // Registering DeletePostUsecase with GetIt
  sl.registerLazySingleton(() => DeletePostUsecase(sl()));
  // Registering UpdatePostUsecase with GetIt
  sl.registerLazySingleton(() => UpdatePostUsecase(sl()));

  // Repository

  // Registering PostsRepository implementation with GetIt
  sl.registerLazySingleton<PostsRepository>(
    () => PostsRepositoryImpl(
      remoteDataSource: sl(),
      localDataSource: sl(),
      networkInfo: sl(),
    ),
  );

  // Datasources

  // Registering PostRemoteDataSource implementation with GetIt
  sl.registerLazySingleton<PostRemoteDataSource>(
    () => PostRemoteDataSourceImpl(client: sl()),
  );
  // Registering PostLocalDataSource implementation with GetIt
  sl.registerLazySingleton<PostLocalDataSource>(
    () => PostLocalDataSourceImpl(sharedPreferences: sl()),
  );

  //! Core

  // Registering NetworkInfo implementation with GetIt
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  //! External

  // Getting an instance of SharedPreferences and registering it with GetIt
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  // Registering http.Client with GetIt
  sl.registerLazySingleton(() => http.Client());
  // Registering InternetConnectionChecker with GetIt
  sl.registerLazySingleton(() => InternetConnectionChecker.createInstance());
}
