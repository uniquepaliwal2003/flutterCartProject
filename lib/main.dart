import 'package:flutter/material.dart';
import 'package:shop_app_flutter/providers/cart_provider.dart';
import 'package:shop_app_flutter/pages/home_page.dart';
import 'package:provider/provider.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  ChangeNotifierProvider(
      create: (context)=>CartProvider(),
      child: MaterialApp(
        title:'Shopping App',
        theme: ThemeData(
          fontFamily: 'Lato',
          colorScheme: ColorScheme.fromSeed(
            seedColor:const Color.fromRGBO(254,206,1,1),
            primary:const Color.fromRGBO(254,206,1,1), 
          ),
          inputDecorationTheme:const InputDecorationTheme(
            hintStyle: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold
            ),
           prefixIconColor: Color.fromRGBO(119, 119, 119, 1)
          ),
          textTheme:const TextTheme(
            titleMedium: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20
            ),
            bodySmall:  TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold
            ),
            titleLarge: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 35
                    ),
          ),
          appBarTheme: const AppBarTheme(
            titleTextStyle: TextStyle(
              color: Colors.black,
              fontSize: 22
            )
          ),
          // useMaterial3: true,
        ),
        home: const HomePage()
      ),
    );
  }
}