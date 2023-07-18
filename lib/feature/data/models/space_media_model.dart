import 'package:nasa_image_clean_architecture/feature/domain/entities/space_media_entity.dart';

class SpaceMediaModel extends SpaceMediaEntity {
  const SpaceMediaModel({
    required super.title,
    required super.mediaUrl,
    required super.description,
    required super.mediaType,
  });

  factory SpaceMediaModel.fromJson(Map<String, dynamic> json) {
    return SpaceMediaModel(
      title: json['title'],
      mediaUrl: json['url'],
      description: json['explanation'],
      mediaType: json['media_type'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'url': mediaUrl,
      'explanation': description,
      'media_type': mediaType,
    };
  }
}
