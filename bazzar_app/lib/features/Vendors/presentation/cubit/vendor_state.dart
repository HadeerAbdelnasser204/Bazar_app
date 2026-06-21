import 'package:bazzar_app/features/Vendors/data/models/vendor_model.dart';

abstract class VendorState {}

final class VendorInitial extends VendorState {}

final class VendorLoading extends VendorState {}

final class VendorSuccess extends VendorState {
  final List<VendorModel> vendors;
  VendorSuccess(this.vendors);
}

final class VendorError extends VendorState {
  final String message;
  VendorError(this.message);
}
