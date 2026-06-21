import 'package:bazzar_app/features/Vendors/data/repositories/vendor_repository_impl.dart';
import 'package:bazzar_app/features/Vendors/presentation/cubit/vendor_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VendorCubit extends Cubit<VendorState> {
  final VendorRepositoryImpl vendorRepository;
  VendorCubit(this.vendorRepository) : super(VendorInitial());

  Future<void> fetchVendors() async {
    emit(VendorLoading());
    await Future.delayed(const Duration(seconds: 2));
    try {
      final vendors = await vendorRepository.getVendors();
      emit(VendorSuccess(vendors));
    } catch (e) {
      emit(VendorError(e.toString()));
    }
  }
}
