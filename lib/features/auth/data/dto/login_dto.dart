class LoginDto {
  final String username;
  final String password;
  LoginDto({
    required this.username,
    required this.password,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'username': username,
      'password': password,
    };
  }

  factory LoginDto.fromMap(Map<String, dynamic> map) {
    return LoginDto(
      username: map['username'] as String,
      password: map['password'] as String,
    );
  }
}
