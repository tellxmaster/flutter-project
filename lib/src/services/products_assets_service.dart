import 'dart:convert';

import 'package:flutter/services.dart';

import '../models/Producto.dart';

class ProductsAssetsService {
  ProductsAssetsService();

  get developer => null;

  Future<List<Producto>?> getProducts() async {
    List<Producto> result = [];
    try {
      String content = await rootBundle.loadString("assets/data/products.json");
      List<dynamic> list = json.decode(content);

      for (var item in list) {
        var newProduct = Producto.fromJson(item);
        result.add(newProduct);
      }
      return result;
    } catch (e) {
      developer.log(e.toString());
      return null;
    }
  }
}
