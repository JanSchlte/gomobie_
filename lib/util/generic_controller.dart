import 'package:flutter/material.dart';

class GenericController<E> extends ValueNotifier<E> {
  GenericController({E value}) : super(value);
}
