class Data {
  String email;
  String password;

  Data({required this.email, required this.password});

  Map<String, dynamic> toJson() => {
        "Email": email,
        "Password": password,
      };

  static Data fromJson(Map<dynamic, dynamic> json) => Data(
        email: json['Email'],
        password: json['Password'],
      );
}
