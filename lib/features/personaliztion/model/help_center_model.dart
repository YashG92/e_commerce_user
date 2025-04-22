class HelpCenterModel {
  final String email;
  final String subject;
  final String message;
  final DateTime submittedAt;

  HelpCenterModel({
    required this.email,
    required this.subject,
    required this.message,
    DateTime? submittedAt,
  }) : submittedAt = submittedAt ?? DateTime.now();

  //Empty json
  HelpCenterModel.empty()
      : email = '',
        subject = '',
        message = '',
        submittedAt = DateTime.now();

  // Convert to JSON (e.g., for Firebase or API submission)
  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'subject': subject,
      'message': message,
      'submittedAt': submittedAt.toIso8601String(),
    };
  }

  // Create from JSON (optional, if fetching from database)
  factory HelpCenterModel.fromJson(Map<String, dynamic> json) {
    return HelpCenterModel(
        email: json['email'],
      subject: json['subject'],
      message: json['message'],
      submittedAt: DateTime.parse(json['submittedAt']),
    );
  }
}
