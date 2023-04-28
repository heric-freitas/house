import '../../../shared/model/houses_model.dart';

abstract class RegisterRepository {
  Future<bool> edit(HousesModel housesModel);
  Future<bool> register(HousesModel housesModel);
}