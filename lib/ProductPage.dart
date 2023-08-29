import 'package:deeplinkingflutter/GetData.dart';
import 'package:flutter/material.dart';

class ProductPage extends StatefulWidget {
  final product;
  const ProductPage({required this.product, super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  late Future products;

  @override
  void initState() {
    products = getProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: products,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          } else {
            return Scaffold(
              appBar: AppBar(
                title: Text(snapshot.data![int.parse(widget.product)]["title"]),
              ),
              body: Center(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.8,
                        height: MediaQuery.of(context).size.height * 0.40,
                        child: Image.network(
                            snapshot.data![int.parse(widget.product)]["image"]),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        snapshot.data![int.parse(widget.product)]["title"],
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 3,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        "\$" +
                            snapshot.data![int.parse(widget.product)]["price"]
                                .toString(),
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 19),
                      ),
                      SizedBox(height: 25),
                      Container(
                        height: 45,
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Text(
                            'PURCHASE',
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold),
                          ),
                          style:
                              ElevatedButton.styleFrom(shape: StadiumBorder()),
                        ),
                      )
                    ]),
              ),
            );
          }
        });
  }
}
