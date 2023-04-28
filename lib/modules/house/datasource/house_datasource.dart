
import 'package:dio/dio.dart';


abstract class HouseDatasource {
  Future<Response> getHouse(int id);
}