class UserData {
  String? id;
  String? name;
  String? email;
  String? handPhone;
  String? password;

  UserData({
    this.id,
    this.name,
    this.email,
    this.handPhone,
    this.password,
  });

  Map<String, dynamic> toVariables() {
    return {
      "id": id,
      "name": name,
      "email": email,
      "handPhone": handPhone,
      "password": password,
    };
  }
}
