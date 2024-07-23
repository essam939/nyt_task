class NewsRequest {
  NewsRequest({required this.category, required this.page});
  String category;
  int page = 1;
  Map<String, dynamic> toJson() =>
      {"category":category,  "page": page};
}
