// ignore_for_file: prefer_collection_literals, unnecessary_new, file_names

class ProductModel {
  String? id;
  String? name;
  double? price;
  List<dynamic>? supplies;

  ProductModel({this.id, this.name, this.price, this.supplies});

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    name = json['name'];
    price = double.tryParse(json['price'].toString());
    supplies = json['supplies'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['name'] = name;
    data['price'] = price;
    data['supplies'] = supplies;

    return data;
  }
}
