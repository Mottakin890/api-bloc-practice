import 'package:api_bloc_practice/data/services/api_service.dart';
import 'package:api_bloc_practice/domain/model/user_model.dart';
import 'package:api_bloc_practice/presentation/features/home/cubit/users_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UsersCubit extends Cubit<UsersState> {
  List<UserModel> userData = [];
  ApiService apiService;
  UsersCubit({required this.apiService}) : super(UserStateInitial());

  void getAllUserList() async {
    try {
      emit(UserStateLoading());
      userData = await apiService.getUserData();
      emit(UserStateLoaded(userlist: userData));
    } catch (e) {
      emit(UserStateError(message: e.toString()));
    }
  }
}
