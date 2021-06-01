class CategoriesModel {
  String? image;
  String? name;
  String? id;
  CarsData? cars;

  CategoriesModel({
    this.name,
    this.image,
    this.id,
    this.cars,
  });

  CategoriesModel.fromJson(Map<String, dynamic>? json) {
    name = json?['name'];
    image = json?['image'];
    id = json?['id'];
    cars = CarsData.fromJson(json?['cars']);
  }
}

class CarsData {
  dynamic price;
  String? type;
  String? model;
  String? image;
  String? name;
  String? color;

  CarsData.fromJson(Map<String, dynamic>? json) {
    name = json?['name'];
    price = json?['price'];
    type = json?['type'];
    model = json?['model'];
    image = json?['image'];
    color = json?['color'];
  }
}
