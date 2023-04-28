import '../../../shared/model/houses_model.dart';
import '../repository/house_repository.dart';

abstract class GetHouse {
  Future<HousesModel> call(int id);
}

class GetHouseImpl implements GetHouse {
  final HouseRepository repository;
  @override
  Future<HousesModel> call(int id) async {
    return await repository.getHouse(id);
  }

  const GetHouseImpl({
    required this.repository,
  });
}