import 'models/news_article.dart';
import 'services/news_service.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart'; // ⬅️ ADD THIS
import 'models/news_article.dart'; // ⬅️ your model
import 'services/news_service.dart'; // ⬅️ fetchNews() function

class NewsScreen extends StatelessWidget {
  const NewsScreen({super.key});

  // ⬇️ Function to launch URL
  void _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/vintage_bg.jpg',
              fit: BoxFit.cover,
            ),
          ),
          SafeArea(
            child: FutureBuilder<List<NewsArticle>>(
              future: fetchNews(), // 👈 from your news_service
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(child: Text('No news found'));
                }

                final newsList = snapshot.data!;
                return ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: newsList.length,
                  itemBuilder: (context, index) {
                    final article = newsList[index];
                    return GestureDetector(
                      onTap: () => _launchURL(article.url),
                      child: Card(
                        color: Colors.brown.shade50.withOpacity(0.85),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        elevation: 5,
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                article.title,
                                style: TextStyle(
                                  fontFamily: 'Cinzel',
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.brown.shade900,
                                ),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                article.description ?? '',
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.black87,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
