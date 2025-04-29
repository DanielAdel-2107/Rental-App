class UserModel {
  final String name;
  final String email;
  final String age;
  final String address;
  final String role;

  UserModel(
      {required this.name,
      required this.email,
      required this.age,
      required this.address,
      required this.role});
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['user_name'],
      email: json['email'],
      age: json['age'],
      address: json['address'],
      role: json['role'],
    );
  }

  Map<String, dynamic> toJson() => {
        'user_name': name,
        'email': email,
        'age': age,
        'address': address,
        'role': role,
      };

  @override
  String toString() {
    // TODO: implement toString
    return 'UserModel{name: $name, email: $email, age: $age, address: $address, role: $role}';
  }
}
