import 'package:bazzar_app/core/Di/get_it.dart';
import 'package:bazzar_app/core/routes/app_routes.dart';
import 'package:bazzar_app/core/utils/app_assets.dart';
import 'package:bazzar_app/features/home/presentation/widgets/appBar_widget.dart';
import 'package:bazzar_app/features/search/presentation/cubit/search_cubit.dart';
import 'package:bazzar_app/features/search/presentation/widgets/search-body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBarWidget(
        title: "Search",
        leadingIconPath: AppAssets.arrowBackIcon,
        leadingOnPressed: () {
          context.go(AppRoutes.categoryScreen);
        },
      ),
      body: BlocProvider(
        create: (context) => sl<SearchCubit>()..loadHistory(),
        child: SearchBody(),
      ),
    );
  }
}
