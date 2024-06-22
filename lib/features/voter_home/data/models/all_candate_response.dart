class AllCandidateResponse {
  final int id;
  final String name;
  final String email;
  final String passwordHash;
  final String passwordSalt;
  final String gender;
  final String personalImagePath;
  final String nationalIdImagePath;
  final int votes;

  AllCandidateResponse({
    required this.id,
    required this.name,
    required this.email,
    required this.passwordHash,
    required this.passwordSalt,
    required this.gender,
    required this.personalImagePath,
    required this.nationalIdImagePath,
    required this.votes,
  });

  factory AllCandidateResponse.fromJson(Map<String, dynamic> json) {
    return AllCandidateResponse(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      passwordHash: json['passwordHash'],
      passwordSalt: json['passwordSalt'],
      gender: json['gender'],
      personalImagePath: json['personalImagePath'],
      nationalIdImagePath: json['nationalIdImagePath'],
      votes: json['votes'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['passwordHash'] = passwordHash;
    data['passwordSalt'] = passwordSalt;
    data['gender'] = gender;
    data['personalImagePath'] = personalImagePath;
    data['nationalIdImagePath'] = nationalIdImagePath;
    data['votes'] = votes;
    return data;
  }
}
