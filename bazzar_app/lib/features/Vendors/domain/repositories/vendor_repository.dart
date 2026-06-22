import 'package:bazzar_app/features/Vendors/data/models/vendor_model.dart';

abstract class VendorRepository {
  Future<List<VendorModel>> getVendors();
}
