part of 'house_cubit.dart';

enum StatusHouse {initial, loading, success, failure}

class HouseState extends Equatable {
  final HousesModel housesModel;
  final StatusHouse statusHouse;

  @override
  List<Object?> get props => [housesModel];

  const HouseState({
    required this.housesModel,
    required this.statusHouse,
  });

  HouseState copyWith({
    HousesModel? housesModel,
    StatusHouse? statusHouse,
  }) {
    return HouseState(
      housesModel: housesModel ?? this.housesModel,
      statusHouse: statusHouse ?? this.statusHouse,
    );
  }
}

