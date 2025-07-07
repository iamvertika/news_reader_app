class NewsArticle {
  final String title;
  final String description;

  NewsArticle({
    required this.title,
    required this.description,
  });

  factory NewsArticle.fromJson(Map<String, dynamic> json) {
    return NewsArticle(
      title: json['title'] ?? 'No Title',
      description: json['description'] ?? 'No Description',
    );
  }
}
