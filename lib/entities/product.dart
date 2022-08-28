import 'package:flutter/material.dart' show Color, Colors;

class Product {
  const Product({
    required this.urlImage,
    required this.name,
    required this.price,
    required this.color,
  });

  final String urlImage;
  final String name;
  final int price;
  final Color color;
}

const products = <Product>[
  Product(
    urlImage:
        'https://cdn.pixabay.com/photo/2016/02/23/17/42/orange-1218158_1280.png',
    name: 'Orange',
    price: 5,
    color: Colors.orange,
  ),
  Product(
    urlImage:
        'https://i.pinimg.com/originals/c0/08/ed/c008ed639461cd203f82147847496366.png',
    name: 'Strawberry',
    price: 3,
    color: Colors.pink,
  ),
  Product(
    urlImage: 'https://www.pngmart.com/files/1/Banana-Icon-PNG.png',
    name: 'Banana',
    price: 5,
    color: Colors.yellow,
  ),
  Product(
    urlImage: 'https://www.picng.com/upload/apple/png_apple_8357.png',
    name: 'Apple',
    price: 5,
    color: Colors.red,
  ),
];
