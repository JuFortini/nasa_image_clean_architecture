import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nasa_image_clean_architecture/core/http_client/http_client.dart';
import 'package:nasa_image_clean_architecture/feature/data/datasources/space_media_datasource.dart';
import 'package:nasa_image_clean_architecture/feature/data/datasources/nasa_datasource_implementation.dart';

import '../../mocks/space_media_mock.dart';

class HttpClientMock extends Mock implements HttpClient {}

void main() {
  late ISpaceMediaDatasource datasource;
  late HttpClient client;

  setUp(() {
    client = HttpClientMock();
    datasource = NasaDatasourceImplementation(client);
  });

  final tDate = DateTime(2023, 08, 02);
  const urlExpected =
      'https://api.nasa.gov/planetary/apod?api_key=DEMO_KEY&date=2023-08-02';

  test('should call get method with correct url', () async {
    when(() => client.get(any())).thenAnswer(
      (_) async => HttpResponse(data: spaceMediaMock, statusCode: 200),
    );
    await datasource.getSpaceMediaFromDate(tDate);
    verify(() => client.get(urlExpected));
  });
}
