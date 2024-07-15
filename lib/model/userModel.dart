class User {
  final int userId;
  final String userName;
  final String userEmail;
  final String address;
  final int userAge;

  User(
      {required this.userId,
      required this.userName,
      required this.userEmail,
      required this.address,
      required this.userAge});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        userId: json['UserId'],
        userName: json['UserName'],
        userEmail: json['UserEmail'],
        address: json['Address'],
        userAge: json['UserAge']);
  }
}
