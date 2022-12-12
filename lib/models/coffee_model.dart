class CoffeModel {
  String? name;
  int? price;
  String? image;
  CoffeModel({this.name, this.price, this.image});

  static CoffeModel fromJson(Map<String, dynamic> json) {
    return CoffeModel(
        name: json['title'], price: json['price'], image: json['img']);
  }
}
