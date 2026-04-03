

class Payment {
  final String paymentId;
  final String enrollmentId;
  final double amount;
  final DateTime date;
  final String status;
  final String method;

  Payment({
    required this.paymentId,
    required this.enrollmentId,
    required this.amount,
    required this.date,
    required this.status,
    required this.method,
  });

  factory Payment.fromJson(Map<String, dynamic> json) {
    return Payment(
      paymentId: json['paymentId'],
      enrollmentId: json['enrollmentId'],
      amount: json['amount'] is int ? (json['amount'] as int).toDouble() : json['amount'],
      date: DateTime.parse(json['date']),
      status: json['status'],
      method: json['method'],
    );
  }
}
