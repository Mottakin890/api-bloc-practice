// ignore_for_file: must_be_immutable

import 'package:api_bloc_practice/domain/model/user_model.dart';
import 'package:equatable/equatable.dart';

abstract class UsersState extends Equatable {
  const UsersState();
}

class UserStateInitial extends UsersState {
  @override
  List<Object?> get props => [];
}

class UserStateLoading extends UsersState {
  @override
  List<Object?> get props => [];
}

class UserStateLoaded extends UsersState {
  List<UserModel> userlist;
  UserStateLoaded({required this.userlist});
  @override
  List<Object?> get props => [userlist];
}

class UserStateError extends UsersState {
  String message;
  UserStateError({required this.message});
  @override
  List<Object?> get props => [message];
}
