import 'package:bazzar_app/core/Di/get_it.dart';
import 'package:bazzar_app/features/home/presentation/widgets/appBar_widget.dart';
import 'package:bazzar_app/features/home/presentation/widgets/bottom_navigation_Bar_widget.dart';
import 'package:bazzar_app/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:bazzar_app/features/profile/presentation/widgets/profile_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBarWidget(title: "Profile"),
      body: BlocProvider(
        create: (context) => sl<ProfileCubit>()..loadProfile(),
        child: ProfileBody(),
      ),
      bottomNavigationBar: BottomNavigationBarWidget(currentIndex: 3),
    );
  }
}
