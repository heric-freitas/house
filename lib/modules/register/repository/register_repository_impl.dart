import 'package:house/modules/register/datasource/register_datasource.dart';
import 'package:house/shared/model/houses_model.dart';

import 'register_repository.dart';

class RegisterRepositoryImpl implements RegisterRepository {
  final RegisterDatasource registerDatasource;
  @override
  Future<bool> edit(HousesModel housesModel) async {
    try{
      final result = await registerDatasource.edit(housesModel);
      return result.data['success'] as bool;
    } catch (e) {
      throw Exception();
    }
  }

  @override
  Future<bool> register(HousesModel housesModel) async {
    try {
      final result = await registerDatasource.register(housesModel);
      return result.data['success'] as bool;
    } catch (e){
      throw Exception();
    }
  }

  const RegisterRepositoryImpl({
    required this.registerDatasource,
  });
}