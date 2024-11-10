class RandomUser {
  final String name;
  final String email;
  final String image;
  final String phone;

  RandomUser({
    required this.name,
    required this.email,
    required this.image,
    required this.phone,
  });

  factory RandomUser.fromJson(Map<String, dynamic> json) {
    return RandomUser(
      name: '${json["name"]["first"]} ${json["name"]["last"]}',
      email: json["email"],
      image: json["picture"]["thumbnail"],
      phone: json["phone"],
    );
  }
}
