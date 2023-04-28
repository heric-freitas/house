import '../../../shared/model/houses_model.dart';
import '../repository/register_repository.dart';

abstract class RegisterHouse {
  Future<bool> call(HousesModel housesModel);
}

class RegisterHouseImpl implements RegisterHouse {
  final RegisterRepository registerRepository;
  @override
  Future<bool> call(HousesModel housesModel) async {
    return await registerRepository.register(housesModel);
  }

  const RegisterHouseImpl({
    required this.registerRepository,
  });
}
