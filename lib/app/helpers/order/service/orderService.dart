// ignore_for_file: prefer_collection_literals, unnecessary_new, file_names
import 'package:dio/dio.dart';
import 'package:restaurant_client/app/helpers/const/url.dart';
import 'package:restaurant_client/app/helpers/order/model/orderModel.dart';

class OrderService {
  final Dio dio = Dio();
  final String orderUrl = '$BASE_URL/order';
  OrderModel order = OrderModel();

  Future<List<OrderModel>> getOrders(DateTime time) async {
    Response response = await dio.get('$orderUrl/listOrders');

    List transform = response.data;
    List<OrderModel> orders = [];

    // ignore: avoid_function_literals_in_foreach_calls
    transform.forEach((element) {
      orders.add(OrderModel(
          id: element['_id'],
          clientName: element['clientName'],
          totalPrice: double.tryParse(element['totalPrice'].toString()),
          products: element['products'],
          obs: element['obs'],
          payment: element['payment'],
          payd: element['payd'],
          status: element['status'],
          createdAt: DateTime.tryParse(element['createdAt'])));
    });
    orders.sort((a, b) => b.createdAt!.compareTo(a.createdAt!));
    return orders;
  }

  Future payOrder(OrderModel order) async {
    await dio.patch('$orderUrl/payOrder',
        data: {'id': order.id, 'payd': order.payd});
  }

  Future<OrderModel> toggleStatus(OrderModel order) async {
    Response response = await dio.patch('$orderUrl/acceptOrder',
        data: {'id': order.id, 'status': order.status});
    return response.data;
  }

  Future sendOrder(OrderModel order) async {
    try {
      Response response = await dio.post('$orderUrl/sendOrder', data: {
        'clientName': order.clientName,
        'totalPrice': order.totalPrice,
        'products': order.products,
        'obs': order.obs,
        'payment': order.payment,
      });
      return response.data;
    } catch (e) {
      // print(e);
    }
  }

  Future cancelOrder(OrderModel order) async {
    try {
      await dio.delete('$orderUrl/cancelOrder', data: {'id': order.id});
    } catch (e) {}
  }
}
