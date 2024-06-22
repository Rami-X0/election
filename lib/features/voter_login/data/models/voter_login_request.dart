class VoterLoginRequest {
  final String email;
  final String password;

  VoterLoginRequest({
    required this.email,
    required this.password,
  });

  factory VoterLoginRequest.fromJson(Map<String, dynamic> json) {
    return VoterLoginRequest(
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
