import 'package:flutter/material.dart';

abstract class ISection {
  String? name;
  String? description;

  String? ofType() {}
}
