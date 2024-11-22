import 'package:flutter/material.dart';

class Productdpage extends StatelessWidget {
  final Map<String, dynamic> product;

  Productdpage({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Product Details"),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              // Handle saving the product to a list or wishlist
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Product Image
              Center(
                child: Image.network(
                  product["image"],
                  height: 250,
                  width: 250,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 16),
              // Product Title
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    product["title"],
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.favorite_border),
                    onPressed: () {
                      // Handle adding to wishlist
                    },
                  ),
                ],
              ),
              SizedBox(height: 16),
              // Quantity Selector
              Row(
                children: [
                  Text(
                    "Quantity: ",
                    style: TextStyle(fontSize: 16),
                  ),
                  IconButton(
                    icon: Icon(Icons.remove),
                    onPressed: () {
                      // Decrease quantity
                    },
                  ),
                  Text("1", style: TextStyle(fontSize: 16)),
                  IconButton(
                    icon: Icon(Icons.add),
                    onPressed: () {
                      // Increase quantity
                    },
                  ),
                ],
              ),
              SizedBox(height: 16),
              // Product Price
              Text(
                "\$${product["price"]}",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
              SizedBox(height: 16),
              // Product Details
              Text(
                "Product Details:",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Text(
                product["description"],
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 16),
              // Reviews Section
              Text(
                "Reviews:",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  Icon(Icons.star, color: Colors.yellow),
                  Icon(Icons.star, color: Colors.yellow),
                  Icon(Icons.star, color: Colors.yellow),
                  Icon(Icons.star, color: Colors.yellow),
                  Icon(Icons.star_border, color: Colors.yellow),
                  SizedBox(width: 8),
                  Text(
                    "(${product["rating"]["count"]} reviews)",
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
              SizedBox(height: 32),
              // Add to Cart Button
              ElevatedButton(
                onPressed: () {
                  // Handle adding product to the cart
                },
                child: Text("Add to Cart"),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 14),
                  backgroundColor: Colors.blue,
                  textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
