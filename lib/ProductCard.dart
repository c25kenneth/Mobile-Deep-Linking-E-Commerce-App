import "package:flutter/material.dart";

class ProductCard extends StatefulWidget {
  final String productTitle;
  final String imageURL;
  final String price;
  const ProductCard(
      {required this.productTitle,
      required this.price,
      required this.imageURL,
      super.key});

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        child: ListTile(
          title: Text(widget.productTitle),
          subtitle: Text("\$" + widget.price),
          leading: Image.network(widget.imageURL),
        ),
      ),
    );
  }
}
