import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../model/list_houses_model.dart';
import '../../usecase/delete_house.dart';
import '../../usecase/get_list_houses.dart';

part 'list_house_state.dart';

class ListHouseCubit extends Cubit<ListHouseState> {
  final GetListHouses getListHousesUsecase;
  final DeleteHouse deleteHouse;
  ListHouseCubit({required this.getListHousesUsecase, required this.deleteHouse})
      : super(
          const ListHouseState(statusHouses: StatusHouses.initial, page: 1),
        );

  Future<void> getListHouses() async {
    try {
      emit(state.copyWith(statusHouses: StatusHouses.loading));
      final result = await getListHousesUsecase(state.page);
      emit(state.copyWith(
          statusHouses: StatusHouses.success, listHousesModel: result));
    } catch (e) {
      emit(state.copyWith(statusHouses: StatusHouses.failure));
    }
  }

  Future<void> deleteHouses(int id) async {
    try {
      emit(state.copyWith(statusHouses: StatusHouses.loading));
      await deleteHouse(id);
      emit(state.copyWith(
          statusHouses: StatusHouses.success));
    } catch (e) {
      emit(state.copyWith(statusHouses: StatusHouses.failure));
    }
  }

  nextPage() {
    if(state.page < state.listHousesModel!.totalPages){
      final nextPage = state.page + 1;
      emit(state.copyWith(page: nextPage, statusHouses: StatusHouses.initial));
    }
  }

  backPage() {
    if(state.page > 1){
      final backPage = state.page - 1;
      emit(state.copyWith(page: backPage, statusHouses: StatusHouses.initial));
    }
  }
}
