import 'package:bazzar_app/features/Vendors/data/models/vendor_model.dart';

abstract class VendorRemoteDataSource {
  Future<List<VendorModel>> getVendors();
}

class VendorRemoteDataSourceImpl implements VendorRemoteDataSource {
  @override
  Future<List<VendorModel>> getVendors() async {
    await Future.delayed(const Duration(seconds: 2));

    return dummyVendors;
  }
}
