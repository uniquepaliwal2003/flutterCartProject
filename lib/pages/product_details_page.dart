import "package:flutter/material.dart";
import 'package:shop_app_flutter/providers/cart_provider.dart';
import "package:provider/provider.dart";
class ProductDetailsPage extends StatefulWidget {
  final Map<String,Object>product;
  const ProductDetailsPage({
    super.key,
    required this.product
  });

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  int selectedSize = 0 ;


    void onTap() {
      if (selectedSize != 0) {
        Provider.of<CartProvider>(context, listen: false).addProduct(
          {
            'id': widget.product['id'],
            'title': widget.product['title'],
            'price': widget.product['price'],
            'imageUrl': widget.product['imageUrl'],
            'company': widget.product['company'],
            'size': selectedSize,
          },
        );
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Product added successfully ")));
      }else{
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Please select a size ")));
      }
    }

  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      appBar:  AppBar(
            title:const Text('Details'),
      ),
      body: Column(children: [
        Text(
          widget.product['title'] as String ,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Image.asset(widget.product['imageUrl'] as String , height: 250, ),
        ),
        const Spacer( flex: 2,),
        Container(
          height: 250,
          decoration: BoxDecoration(
            color :  const Color.fromARGB(255, 230, 229, 229),
            borderRadius: BorderRadius.circular(15)
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            Text(
              '\$${widget.product["price"]}',
                style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 50,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: (widget.product["sizes"] as List<int>).length ,
                itemBuilder: (context,index){
                  final size = (widget.product['sizes'] as List<int>)[index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedSize = size ;
                        });
                      },
                      child: Chip(
                        label: Text(size.toString()),
                        backgroundColor: size == selectedSize? Theme.of(context).colorScheme.primary : null,
                      ),
                    ),
                  );
                }
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: ElevatedButton.icon(
                onPressed: onTap,
                icon:const  Icon(Icons.shopping_cart ,color: Colors.black ,size:25) ,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  minimumSize: const Size(double.infinity, 50) 
                ),
                label: const Text(
                  'Add To Cart',
                  style: TextStyle( color: Colors.black ,fontSize: 18)
                )),
            )
          ]),
        )
      ],)
    );
  }
}