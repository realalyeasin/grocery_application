import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';

class AddToCart extends StatefulWidget {
  AddToCart({Key? key, required this.name, required this.price})
      : super(key: key);
  String name;
  double price;
  @override
  State<AddToCart> createState() => _AddToCartState();
}


class _AddToCartState extends State<AddToCart> {
  var q =1;
  var pp;
  var p;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        title: Text('Carts'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
            Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.deepPurple.withOpacity(.6),),

              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text('${widget.name}',style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(icon: Icon(Icons.remove_circle),onPressed: (){
                          if(q>1)q--;
                          setState(() {
                          });
                        },
                        ),
                        Text('${ widget.price == 0.0 ? 0 : q}'),
                        IconButton(icon: Icon(Icons.add_circle),onPressed: (){
                          q++;
                          widget.price = widget.price + widget.price;
                          setState(() {

                          });
                        },
                        ),
                      ],
                    ),
                    Text('${widget.price}'" tk", style: TextStyle(fontWeight: FontWeight.bold),)

                  ],
                ),
              ),
            ),
            ElevatedButton(onPressed: (){
            }, child: Text('Order Now'), style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.deepPurple)),)
          ]),
        ),
      ),
    );
  }
}
