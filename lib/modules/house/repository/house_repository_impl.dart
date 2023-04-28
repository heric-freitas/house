import 'package:house/shared/model/houses_model.dart';

import '../datasource/house_datasource.dart';
import 'house_repository.dart';

class HouseRepositoryImpl implements HouseRepository {
  final HouseDatasource houseDatasource;

  const HouseRepositoryImpl({
    required this.houseDatasource,
  });

  @override
  Future<HousesModel> getHouse(int id) async {
    try {
      print("object");
      final result = await houseDatasource.getHouse(id);
      print("object asdasdsad");
      return HousesModel.fromMap(result.data['data']);
    } catch (e) {
      throw Exception();
    }
  }
}