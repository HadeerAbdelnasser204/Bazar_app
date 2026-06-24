import 'package:bazzar_app/features/Vendors/domain/use_cases/get_vendor_use_case.dart';
import 'package:bazzar_app/features/Vendors/presentation/cubit/vendor_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VendorCubit extends Cubit<VendorState> {
  final GetVendorUseCase vendorUseCase;
  VendorCubit(this.vendorUseCase) : super(VendorInitial());

  Future<void> fetchVendors() async {
    emit(VendorLoading());
    await Future.delayed(const Duration(seconds: 2));
    try {
      final vendors = await vendorUseCase();
      emit(VendorSuccess(vendors));
    } catch (e) {
      emit(VendorError(e.toString()));
    }
  }
}
