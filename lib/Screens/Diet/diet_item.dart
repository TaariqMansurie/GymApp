// class Diet{
//   final int id;
//   final String name;
//   final String imagePath;
//   final double price;
//
//   Diet({
//     this.id,
//     this.name,
//     this.imagePath,
//     this.price,
//   });
// }
import 'package:flutter/cupertino.dart';

class DietItem {
  final int id;
  final String name;
  final String imagePath;
  final double price;
  final IconData lock ;


  DietItem({
    this.id,
    this.name,
    this.imagePath,
    this.price,
    this.lock,
  });
}