import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/productdpage.dart';  // Assuming this is your product detail page

class HomePage extends StatelessWidget {
  final List<Map<String, dynamic>> products = [
    {
      "id": 1,
      "title": "Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops",
      "price": 109.95,
      "description": "Your perfect pack for everyday use and walks in the forest.",
      "category": "men's clothing",
      "image": "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg",
      "rating": {"rate": 3.9, "count": 120},
    },
    {
      "id": 2,
      "title": "Mens Casual Premium Slim Fit T-Shirts",
      "price": 22.3,
      "description": "Slim-fitting style, lightweight & soft fabric.",
      "category": "men's clothing",
      "image": "https://fakestoreapi.com/img/71-3HjGNDUL._AC_SY879._SX._UX._SY._UY_.jpg",
      "rating": {"rate": 4.1, "count": 259},
    },
    {
      "id": 3,
      "title": "John Hardy Women's Legends Naga Gold & Silver Dragon Bracelet",
      "price": 695,
      "description": "Mythical water dragon protects the ocean's pearl.",
      "category": "jewelery",
      "image": "https://fakestoreapi.com/img/71pWzhdJNwL._AC_UL640_QL65_ML3_.jpg",
      "rating": {"rate": 4.7, "count": 52},
    },
    {
      "id": 4,
      "title": "Mens Casual Slim Fit",
      "price": 15.99,
      "description":
          "The color could be slightly different between on the screen and in practice. / Please note that body builds vary by person, therefore, detailed size information should be reviewed below on the product description.",
      "category": "men's clothing",
      "image": "https://fakestoreapi.com/img/71YXzeOuslL._AC_UY879_.jpg",
      
    },
  
    // Add more products here...
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 241, 242, 242),
        title: Center(child: Text("Home", style: TextStyle(color: Colors.black))),
        leading: IconButton(
          icon: Icon(Icons.search),
          onPressed: () {
            // Search icon action
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Search TextField
            Padding(
              padding: EdgeInsets.all(16.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search store',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
              ),
            ),
            // Carousel Slider
            Container(
              height: 300,
              width: 650,
              child: CarouselSlider(
                items: products.map((product) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Stack(
                        children: [
                          Image.network(
                            product["image"],
                            height: 200,
                          ),
                          Positioned(
                            bottom: 10,
                            left: 10,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  product["title"],
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: const Color.fromARGB(255, 17, 17, 17),
                                    shadows: [
                                      Shadow(
                                        blurRadius: 10.0,
                                        color: Colors.black,
                                        offset: Offset(2.0, 2.0),
                                      ),
                                    ],
                                  ),
                                ),
                                Text(
                                  "\$${product['price']}",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.green,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    },
                  );
                }).toList(),
                options: CarouselOptions(
                  autoPlay: true,
                  enlargeCenterPage: true,
                  viewportFraction: 1.0,
                ),
              ),
            ),
            // Exclusive Offers Heading
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Exclusive Offers",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            // Exclusive Offers (Dynamic Data)
            Padding(
              padding: const EdgeInsets.all(40.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: products.map((product) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Productdpage(product: product),
                          ),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(right: 250.0), // Space between cards
                        child: ExclusiveOfferCard(
                          product["title"],
                          product["image"],
                          '\$${product['price']}',
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
            // Best Selling Heading
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Best Selling",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            // Best Selling Products (Dynamic Data)
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: products.map((product) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Productdpage(product: product),
                          ),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(right: 250.0), // Space between cards
                        child: BestSellingCard(
                          product["title"],
                          product["image"],
                          '\$${product['price']}',
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
          ],
        ),
      ),
      // Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.shop),
            label: 'Shop',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.explore),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Account',
          ),
        ],
        selectedItemColor: const Color.fromARGB(255, 26, 211, 69),
        unselectedItemColor: Colors.black,
        onTap: (index) {
          // Handle Bottom Navigation Bar tap
        },
      ),
    );
  }

  // Exclusive Offer Card Widget
  Widget ExclusiveOfferCard(String title, String imagePath, String price) {
    return Container(
      width: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey[200],
      ),
      child: Stack(
        children: [
          // Card Image
          Image.network(imagePath, height: 100),
          // Card Text and Price
          Positioned(
            bottom: 10,
            left: 10,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: TextStyle(fontWeight: FontWeight.bold,fontSize: 10)),
                Text(price, style: TextStyle(color: Colors.green)),
              ],
            ),
          ),
          // Plus Button at the bottom-left corner
          Positioned(
            bottom: 10,
            left: 5,
            child: IconButton(
              icon: Icon(Icons.add_circle, color: Colors.green),
              onPressed: () {
                // Action for adding the product to cart or favorites
              },
            ),
          ),
        ],
      ),
    );
  }

  // Best Selling Card Widget
  Widget BestSellingCard(String title, String imagePath, String price) {
    return Container(
      width: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey[200],
      ),
      child: Stack(
        children: [
          // Card Image
          Image.network(imagePath, height: 100, ),
          // Card Text and Price
          Positioned(
            bottom: 10,
            right: 10,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: TextStyle(fontWeight: FontWeight.bold,fontSize: 10)),
                Text(price, style: TextStyle(color: Colors.green)),
              ],
            ),
          ),
          // Plus Button at the bottom-left corner
          Positioned(
            bottom: 10,
            right: 5,
            child: IconButton(
              icon: Icon(Icons.add_circle, color: Colors.green,),
              onPressed: () {
                // Action for adding the product to cart or favorites
              },
            ),
          ),
        ],
      ),
    );
  }
}
