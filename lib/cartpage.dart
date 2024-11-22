import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Cart'),
        backgroundColor: Colors.blueAccent,
      ),
      body: StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
            .collection("users")
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (!snapshot.hasData || snapshot.data!['cart'] == null) {
            return const Center(child: Text('Your cart is empty.'));
          }

          var cartItems = snapshot.data!['cart'];
          return ListView.builder(
            padding: const EdgeInsets.all(8.0),
            itemCount: cartItems.length,
            itemBuilder: (context, index) {
              var item = cartItems[index];
              return Card(
                margin: const EdgeInsets.symmetric(vertical: 8.0),
                elevation: 5.0,
                child: ListTile(
                  contentPadding: const EdgeInsets.all(8.0),
                  leading: item['image'] != null
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.network(
                            item['image'],
                            width: 50,
                            height: 50,
                            fit: BoxFit.cover,
                          ),
                        )
                      : const Icon(Icons.image, size: 50, color: Colors.grey),
                  title: Text(item["name"],
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      )),
                  subtitle: Text('\$${item["price"]}',
                      style: TextStyle(color: Colors.green)),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete_forever, color: Colors.red),
                    onPressed: () {
                      FirebaseFirestore.instance
                          .collection("users")
                          .doc(FirebaseAuth.instance.currentUser!.uid)
                          .update({
                        "cart": FieldValue.arrayRemove([item]),
                      });
                    },
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
