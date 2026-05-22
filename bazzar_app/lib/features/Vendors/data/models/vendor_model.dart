import 'package:bazzar_app/core/utils/app_assets.dart';

class VendorModel {
  final String name;
  final String logo;
  final double rate;

  VendorModel({required this.name, required this.logo, required this.rate});
}

List<VendorModel> dummyVendors = [
  VendorModel(name: "Wattpad", logo: AppAssets.logo, rate: 4.2),
  VendorModel(name: "Kuromi", logo: AppAssets.logo, rate: 4.8),
  VendorModel(name: "Gooday", logo: AppAssets.logo, rate: 4.1),
  VendorModel(name: "Crane & Co", logo: AppAssets.logo, rate: 3.4),
  VendorModel(name: "Jstor", logo: AppAssets.logo, rate: 4.0),
  VendorModel(name: "Wattpad", logo: AppAssets.logo, rate: 4.2),
  VendorModel(name: "Kuromi", logo: AppAssets.logo, rate: 4.8),
  VendorModel(name: "Gooday", logo: AppAssets.logo, rate: 4.1),
  VendorModel(name: "Crane & Co", logo: AppAssets.logo, rate: 3.4),
  VendorModel(name: "Wattpad", logo: AppAssets.logo, rate: 4.2),
  VendorModel(name: "Kuromi", logo: AppAssets.logo, rate: 4.8),
  VendorModel(name: "Gooday", logo: AppAssets.logo, rate: 4.1),
  VendorModel(name: "Crane & Co", logo: AppAssets.logo, rate: 3.4),
];
