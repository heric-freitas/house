import '../../../shared/model/houses_model.dart';
import '../repository/register_repository.dart';

abstract class EditHouse {
  Future<bool> call(HousesModel housesModel);
}

class EditHouseImpl implements EditHouse{
  final RegisterRepository registerRepository;
  @override
  Future<bool> call(HousesModel housesModel) async {
    return await registerRepository.edit(housesModel);
  }

  const EditHouseImpl({
    required this.registerRepository,
  });
}