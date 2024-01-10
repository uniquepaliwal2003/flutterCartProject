import 'package:flutter/material.dart';
import 'package:shop_app_flutter/widgets/product_card.dart';
import 'package:shop_app_flutter/global_variable.dart';
import 'package:shop_app_flutter/pages/product_details_page.dart';
class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
    final List<String> filters = ['All','Addidas','Nike','Bata'];
    late String selectedFilter ;
    @override
    void initState(){
      super.initState();
      selectedFilter = filters[0];
    }
  @override
  Widget build(BuildContext context) {
    const borderSearch = OutlineInputBorder(
                      borderSide: BorderSide( color: Color.fromRGBO(254,225,225,1) ),
                      borderRadius: BorderRadius.horizontal(left: Radius.circular(50)),
                    );
    return  SafeArea(
        child: Column(
          children: [
              Row(children: [
              Padding(
                padding:const EdgeInsets.all(20.0),
                child: Text(
                  "Shoes\nCollection",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
              const Expanded(
                child:TextField(
                  decoration: InputDecoration( 
                    hintText:'Search',
                    prefixIcon: Icon(Icons.search),
                    border: borderSearch,
                    enabledBorder: borderSearch,
                    focusedBorder: borderSearch
                  ),
                )
              )
             ],),
             SizedBox(
              height: 60,
               child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: filters.length,
                itemBuilder: (context,index){
                  final filter = filters[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20
                    ),
                    child: GestureDetector(
                      onTap: (){
                        setState(() {
                          selectedFilter = filter;
                        });
                      },
                      child: Chip( 
                        backgroundColor:selectedFilter == filter ? 
                          Theme.of(context).colorScheme.primary  :
                          const Color.fromRGBO(245, 247, 249, 1),
                        label : Text(filter ) ,
                        labelStyle:const  TextStyle( fontSize: 17),
                        padding:const  EdgeInsets.symmetric(horizontal: 12 , vertical : 12),
                        shape:const  RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(25))),
                        side:const BorderSide(
                          color: Color.fromRGBO(245, 247, 249, 1)
                        )
                      ),
                    ),
                  );
                }
               ),
             ),
             Expanded(
               child: ListView.builder(
                itemCount: products.length,
                itemBuilder: (context,index){
                  final product = products[index];
                return  GestureDetector(
                  onTap: (){
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context){
                        return ProductDetailsPage(product: product);
                      })
                    );
                  },
                  child: ProductCard(
                    title: product['title'] as String ,
                    price: product['price'] as double, 
                    image: product['imageUrl'] as String ,
                    backgroundColor : index%2==0 ? 
                                    const  Color.fromRGBO(216,240,253,1) : 
                                    const Color.fromARGB(255, 226, 232, 238)
                  ),
                );
               }),
             )
          ],
        ),
      );
  }
}