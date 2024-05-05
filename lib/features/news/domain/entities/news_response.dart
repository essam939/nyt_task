

import 'package:intl/intl.dart';

class NewsResponse {
  final String section;
  final String title;
  final String url;
  final String abstract;
  final String byline;
  final String publishedDate;
  final String image;
  final String? localImagePath;
  NewsResponse({
    required this.section,
    required this.title,
    required this.url,
    required this.abstract,
    required this.byline,
    required this.publishedDate,
    required this.image,
    this.localImagePath,
  });
  factory NewsResponse.fromJson(Map<String, dynamic> json) {
    return NewsResponse(
      section: json['section']??"N/A",
      title: json['title'] ??"N/A",
      url: json['url'] as String,
      abstract: json['abstract'] ??"N/A",
      byline: json['byline'] ??"N/A",
      publishedDate:json['published_date']??"N/A",
      image:json['multimedia'][0]['url'],
        localImagePath: null
    );
  }
}


