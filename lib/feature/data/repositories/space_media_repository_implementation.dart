import 'package:nasa_image_clean_architecture/feature/domain/entities/space_media_entity.dart';
import 'package:nasa_image_clean_architecture/core/usecase/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:nasa_image_clean_architecture/feature/domain/repositories/space_media_repository.dart';

import '../datasources/space_media_datasource.dart';

class SpaceMediaRepositoryImplementation implements ISpaceMediaRepository {
  final ISpaceMediaDatasource datasource;

  SpaceMediaRepositoryImplementation(this.datasource);

  @override
  Future<Either<Failure, SpaceMediaEntity>> getSpaceMediaFromDate(
    DateTime date,
  ) {
    // TODO: implement getSpaceMediaFromDate
    throw UnimplementedError();
  }
}
