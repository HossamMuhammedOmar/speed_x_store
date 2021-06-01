class CarsModel {
  dynamic price;
  String? type;
  String? model;
  String? image;
  String? name;
  String? color;

  CarsModel({
    this.name,
    this.price,
    this.type,
    this.model,
    this.image,
    this.color,
  });

  CarsModel.fromJson(Map<String, dynamic>? json) {
    name = json?['name'];
    price = json?['price'];
    type = json?['type'];
    model = json?['model'];
    image = json?['image'];
    color = json?['color'];
  }
}
