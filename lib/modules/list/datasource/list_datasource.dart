import 'package:dio/dio.dart';


abstract class ListDatasource {
  Future<Response> listHouses(int page);
  Future<Response> deleteHouse(int id);
}