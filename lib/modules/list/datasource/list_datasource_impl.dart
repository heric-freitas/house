import 'package:dio/dio.dart';

import '../../../../shared/constants/urls_constants.dart';
import 'list_datasource.dart';

class ListDatasourceImpl implements ListDatasource{
  final Dio dio;
  @override
  Future<Response> listHouses(int page) async {
    try {
      return dio.get(UrlsConstants.baseUrl, queryParameters: {"page" : page});
    } catch (e) {
      throw Exception();
    }
  }

  const ListDatasourceImpl({
    required this.dio,
  });

  @override
  Future<Response> deleteHouse(int id) async {
    try {
      return dio.delete("${UrlsConstants.baseUrl}/{$id}",);
    } catch (e) {
      throw Exception();
    }
  }
}