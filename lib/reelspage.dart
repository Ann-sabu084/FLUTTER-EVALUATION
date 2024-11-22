import 'package:flutter/material.dart';

class reelspage extends StatelessWidget {
  const reelspage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.network(
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width,
              "https://images.unsplash.com/photo-1664566484452-03b6f3817fdc?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxmZWF0dXJlZC1waG90b3MtZmVlZHw3fHx8ZW58MHx8fHx8"),
          Positioned(
            right: 30,
            bottom: 100,
            child:Container(
              height: 250,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
             Icon(
              Icons.favorite,
              color: Colors.pink,
              size: 35,
            ),
          
          Icon(
            Icons.message,
            color: const Color.fromARGB(255, 255, 248, 250),
            size: 35,
          ),
          Icon(
            Icons.send,
            color: const Color.fromARGB(255, 234, 228, 230),
            size: 35,
          ),
                ],
          ),
        
          ),
          ),
          Positioned(
            left: 30,
            bottom: 100,
            child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                
            Text(
             "Ann_Mariya_sabu",
              style: TextStyle(color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(width: 20),
            
                     
            ElevatedButton(
              onPressed: () {
                
               
              },
              child: Text('Follow'),
            ),
                    ],
                  ),
          ),
        ],
    
     
      ),
    );
    
  }
}
