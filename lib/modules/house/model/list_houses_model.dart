import '../../../shared/model/houses_model.dart';

class ListHousesModel {
  final List<HousesModel> list;
  final int totalPages;

  const ListHousesModel({
    required this.list,
    required this.totalPages,
  });

  Map<String, dynamic> toMap() {
    return {
      'list': list,
      'totalPages': totalPages,
    };
  }

  factory ListHousesModel.fromMap(Map<String, dynamic> map) {
    return ListHousesModel(
      list: (map['data']["entities"] as List).map((e) => HousesModel.fromMap(e)).toList(),
      totalPages: map['data']['pagination']['total_pages'] as int,
    );
  }
}