import '../model/list_houses_model.dart';
import '../repository/list_repository.dart';

abstract class GetListHouses {
  Future<ListHousesModel> call(int page);
}

class GetListHousesImpl implements GetListHouses {
  final ListRepository listRepository;

  GetListHousesImpl({required this.listRepository});

  @override
  Future<ListHousesModel> call(int page) async {
    return await listRepository.listHouses(page);
  }
}