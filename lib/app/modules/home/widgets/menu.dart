import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:restaurant_client/app/helpers/product/model/productModel.dart';
import 'package:restaurant_client/app/modules/home/home_store.dart';
import 'package:restaurant_client/app/modules/home/widgets/productOrder.dart';
import 'package:restaurant_client/components/modalSheet.dart';

class Menu extends StatefulWidget {
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends ModularState<Menu, HomeStore> {
  @override
  Widget build(BuildContext context) {
    store.socketIo.on('Product Alterado', (data) {
      store.products.clear();
      List lista = data;
      lista.forEach((element) {
        store.products.add(ProductModel.fromJson(element));
      });
      store.products.sort(
          (a, b) => a.name!.toLowerCase().compareTo(b.name!.toLowerCase()));
      store.controller.add(store.products);
    });

    return StreamBuilder(
      stream: store.controller.stream,
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return const Center(
              child: CircularProgressIndicator(),
            );
          default:
            return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.builder(
                  itemCount: store.products.length,
                  itemBuilder: (context, index) => InkWell(
                    onTap: () => RestaurantBottomSheet(
                        context, ProductDetail(store.products[index])),
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Produto: ' + store.products[index].name!),
                            Text('Valor:  R\$' +
                                double.tryParse(
                                        store.products[index].price.toString())!
                                    .toStringAsFixed(2)),
                          ],
                        ),
                      ),
                    ),
                  ),
                ));
        }
      },
    );
  }
}
