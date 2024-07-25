import 'package:flutter/material.dart';
import 'package:nyt/core/protobuf/news_response/news_response.pb.dart';
import 'package:nyt/features/news/presentation/pages/home_screen.dart';
import 'package:nyt/features/news/presentation/pages/news_details.dart';
import 'package:nyt/features/splash_screen.dart';

class AppRouterDelegate extends RouterDelegate<List<Page>>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<List<Page>> {
  AppRouterDelegate() : navigatorKey = GlobalKey<NavigatorState>();
  @override
  final GlobalKey<NavigatorState> navigatorKey;

  List<Page> _pages = [
    const MaterialPage(child: SplashScreen()),
    const MaterialPage(child: HomeScreen()),
    MaterialPage(child: NewsDetailsScreen(newsResponse: NewsResponse()))
  ];

  @override
  List<Page> get currentConfiguration => _pages;

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      pages: List.of(_pages),
      onPopPage: (route, result) {
        if (!route.didPop(result)) {
          return false;
        }
        _pages.removeLast();
        notifyListeners();
        return true;
      },
    );
  }

  @override
  Future<void> setNewRoutePath(List<Page> configuration) async {
    _pages = configuration;
  }

  void addPage(Page page) {
    _pages.add(page);
    notifyListeners();
  }

  void removeLastPage() {
    if (_pages.isNotEmpty) {
      _pages.removeLast();
      notifyListeners();
    }
  }
}
