import '../repositories/posts_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';

class DeletePostUsecase {
  final PostsRepository repository;

  DeletePostUsecase(this.repository);

  Future<Either<Failure, Unit>> call(int postId) async {
    return await repository.deletePost(postId);
  }
}