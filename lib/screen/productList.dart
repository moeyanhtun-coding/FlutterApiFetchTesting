import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_api_fetch/utils/productCard.dart';
import 'package:http/http.dart' as http;
import 'package:loading_animation_widget/loading_animation_widget.dart';
import '../model/productModel.dart';

class ProductListScreen extends StatefulWidget {
  @override
  _ProductListScreenState createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  List<Product> products = [];
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    fetchProducts();
  }

  Future<void> fetchProducts() async {
    setState(() {
      isLoading = true;
    });
    // you can replace your api link with this link
    final response =
        await http.get(Uri.parse('https://fakestoreapi.com/products'));
    if (response.statusCode == 200) {
      List<dynamic> jsonData = json.decode(response.body);
      setState(() {
        products = jsonData.map((data) => Product.fromJson(data)).toList();
      });
      print(products);
      setState(() {
        isLoading = false;
      });
    } else {
      // Handle error if needed
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _headerText(),
      ),
      body: isLoading ? _loading() : _productList(context),
    );
  }

  Widget _headerText() {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: const Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Product List",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
          ),
        ],
      ),
    );
  }

  Widget _loadingMessage() {
    return Text(
      "Loading",
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
    );
  }

  Widget _productList(BuildContext context) {
    return ListView.builder(
      // this give th length of item
      itemCount: products.length,
      itemBuilder: (context, index) {
        // here we card the card widget
        // which is in utils folder
        return ProductCard(product: products[index]);
      },
    );
  }

  Widget _loading() {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _loadingMessage(),
        LoadingAnimationWidget.horizontalRotatingDots(
          color: Color.fromARGB(255, 0, 0, 0),
          size: 60,
        ),
      ],
    ));
  }
}
