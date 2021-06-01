class UserModel {
  String? name;
  String? email;
  String? phone;
  String? address;
  String? uId;
  bool? isEmailVerified;

  UserModel({
    this.name,
    this.email,
    this.address,
    this.phone,
    this.uId,
    this.isEmailVerified,
  });

  UserModel.fromJson(Map<String, dynamic>? json) {
    name = json?['name'];
    email = json?['email'];
    phone = json?['phone'];
    address = json?['address'];
    uId = json?['uId'];
    isEmailVerified = json?['isEmailVerified'];
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'phone': phone,
      'address': address,
      'uId': uId,
      'isEmailVerified': isEmailVerified,
    };
  }
}
