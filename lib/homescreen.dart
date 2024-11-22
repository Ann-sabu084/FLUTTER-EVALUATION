import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_1/productlist.dart';
import 'package:flutter_application_1/cartpage.dart';

class HomeScreen extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    void opendialogbox() {
    showDialog(
      context:context,
      builder: (context) {
        return AlertDialog(
          title: Text("hello"),
          content: SizedBox(
            height: 200,
            child: Column(
              children: [Text("this is a test alert box"), TextField()],
            ),
          ),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("ok"))
          ],
        );
      },
    );
  }
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      drawer: Drawer(
      
        backgroundColor: Colors.amber,
        child: ListView
        (children: [
          DrawerHeader(child: Text("WELCOME"),),
          ListTile(
            title: Text("Products"),
            onTap: () {
              
            },
          ),
          ListTile(
            title: Text("Cart"),
             onTap: () {
              
            },
          ),
          ListTile(
            title: Text("Search"),
             onTap: () {
              
            },
          ),
          ListTile(
            title: Text("Checkout"),
             onTap: () {
              
            },
          ),
        ],
          
        ),
       
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            
            // Welcome Message
            Text(
              'Welcome back!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Discover our latest products and deals.',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            SizedBox(height: 20),

            // Featured Products Section
            Text(
              'Featured Products',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                children: List.generate(4, (index) {
                  return GestureDetector(
                    onTap: () {
                      // Navigate to product details page
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProductListPage(),
                        ),
                      );
                    },
                    child: Card(
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.network(
                            'https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg',
                            height: 100,
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Product Title $index',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 5),
                          Text(
                            '\$${(index + 1) * 10}',
                            style: TextStyle(color: Colors.green),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
              ),
            ),
            Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  opendialogbox();
                },
                child: Text("show dialog")),
            
          ],
        ),
      ),

          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('carts')
                  .doc('user_id') // Replace with the actual user ID
                  .collection('items')
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Icon(Icons.shopping_cart);
                }
                final itemCount = snapshot.data?.docs.length ?? 0;
                return Stack(
                  children: [
                    Icon(Icons.shopping_cart),
                    if (itemCount > 0)
                      Positioned(
                        right: 0,
                        child: Container(
                          padding: EdgeInsets.all(2),
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          constraints: BoxConstraints(
                            minWidth: 16,
                            minHeight: 16,
                          ),
                          child: Text(
                            '$itemCount',
                            style: TextStyle(color: Colors.white, fontSize: 12),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                  ],
                );
              },
            ),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: 0,
        selectedItemColor: Colors.blueAccent,
        onTap: (index) {
          if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CartPage()),
            );
          }
        },
      ),
    );
  }
}
