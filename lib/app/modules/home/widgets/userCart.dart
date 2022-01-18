// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:restaurant_client/app/modules/home/home_store.dart';
import 'package:restaurant_client/components/text.dart';
import 'package:restaurant_client/components/textField.dart';

// ignore: use_key_in_widget_constructors
class UserCart extends StatefulWidget {
  @override
  _UserCartState createState() => _UserCartState();
}

class _UserCartState extends ModularState<UserCart, HomeStore> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return StreamBuilder(
        stream: store.cartController.stream,
        builder: (context, snapshot) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  RestaurantText(value: 'Itens'),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListView(
                        children: store.cart.cartUser
                            .map((e) => Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                        width: size.width / 2,
                                        child: Text(e.name!)),
                                    SizedBox(
                                        width: size.width / 6,
                                        child: Text('R\$' +
                                            double.tryParse(
                                                    e.price!.toString())!
                                                .toStringAsFixed(2))),
                                    FittedBox(
                                      child: SizedBox(
                                        width: size.width / 10,
                                        child: IconButton(
                                            onPressed: () => setState(() {
                                                  store.cart.cartUser.remove(e);
                                                }),
                                            icon: const Icon(
                                                Icons
                                                    .remove_circle_outline_outlined,
                                                color: Colors.redAccent)),
                                      ),
                                    )
                                  ],
                                ))
                            .toList(),
                      ),
                    ),
                  ),
                  RestaurantTextField(
                    onChange: (v) => store.obs = v,
                    labelText: 'Coloque uma observação',
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: ElevatedButton(
                        onPressed: () =>
                            store.sendOrder().whenComplete(() => setState(() {
                                  store.cart.cartUser.clear();
                                  store.cartController.add(store.cart.cartUser);
                                })),
                        child: const Text('Realizar Pedido')),
                  )
                ],
              ),
            ));
  }
}
