import 'package:bazzar_app/features/Vendors/data/data_sources/vendor_remote_data_source.dart';
import 'package:bazzar_app/features/Vendors/data/models/vendor_model.dart';
import 'package:bazzar_app/features/Vendors/domain/repositories/vendor_repository.dart';

class VendorRepositoryImpl implements VendorRepository {
  final VendorRemoteDataSource vendorRemoteDataSource;

  VendorRepositoryImpl(this.vendorRemoteDataSource);

  @override
  Future<List<VendorModel>> getVendors() {
    return vendorRemoteDataSource.getVendors();
  }
}
