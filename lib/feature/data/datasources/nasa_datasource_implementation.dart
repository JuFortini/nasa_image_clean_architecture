import 'package:nasa_image_clean_architecture/core/http_client/http_client.dart';
import 'package:nasa_image_clean_architecture/core/utils/keys/nasa_api_keys.dart';
import 'package:nasa_image_clean_architecture/feature/data/datasources/endpoints/nasa_endpoints.dart';
import 'package:nasa_image_clean_architecture/feature/data/datasources/space_media_datasource.dart';
import 'package:nasa_image_clean_architecture/feature/data/models/space_media_model.dart';

class NasaDatasourceImplementation implements ISpaceMediaDatasource {
  final HttpClient client;

  NasaDatasourceImplementation(this.client);

  @override
  Future<SpaceMediaModel> getSpaceMediaFromDate(DateTime date) async {
    await client.get(NasaEndpoints.apod(NasaApiKeys.apiKey(), date));
  }
}
