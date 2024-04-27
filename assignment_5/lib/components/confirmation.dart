import 'package:flutter/material.dart';

class ConfirmationPage extends StatelessWidget {
  final String productName;
  final double productPrice;
  final int productQuantity;
  final String deliveryAddress;
  final String deliveryTime;
  final String orderDate;

  ConfirmationPage({
    required this.productName,
    required this.productPrice,
    required this.productQuantity,
    required this.deliveryAddress,
    required this.deliveryTime,
    required this.orderDate,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Order Confirmation'),
        backgroundColor: const Color.fromARGB(255, 97, 170, 70),
        centerTitle: true,
        foregroundColor: Colors.white,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Product Name: $productName'),
          Text('Product Price: \$${productPrice.toStringAsFixed(2)}'),
          Text('Product Quantity: $productQuantity'),
          Text('Delivery Address: $deliveryAddress'),
          Text('Delivery Time: $deliveryTime'),
          Text('Order Date: $orderDate'),
        ],
      ),
    );
  }
}
