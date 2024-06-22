class VoterSignUpRequest {
  final String name;
  final String email;
  final String password;
  final String nationalIdImage;

  VoterSignUpRequest({
    required this.name,
    required this.email,
    required this.password,
    required this.nationalIdImage,
  });

  factory VoterSignUpRequest.fromJson(Map<String, dynamic> json) {
    return VoterSignUpRequest(
      name: json['Name'],
      email: json['Email'],
      password: json['Password'],
      nationalIdImage: json['NationalIdImage'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Name': name,
      'Email': email,
      'Password': password,
      'NationalIdImage': nationalIdImage,
    };
  }
}
