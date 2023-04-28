
import '../../../shared/model/houses_model.dart';

abstract class HouseRepository {
  Future<HousesModel> getHouse(int id);
}