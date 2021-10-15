import 'package:frontend/api/api_client.dart';
import 'package:frontend/api/api_response.dart';
import 'package:frontend/api/authentication/session.dart';
import 'package:frontend/models/bucket.dart';

class Repositories {
  String token;
  ApiClient apiClient = ApiClient();
  UserSession session = UserSession();

  Repositories({required this.token});

  Future<List<Bucket>> getBuckets() async {
    ApiResponse apiResponse =
        await apiClient.get(endpoint: 'bucket/', token: token);
    if (!apiResponse.wasSuccessful()) {
      // TODO: Handle response errors
      return <Bucket>[];
    }

    return Bucket.fromMapList(apiResponse.getDataAsList());
  }

  Future<Bucket> getBucket(String id) async {
    ApiResponse apiResponse =
        await apiClient.get(endpoint: "bucket/$id/", token: token);
    if (!apiResponse.wasSuccessful()) {
      // TODO: Handle response errors
      throw Exception(apiResponse.getError());
    }

    return Bucket.fromMap(apiResponse.getDataAsMap());
  }

  Future<ApiResponse> saveBucket(Bucket bucket) async {
    return await apiClient.put(
        endpoint: "bucket/${bucket.id}/",
        token: token,
        payload: bucket.toMap());
  }
}
