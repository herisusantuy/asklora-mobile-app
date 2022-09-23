class AddUserRequest {
  final String email;
  final String name;

  AddUserRequest(this.email, this.name);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    data['name'] = name;
    return data;
  }
}