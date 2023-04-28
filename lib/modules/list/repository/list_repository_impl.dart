import 'package:house/modules/list/datasource/list_datasource.dart';

import '../model/list_houses_model.dart';
import 'list_repository.dart';

class ListRepositoryImpl implements ListRepository {
  final ListDatasource listDatasource;
  @override
  Future<ListHousesModel> listHouses(int page) async {
    try {
      final result = await listDatasource.listHouses(page);

      return ListHousesModel.fromMap(result.data);
    } catch (e) {
      throw Exception();
    }
  }

  const ListRepositoryImpl({
    required this.listDatasource,
  });

  @override
  Future<bool> deleteHouse(int id) async {
    try {
      final result = await listDatasource.deleteHouse(id);

      return result.data["success"] as bool;
    } catch (e) {
      throw Exception();
    }
  }
}