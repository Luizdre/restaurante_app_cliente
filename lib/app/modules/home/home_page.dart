// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:restaurant_client/app/modules/home/home_store.dart';
import 'package:restaurant_client/app/modules/home/widgets/menu.dart';
import 'package:restaurant_client/app/modules/home/widgets/orders.dart';
import 'package:restaurant_client/app/modules/home/widgets/userCart.dart';
import 'package:icon_badge/icon_badge.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:restaurant_client/components/text.dart';

// ignore: use_key_in_widget_constructors
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  final HomeStore store = Modular.get();

  @override
  void initState() {
    store.getProducts();
    store.getPayments();
    store.cartController.add(store.cart.cartUser);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          leading: Center(
              child: Observer(
                  builder: (context) => InkWell(
                      onTap: () => showDialog(
                          context: context,
                          builder: (context) => Align(
                                alignment: Alignment.bottomCenter,
                                child: AlertDialog(
                                  actionsAlignment:
                                      MainAxisAlignment.spaceAround,
                                  title: Text('Deseja fechar sua conta?'),
                                  actions: [
                                    ElevatedButton(
                                        onPressed: () => Modular.to.pop(),
                                        child: Text('Não')),
                                    ElevatedButton(
                                        onPressed: () {
                                          store.payOrder(store.orders);
                                          Modular.to.pop();
                                          store.socketIo
                                              .emit('Pedido Pago', 'Mesa 15');
                                        },
                                        child: Text('Sim'))
                                  ],
                                ),
                              )),
                      child: Text('R\$' + store.price.toStringAsFixed(2))))),
          actions: [
            IconButton(
                onPressed: () => store.cartController.add(store.cart.cartUser),
                icon: Icon(Icons.replay_outlined))
          ],
          centerTitle: true,
          title: Column(
            children: [
              Text('Cardápio'),
              RestaurantText(
                value: 'Mesa 15',
                fontSize: 12,
                fontColor: Colors.white,
              )
            ],
          ),
        ),
        body: PersistentTabView(
          context,
          navBarStyle: NavBarStyle.style12,
          screens: [Orders(), Menu(), UserCart()],
          items: [
            PersistentBottomNavBarItem(
                title: 'Pedidos', icon: Icon(Icons.shopping_bag_outlined)),
            PersistentBottomNavBarItem(
                title: 'Cardápio', icon: Icon(Icons.menu_book_sharp)),
            PersistentBottomNavBarItem(
                title: 'Carrinho',
                icon:
                    // IconBadge(
                    //     itemCount: store.cart.cartUser.length,
                    //     icon: Icon(FontAwesomeIcons.cartArrowDown)))
                    StreamBuilder(
                        stream: store.cartController.stream,
                        builder: (context, snapshot) {
                          return IconBadge(
                              itemCount: store.cart.cartUser.length,
                              icon: Icon(FontAwesomeIcons.cartArrowDown));
                        }))
          ],
        ));
  }
}
