import 'dart:convert';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:non_stop_io/core/auth_check.dart';
import 'package:non_stop_io/models/api_result.model.dart';
import 'package:non_stop_io/models/product.model.dart';
import 'package:http/http.dart' as http;

abstract class PoroductRepo {
  Future<List<ProductModel>> getProducts();
}

class ProductRepoImpl implements PoroductRepo {
  @override
  Future<List<ProductModel>> getProducts() async {
    try {
      Fluttertoast.showToast(msg: 'Fetching data from server');
      var responce = await http.get(Uri.parse('${authUrl}beers'));

      if (responce.statusCode == 200) {
        Fluttertoast.showToast(msg: 'Data fetched successfully');
        var data = json.decode(responce.body);
        List<ProductModel> products = ApiResultModel.fromJson(data).products;
        return products;
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      Fluttertoast.showToast(msg: '$e Failed to load data');
      throw Exception(e.toString());
    }
  }
}
