import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/itemcart.dart';

class ProductDetailsPage extends StatelessWidget {

  final Map<String, dynamic> productDetails;

   ProductDetailsPage({Key? key, required this.productDetails}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(productDetails["title"]),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              productDetails["image"],
              height: 250,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 16),
            Text(
              productDetails["title"],
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              "\$${productDetails["price"]}",
              style: const TextStyle(fontSize: 20, color: Colors.green),
            ),
            const SizedBox(height: 16),
            Text(
              productDetails["description"],
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            Text(
              "Category: ${productDetails["category"]}",
              style: const TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
            ),
          
          ],
        ),
      ),
    );
  }
}
