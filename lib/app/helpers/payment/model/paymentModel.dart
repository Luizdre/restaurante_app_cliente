// ignore_for_file: prefer_collection_literals, unnecessary_new, file_names
class PaymentModel {
  String? id;
  String? name;

  PaymentModel({this.id, this.name});

  PaymentModel.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    name = json['name'];
  }

  toJson(PaymentModel payment) {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['name'] = name;

    return data;
  }
}
