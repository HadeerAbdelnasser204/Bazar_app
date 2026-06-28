import 'package:bazzar_app/core/Di/get_it.dart';
import 'package:bazzar_app/core/utils/app_assets.dart';
import 'package:bazzar_app/features/Books/presentation/cubit/book_cubit.dart';
import 'package:bazzar_app/features/Books/presentation/widgets/book_body.dart';
import 'package:bazzar_app/features/categories/presentation/cubit/categories_cubit.dart';
import 'package:bazzar_app/features/home/presentation/widgets/appBar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BooksScreen extends StatelessWidget {
  const BooksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(title: 'Books', iconPath: AppAssets.searchIcon),
      backgroundColor: Colors.white,
      body: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => sl<BookCubit>()..fetchAllBooks()),

          BlocProvider(
            create: (context) => sl<CategoryCubit>()..loadInitialData(),
          ),
        ],
        child: BooksBody(),
      ),
    );
  }
}
