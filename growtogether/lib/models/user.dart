class BaseAppUser {
  final String id;
  final String name;
  final String email;

  const BaseAppUser({
    required this.id,
    required this.name,
    required this.email,
  });

  // For AWS DynamoDB JSON
  factory BaseAppUser.fromJson(Map<String, dynamic> json) {
    return BaseAppUser(
      id: json['id'] ?? "",
      name: json['name'] ?? "",
      email: json['email'] ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "email": email,
    };
  }
}
