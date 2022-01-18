import 'package:flutter_modular/flutter_modular.dart';
import 'package:restaurant_client/app/helpers/const/colors.dart';
import 'package:restaurant_client/app/helpers/order/service/orderService.dart';
import 'package:restaurant_client/app/helpers/payment/service/paymentService.dart';
import 'package:restaurant_client/app/helpers/product/service/productService.dart';

import 'modules/home/home_module.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind((i) => OrderService()),
    Bind((i) => ProductService()),
    Bind((i) => PaymentService()),
    Bind((i) => CartUser()),
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(Modular.initialRoute, module: HomeModule()),
  ];
}
