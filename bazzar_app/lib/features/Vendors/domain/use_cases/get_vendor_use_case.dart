import 'package:bazzar_app/features/Vendors/data/models/vendor_model.dart';
import 'package:bazzar_app/features/Vendors/domain/repositories/vendor_repository.dart';

class GetVendorUseCase {
  final VendorRepository repository;

  GetVendorUseCase(this.repository);

  Future<List<VendorModel>> call() async {
    return await repository.getVendors();
  }
}
