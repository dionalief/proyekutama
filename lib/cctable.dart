class CCTable {
  String email;
  String packet;
  int price;
  int value;

  CCTable(
      {required this.email,
      required this.packet,
      required this.price,
      required this.value});

  Map<String, dynamic> toJson() =>
      {"email": email, "packet": packet, "price": price, "value": value};

  static CCTable fromJson(Map<dynamic, dynamic> json) => CCTable(
        email: json['email'],
        packet: json['packet'],
        price: json['price'],
        value: json['value'],
      );
}
