import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:restaurant_client/app/helpers/order/model/orderModel.dart';
import 'package:restaurant_client/app/modules/home/home_store.dart';

class Orders extends StatefulWidget {
  @override
  _OrdersState createState() => _OrdersState();
}

class _OrdersState extends ModularState<Orders, HomeStore> {
  @override
  void initState() {
    store.getOrders();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    store.socketIo.on('Pedido alterado', (order) {
      store.orders.clear();
      store.price = 0;
      List transform = order;
      transform.forEach((element) {
        store.orders.add(OrderModel.fromJson(element));
      });
      store.orders.sort((a, b) => b.createdAt!.compareTo(a.createdAt!));
      store.orders = store.orders
          .where((element) => element.clientName == 'Mesa 15')
          .toList();
      store.orders =
          store.orders.where((element) => element.payd == false).toList();
      store.orders.forEach((element) {
        store.price += element.totalPrice!.toDouble();
      });
      store.orderController.add(store.orders);
    });

    return StreamBuilder(
        stream: store.orderController.stream,
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return const Center(
                child: CircularProgressIndicator(),
              );
            default:
              return ListView.builder(
                  itemCount: store.orders.length,
                  itemBuilder: (c, i) => Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Pedido ' + (i + 1).toString()),
                                    // Text(store.orders[i].createdAt.toString()),
                                    SizedBox(
                                        height: 20,
                                        child: Observer(
                                          builder: (context) => CircleAvatar(
                                            backgroundColor: store.turnStatus(
                                                store.orders[i].status!),
                                          ),
                                        )),
                                  ]),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(store.translateMessage(
                                        store.orders[i].status!)),
                                  ),
                                  Visibility(
                                      visible: store.orders[i].status == 'New',
                                      child: IconButton(
                                          onPressed: () => store
                                              .deleteOrder(store.orders[i]),
                                          icon: const Icon(Icons.delete,
                                              color: Colors.redAccent))),
                                ],
                              )
                            ],
                          ),
                        ),
                      ));
          }
        });
  }
}
