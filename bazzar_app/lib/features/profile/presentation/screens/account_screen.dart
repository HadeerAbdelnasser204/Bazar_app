import 'package:bazzar_app/core/Di/get_it.dart';
import 'package:bazzar_app/core/utils/app_assets.dart';
import 'package:bazzar_app/features/home/presentation/widgets/appBar_widget.dart';
import 'package:bazzar_app/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:bazzar_app/features/profile/presentation/widgets/account_image_section.dart';
import 'package:bazzar_app/features/profile/presentation/widgets/account_info_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBarWidget(
        title: "My Account",
        leadingIconPath: AppAssets.arrowBackIcon,
        leadingOnPressed: () {
          context.pop();
        },
      ),
      body: BlocProvider(
        create: (context) => sl<ProfileCubit>()..loadProfile(),
        child: ListView(
          children: [AccountImageSection(), AccountInfoSection()],
        ),
      ),
    );
  }
}
