import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_api_fetch/model/productModel.dart';

class ProductCard extends StatelessWidget {
  late Product product;
  int? productId;

  ProductCard({required this.product, required this.productId});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GestureDetector(
          onTap: () {
            print(productId);
          },
          child: Column(
            // this is the coloumn
            children: [
              AspectRatio(
                aspectRatio: 1, // this is the ratio
                child: CachedNetworkImage(
                  // this is to fetch the image
                  imageUrl: product.image,
                  fit: BoxFit.cover,
                ),
              ),
              ListTile(
                title: Text(product.title),
                subtitle: Text(
                    '${product.price} \$'), // this is fetch the price from the api
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.star,
                        color: Colors.orange), // this will give the rating
                    Text('${product.rating}'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
