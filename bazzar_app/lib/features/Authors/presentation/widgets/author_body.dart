// ignore_for_file: file_names

import 'package:bazzar_app/core/routes/app_routes.dart';
import 'package:bazzar_app/core/theme/app_text_style.dart';
import 'package:bazzar_app/features/Authors/presentation/cubit/author_cubit.dart';
import 'package:bazzar_app/features/Authors/presentation/cubit/author_state.dart';
import 'package:bazzar_app/features/home/presentation/widgets/categories_tabs.dart';
import 'package:bazzar_app/features/home/presentation/widgets/page_description_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AuthorBody extends StatelessWidget {
  const AuthorBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15),
      child: ListView(
        children: [
          PageDescriptionWidget(
            description: "Check the authors",
            subtitle: "Authors",
          ),
          SizedBox(height: 20),
          CategoriesTabs(
            categories: [
              "All",
              "Poets",
              "Playwrights",
              "Novelists",
              "Journalists",
            ],
          ),

          BlocBuilder<AuthorCubit, AuthorState>(
            builder: (context, state) {
              if (state is AuthorLoading) {
                return const Center(child: CircularProgressIndicator());
              }

              if (state is AuthorSuccess) {
                return ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: state.authors.length,
                  itemBuilder: (context, index) {
                    final author = state.authors[index];

                    return ListTile(
                      onTap: () {
                        context.push(
                          AppRoutes.authorDetailsScreen,
                          extra: state.authors[index],
                        );
                      },
                      leading: CircleAvatar(
                        backgroundImage: author.image != null
                            ? NetworkImage(author.image!)
                            : null,
                        child: author.image == null
                            ? const Icon(Icons.person)
                            : null,
                      ),
                      title: Text(author.name, style: AppTextStyles.h5),
                      subtitle: Text(author.description ?? ''),
                    );
                  },
                );
              }

              if (state is AuthorError) {
                return Center(child: Text(state.message));
              }

              return const SizedBox.shrink();
            },
          ),
        ],
      ),
    );
  }
}
