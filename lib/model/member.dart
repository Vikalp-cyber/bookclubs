class Member {
  final int userId;
  final String username;

  Member({
    required this.userId,
    required this.username,
  });

  factory Member.fromJson(Map<String, dynamic> json) {
    return Member(
      userId: json['user_id'],
      username: json['username'],
    );
  }
}