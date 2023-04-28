import 'package:equatable/equatable.dart';

class HousesModel extends Equatable {

  final int? id;
  final String? name;
  final int? active;
  final int? order;

  List<Object?> get props => [id,name,active,order];

  HousesModel copyWith({
    int? id,
    String? name,
    int? active,
    int? order,
  }) {
    return HousesModel(
      id: id ?? this.id,
      name: name ?? this.name,
      active: active ?? this.active,
      order: order ?? this.order,
    );
  }

  @override
  String toString() {
    return 'HousesModel{id: $id, name: $name, active: $active, order: $order}';
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'active': active,
      'order': order,
    };
  }

  Map<String, dynamic> toMapRegister() {
    return {
      "house_rules" : {
        'name': name,
        'active': 1,
      }
    };
  }

  Map<String, dynamic> toMapEdit() {
    return {
      "house_rules" : {
        'name': name,
        'active': 0,
      }
    };
  }

  factory HousesModel.fromMap(Map<String, dynamic> map) {
    return HousesModel(
      id: map['id'] as int,
      name: map['name'] as String,
      active: map['active'] as int,
      order: map['order'] as int,
    );
  }

  const HousesModel({
    this.id,
    this.name,
    this.active,
    this.order,
  });
}