import 'package:bazzar_app/features/Vendors/data/data_sources/vendor_remote_data_source.dart';
import 'package:bazzar_app/features/Vendors/data/models/vendor_model.dart';

class VendorRepositoryImpl {
  final VendorRemoteDataSource vendorRemoteDataSource;

  VendorRepositoryImpl(this.vendorRemoteDataSource);

  Future<List<VendorModel>> getVendors() {
    return vendorRemoteDataSource.getVendors();
  }
}
