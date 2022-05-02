import 'dart:io';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:myapp/utils/helper/endpoint_builder.dart';

abstract class BaseService {
  final Dio dio = Dio();
  EndpointBuilder serviceBuilder = EndpointBuilder();

  Options options = Options(contentType: 'application/json', headers: {
    "Authorization": "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6ImF5YXoiLCJpYXQiOjE2MzkwNTczMDMsImV4cCI6NjY0MzkwNTczMDN9.sDCKvhAHWNgqPEG2PNKTrWBbZ41kTbVn7lJLl2QvRp0"//(DbService.getAuthToken() ?? ""),
  });

  BaseService(String path) {
    serviceBuilder.addParam(path).saveCurrentParams();

    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };
  }
}
