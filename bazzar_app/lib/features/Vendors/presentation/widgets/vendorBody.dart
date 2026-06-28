import 'package:bazzar_app/core/theme/app_colors.dart';
import 'package:bazzar_app/features/Vendors/data/models/vendor_model.dart';
import 'package:bazzar_app/features/Vendors/presentation/cubit/vendor_cubit.dart';
import 'package:bazzar_app/features/Vendors/presentation/cubit/vendor_state.dart';
import 'package:bazzar_app/features/Vendors/presentation/widgets/vendor_details_widget.dart';
import 'package:bazzar_app/features/home/presentation/widgets/categories_tabs.dart';
import 'package:bazzar_app/features/home/presentation/widgets/page_description_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VendorBody extends StatelessWidget {
  const VendorBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15),
      child: ListView(
        children: [
          PageDescriptionWidget(
            description: "Our Vendors",
            subtitle: "Vendors",
          ),

          SizedBox(height: 15),
          // CategoriesTabs(
          //   categories: [
          //     "All",
          //     "Books",
          //     "Poems",
          //     "Special for you",
          //     "Stationery",
          //   ],
          // ),
          BlocBuilder<VendorCubit, VendorState>(
            builder: (context, state) {
              if (state is VendorLoading) {
                return Center(
                  child: CircularProgressIndicator(color: AppColors.grey500),
                );
              }
              if (state is VendorSuccess) {
                return GridView(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 15,
                    childAspectRatio: 0.6,
                  ),

                  children: List.generate(
                    dummyVendors.length,
                    (index) => VendorDetailsWidget(
                      image: dummyVendors[index].logo,
                      description: dummyVendors[index].name,
                      rate: dummyVendors[index].rate,
                    ),
                  ),
                );
              }

              return Center(child: Text("Error Can`t Fetch Data"));
            },
          ),
        ],
      ),
    );
  }
}
