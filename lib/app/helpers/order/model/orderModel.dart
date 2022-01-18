// ignore_for_file: prefer_collection_literals, unnecessary_new, file_names
class OrderModel {
  String? id;
  String? clientName;
  double? totalPrice;
  List<dynamic>? products;
  String? obs;
  String? payment;
  String? status;
  bool? payd;
  DateTime? createdAt;
  int? v;

  OrderModel(
      {this.id,
      this.clientName,
      this.totalPrice,
      this.products,
      this.obs,
      this.payment,
      this.status,
      this.payd,
      this.createdAt,
      this.v});

  OrderModel.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    clientName = json['clientName'];
    totalPrice = double.tryParse(json['totalPrice']);
    products = json['products'];
    obs = json['obs'];
    payment = json['payment'];
    status = json['status'];
    payd = json['payd'];
    createdAt = DateTime.tryParse(json['createdAt']);
    v = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['_id'] = id;
    data['clientName'] = clientName;
    data['totalPrice'] = totalPrice;
    data['products'] = products;
    data['obs'] = obs;
    data['payment'] = payment;
    data['status'] = status;
    data['payd'] = payd;
    data['createdAt'] = createdAt!.toIso8601String();
    data['__v'] = v;

    return data;
  }
}
