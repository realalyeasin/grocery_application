import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:grocery_application/Views/homepage.dart';
import 'package:grocery_application/Views/registration_login.dart';

import 'add_to_cart.dart';
class NavBar extends StatefulWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int _currentIndex=0;
  final List _screens=[HomePage(),AddToCart(price: 0.0,name: '',),Login(),];

  void _updateIndex(int value) {
    setState(() {
      _currentIndex = value;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Grocerry Application', style: TextStyle(letterSpacing: 1,color: Colors.white, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic,),),backgroundColor: Colors.black,),
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        unselectedLabelStyle: const TextStyle(color: Colors.white, fontSize: 12),
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: _updateIndex,
        backgroundColor: Colors.black,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        selectedFontSize: 13,
        unselectedFontSize: 13,
        iconSize: 30,
        items: const [
          BottomNavigationBarItem(
            backgroundColor: Colors.teal,
            label: "Products",
            icon: Icon(Icons.rice_bowl,color: Colors.white,),
          ),
          BottomNavigationBarItem(
            label: "Cart",
            icon: Icon(Icons.shopping_cart,color: Colors.white,),
          ),
          BottomNavigationBarItem(
            label: "Profile",
            icon: Icon(Icons.account_circle_outlined,color: Colors.white,),
          ),
        ],
      ),
      drawer: Drawer(
        backgroundColor: Colors.lightBlueAccent,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.black,),
                height: 250,

                child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network('https://static.vecteezy.com/system/resources/previews/000/247/823/original/grocery-shopping-illustration-vector.jpg', fit: BoxFit.cover,)),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Icon(Icons.home, color: Colors.pink,),
                        SizedBox(width: 10,),
                TextButton(child: Text('Home' , style: TextStyle(color: Colors.black)), onPressed: (){
                  Get.to(()=>HomePage());
                },)
                      ],
                    ),
                    Divider(),
                    Row(
                      children: [
                        Icon(Icons.rice_bowl, color: Colors.deepPurple,),
                        SizedBox(width: 10,),

                        TextButton(child: Text('Products', style: TextStyle(color: Colors.black)), onPressed: (){
                          Get.to(()=>HomePage());


                        },)
                      ],
                    ),
                    Divider(),
                    Row(
                      children: [
                        Icon(Icons.category, color: Colors.green,),
                        SizedBox(width: 10,),

                        TextButton(child: Text('Categories', style: TextStyle(color: Colors.black)),onPressed: (){},)
                      ],
                    ),
                    Divider(),
                    Row(
                      children: [
                        Icon(Icons.favorite, color: Colors.red,),
                        SizedBox(width: 10,),

                        TextButton(child: Text('Wishlist', style: TextStyle(color: Colors.black)), onPressed: (){},
                        )],
                    ),
                    Divider(),
                    Row(
                      children: [
                        Icon(Icons.design_services,color: Colors.indigo,),
                        SizedBox(width: 10,),

                        TextButton(child: Text('Services', style: TextStyle(color: Colors.black)), onPressed: (){},
                        )],
                    ),
                    Divider(),
                    Row(
                      children: [
                        Icon(Icons.policy,color: Colors.orangeAccent,),
                        SizedBox(width: 10,),
                        TextButton(child: Text('Terms & Conditions', style: TextStyle(color: Colors.black)), onPressed: (){

                        },)
                      ],
                    ),
                    Divider(),
                    Row(
                      children: [
                        Icon(Icons.login, color: Colors.yellow,),
                        SizedBox(width: 10,),
                        TextButton(child: Text('Login/Register', style: TextStyle(color: Colors.black),),onPressed: (){
                          Get.to(()=>Login());
                        },)
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
