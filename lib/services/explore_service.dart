import 'package:myapp/models/reponses/monument_response.dart';
import 'package:myapp/services/base_service.dart';

class ExploreService extends BaseService {
  ExploreService() : super('explore');

  Future<MonumentResponse> getMonuments() async {
    late MonumentResponse _response;
    try {
      var _dioResponse = await dio.get(
        serviceBuilder.addParam("monuments").build(),
        options: options,
      );
      print(_dioResponse);

      _response = MonumentResponse.fromJson(_dioResponse.data);
    } catch (e) {
      //TODO:error handling
      _response = MonumentResponse(monuments: []);
      throw Exception(e.toString());
    }

    return _response;
  }
}
