import 'package:flutter/material.dart';

class HomeBox {
  final String label;
  final int number;

  HomeBox({required this.label, required this.number});
}

List<HomeBox> homeBoxList = [
  HomeBox(label: 'Eligible Leads', number: 12),
  HomeBox(label: 'Validated Pending Delivery', number: 5),
  HomeBox(label: 'Pending Installation', number: 5),
  HomeBox(label: 'Customers', number: 378),
];
