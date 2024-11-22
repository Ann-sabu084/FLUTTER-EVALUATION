import 'package:flutter/material.dart';
import 'productdpage.dart';

class Productlpage extends StatelessWidget {
  final List<Map<String, dynamic>> products = [
    {
      "id": 1,
      "title": "Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops",
      "price": 109.95,
      "description":
          "Your perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday.",
      "category": "men's clothing",
      "image":
          "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg",
      "rating": {"rate": 3.9, "count": 120}
    },
    // Add more products as needed...
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Products"),
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return Card(
            child: ListTile(
              leading: Image.network(product["image"]),
              title: Text(product["title"]),
              subtitle: Text("\$${product["price"]}"),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                // Navigate to the Product Details page
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Productdpage(product: product),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
