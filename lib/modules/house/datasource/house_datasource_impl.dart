import 'package:dio/dio.dart';

import '../../../shared/constants/urls_constants.dart';
import 'house_datasource.dart';

class HouseDatasourceImpl implements HouseDatasource {
  final Dio dio;
  @override
  Future<Response> getHouse(int id) {
    try {
      return dio.get("{$UrlsConstants.baseUrl}/{$id}");
    } catch (e) {
      throw Exception();
    }
  }

  const HouseDatasourceImpl({
    required this.dio,
  });
}