import 'package:flutter/foundation.dart';

import '../enums/product_enum.dart';

class Product {
  final String? id;
  final String name;
  final String? description;
  final double price;
  final String? photo;
  final int? prepareTime;
  final ProductEnum type;
  final bool available;
  final DateTime? lastUpdate;
  final Uint8List? photoBytes;

  const Product({
    this.lastUpdate,
    required this.available,
    this.photo,
    this.id,
    required this.name,
    required this.description,
    required this.price,
    this.prepareTime,
    required this.type,
    this.photoBytes,
  });
}
