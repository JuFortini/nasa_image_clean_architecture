import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nasa_image_clean_architecture/core/usecase/usecase.dart';
import 'package:nasa_image_clean_architecture/feature/domain/entities/space_media_entity.dart';
import 'package:nasa_image_clean_architecture/feature/domain/repositories/space_media_repository.dart';
import 'package:nasa_image_clean_architecture/feature/domain/usecases/get_space_media_usecase.dart';

class MockSpaceMediaRepository extends Mock implements ISpaceMediaRepository {}

void main() {
  late GetSpaceMediaUsecase usecase;
  late ISpaceMediaRepository repository;

  setUp(() {
    repository = MockSpaceMediaRepository();
    usecase = GetSpaceMediaUsecase(repository);
  });

  const tSpaceMedia = SpaceMediaEntity(
    title: 'Test media title',
    mediaUrl:
        'https://images.unsplash.com/photo-1454789548928-9efd52dc4031?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=580&q=80',
    description: 'Test media description',
    mediaType: 'image',
  );

  final tNoParams = NoParams();

  test('should get space media entity for a given date from the repository',
      () {
    when(() => repository.getSpaceMediaFromDate()).thenAnswer(
      (_) async => const Right(tSpaceMedia),
    );

    final result = usecase(tNoParams);
    expect(result, const Right(tSpaceMedia));
    verify.call(repository.getSpaceMediaFromDate());
  });
}
