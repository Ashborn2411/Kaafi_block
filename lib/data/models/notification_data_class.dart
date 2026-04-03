

class Notification {
  final String notifId;
  final String userId;
  final String message;
  final bool isRead;

  Notification({
    required this.notifId,
    required this.userId,
    required this.message,
    required this.isRead,
  });

  factory Notification.fromJson(Map<String, dynamic> json) {
    return Notification(
      notifId: json['notifId'],
      userId: json['userId'],
      message: json['message'],
      isRead: json['isRead'],
    );
  }
}