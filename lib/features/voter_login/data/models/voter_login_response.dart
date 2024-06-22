class VoterLoginResponse {
  final String token;
  final String email;
  final String displayName;
  final String role;
  final int id;

  VoterLoginResponse({
    required this.token,
    required this.email,
    required this.displayName,
    required this.role,
    required this.id,
  });


factory VoterLoginResponse.fromJson(Map<String, dynamic> json) {
    return VoterLoginResponse(
      token: json['token'],
      email: json['email'],
      displayName: json['displayName'],
      role: json['role'],
      id: json['id'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['token'] = token;
    data['email'] = email;
    data['displayName'] = displayName;
    data['role'] = role;
    data['id'] = id;
    return data;
  }
}
