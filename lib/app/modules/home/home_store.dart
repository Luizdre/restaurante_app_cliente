import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:restaurant_client/app/helpers/const/colors.dart';
import 'package:restaurant_client/app/helpers/const/url.dart';
import 'package:restaurant_client/app/helpers/order/model/orderModel.dart';
import 'package:restaurant_client/app/helpers/order/service/orderService.dart';
import 'package:restaurant_client/app/helpers/payment/model/paymentModel.dart';
import 'package:restaurant_client/app/helpers/payment/service/paymentService.dart';
import 'package:restaurant_client/app/helpers/product/model/productModel.dart';
import 'package:restaurant_client/app/helpers/product/service/productService.dart';
import 'package:socket_io_client/socket_io_client.dart';

part 'home_store.g.dart';

class HomeStore = HomeStoreBase with _$HomeStore;

abstract class HomeStoreBase with Store {
  final ProductService productService;
  final OrderService orderService;
  final PaymentService paymentService;
  final CartUser cart;

  HomeStoreBase(
      this.productService, this.orderService, this.paymentService, this.cart);

  @observable
  List<ProductModel> products = [];

  @observable
  double price = 0;

  @observable
  List<OrderModel> orders = [];

  @observable
  List<PaymentModel> payments = [];

  @observable
  String obs = '';

  @observable
  int index = 0;

  StreamController controller = StreamController();
  StreamController orderController = StreamController();
  StreamController cartController = StreamController.broadcast();

  final Socket socketIo =
      io(BASE_URL, OptionBuilder().setTransports(['websocket']).build());

  @action
  getProducts() async {
    products = await productService.getProducts();
    controller.add(products);
  }

  @action
  getOrders() async {
    orders = await orderService.getOrders(DateTime.now());
    orders.sort((a, b) => b.createdAt!.compareTo(a.createdAt!));
    orders =
        orders.where((element) => element.clientName == 'Mesa 15').toList();
    orders = orders.where((element) => element.payd == false).toList();
    orders.forEach((element) {
      price += element.totalPrice!.toDouble();
    });
    orderController.add(orders);
  }

  @action
  getPayments() async {
    payments = await paymentService.getPayments();
  }

  @action
  addProductToCart(ProductModel product) async {
    cart.cartUser.add(product);
    cartController.add(cart.cartUser);
    // cart.cartUser.forEach((element) {
    //   print(element.supplies);
    // });
    // print(cart.cartUser.length);
  }

  @action
  payOrder(List<OrderModel> orders) async {
    try {
      orders.forEach((element) async {
        element.payd = true;
        await orderService.payOrder(element);
      });
    } catch (e) {}
  }

  @action
  deleteOrder(OrderModel order) async {
    await orderService.cancelOrder(order);
  }

  @action
  MaterialColor turnStatus(String status) {
    switch (status) {
      case 'New':
        return Colors.purple;
      case 'inProgress':
        return Colors.indigo;
      case 'Finished':
        return Colors.green;
      default:
        return Colors.red;
    }
  }

  @action
  String translateMessage(String status) {
    switch (status) {
      case 'New':
        return 'Enviado';
      case 'inProgress':
        return 'Seu pedido está sendo preparado';
      case 'Finished':
        return 'Opa! Seu pedido está pronto';
      default:
        return '';
    }
  }

  @action
  sendOrder() async {
    double price = 0;
    cart.cartUser.forEach((element) {
      price += element.price;
    });
    OrderModel order = OrderModel(
        clientName: 'Mesa 15',
        totalPrice: price,
        payment: 'Teste',
        obs: obs != '' ? obs : 'vazio',
        products: cart.cartUser);
    // print(order.toJson());
    await orderService.sendOrder(order);
  }
}
