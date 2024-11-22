import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/itemcart.dart';
import 'package:flutter_application_1/productdetails.dart';

class ProductCard extends StatelessWidget {
  final Map<String, dynamic> products;

   ProductCard({Key? key, required this.products}) : super(key: key);
List newcart=[];
  @override
  Widget build(BuildContext context) {
    void imagezoom(String imageUrl) {
      showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            child: Image.network(
              imageUrl,
              height: 200,
            ),
            backgroundColor: Colors.transparent,
          );
        },
      );
    }
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailsPage(productDetails: products),
          ),
        );
      },
      child: Card(
        margin: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              products["image"],
              height: 150,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                onTap: () {
                  imagezoom(products["image"]);
                },
                child: CircleAvatar(
                  backgroundImage: NetworkImage(products["image"]),
                ),
              ),
              Text("products"),
                  Text(
                    products["title"],
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    "\$${products["price"]}",
                    style: const TextStyle(color: Colors.green, fontSize: 16),
                  ),
                   ElevatedButton(
  onPressed: () async {
    final userId = FirebaseAuth.instance.currentUser!.uid; // Get current user ID

    final cartItem = CartItem(
      id: products["id"].toString(),
      name: products["title"],
      price: products["price"],

      quantity: 1,
    );

    await FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .update({"cart":FieldValue.arrayUnion([{"name":products["title"],"price":products["price"],"image":products["image"]}])});
       

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Added to cart!')));
  },
  child: Text('Add to Cart'),
)

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
