import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:house/shared/navigation/routes.dart';

import '../../../../shared/model/houses_model.dart';
import '../../usecase/edit_house.dart';
import '../../usecase/register_house.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final EditHouse editHouse;
  final RegisterHouse registerHouse;
  RegisterCubit({
    required this.registerHouse,
    required this.editHouse,
  }) : super(const RegisterState(statusRegister: StatusRegister.initial, housesModel: HousesModel()));

  void init(String route, {HousesModel? housesModel}) {
    route == Routes.editHouse
        ? emit(state.copyWith(
            statusRegister: StatusRegister.isEdit,
            housesModel: state.housesModel?.copyWith(
                name: housesModel!.name,
                id: housesModel.id,
                active: housesModel.active,
                order: housesModel.order)))
        : emit(state.copyWith(statusRegister: StatusRegister.isRegister));
  }

  Future<void> registerOrEditHouse(String name) async {
    try {
      emit(state.copyWith(
          statusRegister: StatusRegister.loading,
          housesModel: state.housesModel!.copyWith(name: name)));
      isEdit
          ? await editHouse(state.housesModel!)
          : await registerHouse(state.housesModel!);
      emit(state.copyWith(statusRegister: StatusRegister.success));
    } catch (e) {
      emit(state.copyWith(statusRegister: StatusRegister.failure));
    }
  }

  bool get isEdit => state.statusRegister == StatusRegister.isEdit;
}
