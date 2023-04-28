
import '../model/list_houses_model.dart';

abstract class ListRepository {
  Future<ListHousesModel> listHouses(int page);
  Future<bool> deleteHouse(int id);
}