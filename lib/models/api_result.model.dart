import 'package:non_stop_io/models/product.model.dart';

class ApiResultModel {
  late String status;
  late int totalResult;
  late List<ProductModel> products;

  ApiResultModel(
      {required this.status,
      required this.totalResult,
      required this.products});

  ApiResultModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    totalResult = json['totalResult'];
    if (json['products'] != null) {
      products = <ProductModel>[];
      json['products'].forEach((v) {
        products.add(ProductModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['totalResult'] = totalResult;
    data['products'] = products.map((v) => v.toJson()).toList();
    return data;
  }
  
}
