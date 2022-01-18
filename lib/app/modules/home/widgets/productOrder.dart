// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:number_selection/number_selection.dart';
import 'package:restaurant_client/app/helpers/product/model/productModel.dart';
import 'package:restaurant_client/app/modules/home/home_store.dart';
import 'package:restaurant_client/app/modules/home/widgets/userCart.dart';

// ignore: use_key_in_widget_constructors, must_be_immutable
class ProductDetail extends StatefulWidget {
  ProductModel product;

  // ignore: use_key_in_widget_constructors
  ProductDetail(this.product);
  @override
  _ProductDetailState createState() => _ProductDetailState();
}

class _ProductDetailState extends ModularState<ProductDetail, HomeStore> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          widget.product.name!,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        Align(
          child: Text('Por apenas: R\$' +
              double.tryParse(widget.product.price.toString())!
                  .toStringAsFixed(2)),
        ),
        const Text('Esse delicioso prato acompanha: '),
        Expanded(
          child: ListView.builder(
              itemCount: widget.product.supplies!.length,
              itemBuilder: (context, index) => Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          height: 30,
                          child: NumberSelection(
                              minValue: 1,
                              maxValue: 99,
                              onChanged: (v) =>
                                  widget.product.supplies![index]['qtt'] = v,
                              initialValue: widget.product.supplies![index]
                                  ['qtt']),
                        ),
                      ),
                      Text(widget.product.supplies![index]['name'])
                    ],
                  )),
        ),
        ElevatedButton(
            onPressed: () => store
                .addProductToCart(widget.product)
                .whenComplete(() => setState(() {
                      store.cartController.add(store.cart.cartUser);
                    })),
            child: const Text('Claro que quero'))
      ],
    );
  }
}
