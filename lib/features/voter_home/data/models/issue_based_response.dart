class IssueBasedResponse {
  final int id;
  final String name;

  IssueBasedResponse({required this.id, required this.name});

  factory IssueBasedResponse.fromJson(Map<String, dynamic> json) {
    return IssueBasedResponse(
      id: json['id'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}
