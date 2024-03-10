class Meeting {
  final String meetingDate;
  final String meetingDuration;
  final String meetingLink;
  final String meetingLocation;
  final String meetingTime;
  final String note;

  Meeting({
    required this.meetingDate,
    required this.meetingDuration,
    required this.meetingLink,
    required this.meetingLocation,
    required this.meetingTime,
    required this.note,
  });

  factory Meeting.fromJson(Map<String, dynamic> json) {
    return Meeting(
      meetingDate: json['meeting_date'],
      meetingDuration: json['meeting_duration'],
      meetingLink: json['meeting_link'],
      meetingLocation: json['meeting_location'],
      meetingTime: json['meeting_time'],
      note: json['note'],
    );
  }
}
