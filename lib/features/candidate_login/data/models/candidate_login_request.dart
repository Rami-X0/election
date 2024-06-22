class CandiDateLoginRequest {
  final String email;
  final String password;

  CandiDateLoginRequest({
    required this.email,
    required this.password,
  });

  factory CandiDateLoginRequest.fromJson(Map<String, dynamic> json) {
    return CandiDateLoginRequest(
      email: json['email'],
      password: json['password'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
    };
  }
}
