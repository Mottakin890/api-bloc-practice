import 'package:api_bloc_practice/common/widgets/my_container.dart';
import 'package:api_bloc_practice/domain/model/user_model.dart';
import 'package:api_bloc_practice/presentation/features/home/cubit/users_cubit.dart';
import 'package:api_bloc_practice/presentation/features/home/cubit/users_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    context.read<UsersCubit>().getAllUserList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.grey[100],
        title: Text(
          'Users Directory',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
            color: Colors.blueGrey[800],
          ),
        ),
        centerTitle: true,
      ),
      body: BlocBuilder<UsersCubit, UsersState>(
        builder: (context, state) {
          if (state is UserStateLoading) {
            return Center(
              child: CupertinoActivityIndicator(
                radius: 20,
                color: Colors.blueGrey[600],
              ),
            );
          } else if (state is UserStateError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.error_outline, size: 64, color: Colors.red),
                  SizedBox(height: 16),
                  Text(
                    'Oops! Something went wrong',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    state.message.toString(),
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                ],
              ),
            );
          } else if (state is UserStateLoaded) {
            return ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              cacheExtent: 500, // Cache more items for smoother scrolling
              itemBuilder: (context, index) {
                UserModel userModel = state.userlist[index];
                return RepaintBoundary(child: UserCard(userModel: userModel));
              },
              itemCount: state.userlist.length,
            );
          } else {
            return Center(
              child: Text(
                'No users found',
                style: TextStyle(color: Colors.grey, fontSize: 16),
              ),
            );
          }
        },
      ),
    );
  }
}


