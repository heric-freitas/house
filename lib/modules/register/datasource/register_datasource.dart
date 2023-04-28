import 'package:dio/dio.dart';

import '../../../shared/model/houses_model.dart';

abstract class RegisterDatasource {
  Future<Response> edit(HousesModel housesModel);
  Future<Response> register(HousesModel housesModel);
}