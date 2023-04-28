part of 'list_house_cubit.dart';

enum StatusHouses {initial, loading, success, failure}

class ListHouseState extends Equatable{
  final ListHousesModel? listHousesModel;
  final StatusHouses statusHouses;
  final int page;

  List<Object?> get props => [listHousesModel, statusHouses, page];

  const ListHouseState({
    this.listHousesModel,
    required this.statusHouses,
    required this.page,
  });

  ListHouseState copyWith({
    ListHousesModel? listHousesModel,
    StatusHouses? statusHouses,
    int? page,
  }) {
    return ListHouseState(
      listHousesModel: listHousesModel ?? this.listHousesModel,
      statusHouses: statusHouses ?? this.statusHouses,
      page: page ?? this.page,
    );
  }
}
