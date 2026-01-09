class Artist {
  final int id;
  final String username;
  final String bio;
  final String pfpUrl;
  final String customToS;
  final int artsCount;
  final int soldCount;
  final double averagePrice;

  Artist({
    required this.id,
    required this.username,
    required this.bio,
    required this.pfpUrl,
    required this.customToS,
    required this.artsCount,
    required this.soldCount,
    required this.averagePrice,
  });

  factory Artist.fromJson(Map<String, dynamic> json) {
    return Artist(
      id: json['id'],
      username: json['username'],
      bio: json['bio'] ?? '',
      pfpUrl: json['pfp_url'] ?? '',
      customToS: json['custom_tos'] ?? '',
      artsCount: json['arts_count'] ?? 0,
      soldCount: json['sold_count'] ?? 0,
      averagePrice: (json['average_price'] as num).toDouble(),
    );
  }
}
