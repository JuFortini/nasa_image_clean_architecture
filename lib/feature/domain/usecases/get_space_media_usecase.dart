import 'package:nasa_image_clean_architecture/core/usecase/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:nasa_image_clean_architecture/core/usecase/usecase.dart';
import 'package:nasa_image_clean_architecture/feature/domain/entities/space_media_entity.dart';

import '../repositories/space_media_repository.dart';

class GetSpaceMediaUsecase implements Usecase<SpaceMediaEntity, NoParams> {
  final ISpaceMediaRepository repository;

  GetSpaceMediaUsecase(this.repository);

  @override
  Future<Either<Failure, SpaceMediaEntity>> call(NoParams params) async {
    return await repository.getSpaceMediaFromDate();
  }
}
