import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'entities/product.dart';
import 'product_item.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Fruits', style: TextStyle(color: Colors.black)),
        elevation: 0,
        backgroundColor: Colors.transparent,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      body: ListView.separated(
        itemCount: products.length,
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(
          vertical: height * 0.05,
          horizontal: width * 0.1,
        ),
        separatorBuilder: (_, __) => SizedBox(width: width * 0.15),
        itemBuilder: (_, i) {
          final product = products[i];
          return ProductItem(product);
        },
      ),
    );
  }
}
