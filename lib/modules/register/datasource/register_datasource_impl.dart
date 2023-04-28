import 'package:dio/dio.dart';
import 'package:house/modules/register/datasource/register_datasource.dart';
import 'package:house/shared/model/houses_model.dart';

import '../../../shared/constants/urls_constants.dart';

class RegisterDatasourceImpl implements RegisterDatasource{
  final Dio dio;
  @override
  Future<Response> edit(HousesModel housesModel) async {
    return await dio.put("${UrlsConstants.baseUrl}/${housesModel.id}", data: housesModel.toMapEdit());
  }

  @override
  Future<Response> register(HousesModel housesModel) async {
    return await dio.post(UrlsConstants.baseUrl, data: housesModel.toMapRegister());
  }

  const RegisterDatasourceImpl({
    required this.dio,
  });
}