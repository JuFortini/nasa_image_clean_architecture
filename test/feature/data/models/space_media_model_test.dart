import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:nasa_image_clean_architecture/feature/data/models/space_media_model.dart';
import 'package:nasa_image_clean_architecture/feature/domain/entities/space_media_entity.dart';

import '../../mocks/space_media_mock.dart';

void main() {
  const tSpaceMediaModel = SpaceMediaModel(
    title: 'Test media title',
    mediaUrl:
        'https://images.unsplash.com/photo-1454789548928-9efd52dc4031?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=580&q=80',
    description: 'Test media description',
    mediaType: 'image',
  );

  test('should be a subclass of SpaceMediaEntity', () {
    expect(tSpaceMediaModel, isA<SpaceMediaEntity>());
  });

  test('should return a valid model', () {
    final Map<String, dynamic> jsonMap = json.decode(spaceMediaMock);
    final result = SpaceMediaModel.fromJson(jsonMap);
    expect(result, tSpaceMediaModel);
  });

  test('should return a json map containing the proper data', () {
    final expectedMap = {
      "explanation": "Test media description",
      "media_type": "image",
      "title": "Test media title",
      "url":
          "https://images.unsplash.com/photo-1454789548928-9efd52dc4031?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=580&q=80"
    };
    final result = tSpaceMediaModel.toJson();
    expect(result, expectedMap);
  });
}
