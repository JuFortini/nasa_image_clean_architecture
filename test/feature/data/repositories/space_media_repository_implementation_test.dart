import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nasa_image_clean_architecture/core/usecase/errors/exceptions.dart';
import 'package:nasa_image_clean_architecture/core/usecase/errors/failures.dart';
import 'package:nasa_image_clean_architecture/feature/data/datasources/space_media_datasource.dart';
import 'package:nasa_image_clean_architecture/feature/data/models/space_media_model.dart';
import 'package:nasa_image_clean_architecture/feature/data/repositories/space_media_repository_implementation.dart';
import 'package:nasa_image_clean_architecture/feature/domain/entities/space_media_entity.dart';

class MockSpaceMediaDatasource extends Mock implements ISpaceMediaDatasource {}

void main() {
  late SpaceMediaRepositoryImplementation repository;
  late ISpaceMediaDatasource datasource;

  setUp(() {
    datasource = MockSpaceMediaDatasource();
    repository = SpaceMediaRepositoryImplementation(datasource);
  });

  const tSpaceMediaModel = SpaceMediaModel(
    title: 'Test media title',
    mediaUrl:
        'https://images.unsplash.com/photo-1454789548928-9efd52dc4031?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=580&q=80',
    description: 'Test media description',
    mediaType: 'image',
  );

  final tDate = DateTime(2023, 07, 11);

  test('should return space media model when calls the datasource', () async {
    // Arrange
    when(() => datasource.getSpaceMediaFromDate(tDate)).thenAnswer(
      (_) async => tSpaceMediaModel,
    );
    // Act
    final result = await repository.getSpaceMediaFromDate(tDate);
    // Assert
    expect(result, const Right(tSpaceMediaModel));
    verify(() => datasource.getSpaceMediaFromDate(tDate)).called(1);
  });

  test(
      'should return a server failure when the call to datasource is unsuccessful',
      () async {
    when(() => datasource.getSpaceMediaFromDate(tDate))
        .thenThrow(ServerException());

    final result = await repository.getSpaceMediaFromDate(tDate);
    expect(result, Left(ServerFailure()));
    verify(() => datasource.getSpaceMediaFromDate(tDate)).called(1);
  });
}
