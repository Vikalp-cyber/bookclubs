class ClubAdmin {
  final int adminId;
  final String adminUsername;

  ClubAdmin({
    required this.adminId,
    required this.adminUsername,
  });

  factory ClubAdmin.fromJson(Map<String, dynamic> json) {
    return ClubAdmin(
      adminId: json['admin_id'],
      adminUsername: json['admin_username'],
    );
  }
}