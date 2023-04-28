import '../repository/list_repository.dart';

abstract class DeleteHouse {
  Future<bool> call(int id);
}

class DeleteHouseImpl implements DeleteHouse{
  final ListRepository registerRepository;
  @override
  Future<bool> call(int id) async {
    return await registerRepository.deleteHouse(id);
  }

  const DeleteHouseImpl({
    required this.registerRepository,
  });
}