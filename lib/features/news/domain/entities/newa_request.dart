class NewsRequest {
  String category;
  int page = 1;
  NewsRequest({required this.category, required this.page});
  Map<String, dynamic> toJson() =>
      {"category":category,  "page": page};
}
