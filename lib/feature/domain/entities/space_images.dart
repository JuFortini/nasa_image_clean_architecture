import 'package:equatable/equatable.dart';

class SpaceImages extends Equatable {
  final String title;
  final String mediaUrl;
  final String description;
  final String mediaType;

  const SpaceImages({
    required this.title,
    required this.mediaUrl,
    required this.description,
    required this.mediaType,
  });

  @override
  List<Object?> get props => [
        title,
        mediaUrl,
        description,
        mediaType,
      ];
}
