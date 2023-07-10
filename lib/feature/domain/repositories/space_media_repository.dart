import 'package:dartz/dartz.dart';
import 'package:nasa_image_clean_architecture/feature/domain/entities/space_media_entity.dart';

import '../../../core/usecase/errors/failures.dart';

abstract class ISpaceMediaRepository {
  Future<Either<Failure, SpaceMediaEntity>> getSpaceMediaFromDate();
}
