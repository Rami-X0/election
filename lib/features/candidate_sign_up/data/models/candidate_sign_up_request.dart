class CandiDateSignUpRequest {
  final String name;
  final String email;
  final String password;
  final String gender;
  final String personalImage;
  final String nationalIdImage;

  CandiDateSignUpRequest({
    required this.name,
    required this.email,
    required this.password,
    required this.gender,
    required this.personalImage,
    required this.nationalIdImage,
  });

  factory CandiDateSignUpRequest.fromJson(Map<String, dynamic> json) {
    return CandiDateSignUpRequest(
      name: json['Name'],
      email: json['Email'],
      password: json['Password'],
      gender: json['Gender'],
      personalImage: json['PersonalImage'],
      nationalIdImage: json['NationalIdImage'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Name': name,
      'Email': email,
      'Password': password,
      'Gender': gender,
      'PersonalImage': personalImage,
      'NationalIdImage': nationalIdImage,
    };
  }
}
