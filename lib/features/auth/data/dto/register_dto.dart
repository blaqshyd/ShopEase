// ignore_for_file: public_member_api_docs, sort_constructors_first

class RegisterDto {
  final String name;
  final String username;
  final String email;
  final String password;
  RegisterDto({
    required this.name,
    required this.username,
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'username': username,
      'email': email,
      'password': password,
    };
  }

  factory RegisterDto.fromMap(Map<String, dynamic> map) {
    return RegisterDto(
      name: map['name'] as String,
      username: map['username'] as String,
      email: map['email'] as String,
      password: map['password'] as String,
    );
  }
}
