import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';

import '../models/Producto.dart';
import '../services/products_assets_service.dart';

class ListProducts extends StatefulWidget {
  const ListProducts({super.key});

  @override
  State<ListProducts> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<ListProducts> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: _products == null
          ? const Center(child: Text("Descargando productos"))
          : _products!.isEmpty
              ? const Center(child: Text("No hay productos"))
              : ListView(
                  children: _products!
                      .map((e) => ListTile(
                          title: Text(e.name.toString()),
                          onTap: (/* react to the title being tapped */) {}))
                      .toList()),
    );
  }

  List<Producto>? _products;
  loadProductsFromAssets() async {
    var service = ProductsAssetsService();
    _products = await service.getProducts();
    if (mounted) {
      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();
    loadProductsFromAssets();
  }
}
