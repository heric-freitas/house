import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../shared/model/houses_model.dart';
import '../../usecase/get_house.dart';

part 'house_state.dart';

class HouseCubit extends Cubit<HouseState> {
  final GetHouse getHouse;
  HouseCubit({required this.getHouse}) : super(const HouseState(
    housesModel: HousesModel(),
    statusHouse: StatusHouse.initial,
  ));

  Future<void> init(int id) async{
    try{
      emit(state.copyWith(statusHouse: StatusHouse.loading));
      final result = await getHouse(id);
      emit(state.copyWith(statusHouse: StatusHouse.success, housesModel: result));
    } catch (e) {
      emit(state.copyWith(statusHouse: StatusHouse.failure));
    }
  }
}
