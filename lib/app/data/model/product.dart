import 'package:get/state_manager.dart';

class ProductData {
  final String? productId;
  final String? productName;
  final String? productDescription;
  final double? productPrice;
  final String? productImagePath;
  RxBool? isFavorite;

  ProductData({
    required this.productId,
    required this.productName,
    required this.productDescription,
    required this.productPrice,
    required this.productImagePath,
    this.isFavorite,
  });
}
