// ignore_for_file: file_names
import 'package:dio/dio.dart';
import 'package:restaurant_client/app/helpers/const/url.dart';
import 'package:restaurant_client/app/helpers/payment/model/paymentModel.dart';

class PaymentService {
  final Dio dio = Dio();
  final String paymentUrl = '$BASE_URL/payment';

  Future<List<PaymentModel>> getPayments() async {
    Response response = await dio.get('$paymentUrl/listPayments');

    List transfer = response.data;
    List<PaymentModel> payments = [];
    // ignore: avoid_function_literals_in_foreach_calls
    transfer.forEach((element) {
      payments.add(PaymentModel(id: element['_id'], name: element['name']));
    });
    return payments;
  }

  Future postPayment(PaymentModel payment) async {
    Response response = await dio.post('$paymentUrl/createPayment', data: {
      'name': payment.name,
    });
    return response.data;
  }

  Future putPayment(PaymentModel payment) async {
    Response response = await dio.patch('$paymentUrl/updatePayment', data: {
      'id': payment.id,
      'name': payment.name,
    });

    return response.data;
  }

  Future deletePayment(PaymentModel payment) async {
    Response response =
        await dio.delete('$paymentUrl/deletePayment', data: {'id': payment.id});
    return response.data;
  }
}
