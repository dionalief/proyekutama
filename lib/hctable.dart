class HCTable {
  String email;
  String packet;
  int price;
  int value;

  HCTable(
      {required this.email,
      required this.packet,
      required this.price,
      required this.value});

  Map<String, dynamic> toJson() =>
      {"email": email, "packet": packet, "price": price, "value": value};

  static HCTable fromJson(Map<dynamic, dynamic> json) => HCTable(
        email: json['email'],
        packet: json['packet'],
        price: json['price'],
        value: json['value'],
      );
}
