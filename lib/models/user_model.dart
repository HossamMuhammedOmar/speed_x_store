class UserModel {
  String? name;
  String? email;
  String? phone;
  String? address;
  String? uId;

  UserModel({
    this.name,
    this.email,
    this.address,
    this.phone,
    this.uId,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    address = json['address'];
    uId = json['uId'];
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'phone': phone,
      'address': address,
      'uId': uId,
    };
  }
}
