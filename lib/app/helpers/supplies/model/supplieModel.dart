// ignore_for_file: prefer_collection_literals, unnecessary_new, file_names

class SupplieModel {
  String? id;
  String? name;
  int? qtt;

  SupplieModel({this.id, this.name, this.qtt});

  SupplieModel.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['name'] = name;
    qtt != 0 ? data['qtt'] = qtt : '';

    return data;
  }
}
