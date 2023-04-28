part of 'register_cubit.dart';

enum StatusRegister {initial, loading, success, failure, isEdit, isRegister}

class RegisterState extends Equatable {

  final StatusRegister statusRegister;
  final HousesModel? housesModel;

  @override
  List<Object?> get props => [statusRegister, housesModel];

  const RegisterState({
    required this.statusRegister,
    this.housesModel,
  });

  RegisterState copyWith({
    StatusRegister? statusRegister,
    HousesModel? housesModel,
  }) {
    return RegisterState(
      statusRegister: statusRegister ?? this.statusRegister,
      housesModel: housesModel ?? this.housesModel,
    );
  }
}
