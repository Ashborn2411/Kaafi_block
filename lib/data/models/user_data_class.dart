class User {
  final String userId;
  final String name;
  final String email;
  final String? role;
  final List<String> wishlist;
  final List<String> enrolledlist;
  final List<String> cartlist;

  User({
    required this.cartlist,
    required this.wishlist,
    required this.enrolledlist,
    required this.userId,
    required this.name,
    required this.email,
    this.role,
  });

  static final User empty = User(
    userId: '',
    name: '',
    email: '',
    wishlist: const [],
    enrolledlist: const [],
    cartlist: const [],
  );

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      userId: json['userId'] ?? '',
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      role: json['role'],
      wishlist: (json['wish_list'] as List<dynamic>? ?? [])
          .map((e) => e.toString())
          .toList(),
      enrolledlist: (json['enrolled_courses'] as List<dynamic>? ?? [])
          .map((e) => e.toString())
          .toList(),
      cartlist: (json['cart'] as List<dynamic>? ?? [])
          .map((e) => e.toString())
          .toList(),
    );
  }
}
