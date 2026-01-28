import 'package:api_bloc_practice/data/services/api_service.dart';
import 'package:api_bloc_practice/presentation/features/home/cubit/users_cubit.dart';
import 'package:api_bloc_practice/presentation/features/home/view/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ApiBlocPractice extends StatelessWidget {
  const ApiBlocPractice({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=> UsersCubit(apiService: ApiService())),
      ],
      child: MaterialApp(home: HomeScreen(), debugShowCheckedModeBanner: false),
    );
  }
}
