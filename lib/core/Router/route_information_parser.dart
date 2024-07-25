import 'package:flutter/material.dart';
import 'package:nyt/core/protobuf/news_response/news_response.pb.dart';
import 'package:nyt/core/protobuf/news_response/news_response.pbserver.dart';
import 'package:nyt/features/news/presentation/pages/home_screen.dart';
import 'package:nyt/features/news/presentation/pages/news_details.dart';
import 'package:nyt/features/splash_screen.dart';

class AppRouteInformationParser extends RouteInformationParser<List<Page>> {
  @override
  Future<List<Page>> parseRouteInformation(
      RouteInformation routeInformation) async {
    final uri = Uri.parse(routeInformation.uri.toString());

    if (uri.pathSegments.isEmpty) {
      return [const MaterialPage(child: SplashScreen())];
    }

    switch (uri.pathSegments.first) {
      case 'home':
        return [
          const MaterialPage(child: SplashScreen()),
          const MaterialPage(child: HomeScreen())
        ];
      case 'details':
        return [
          const MaterialPage(child: SplashScreen()),
          MaterialPage(child: NewsDetailsScreen(newsResponse: NewsResponse()))
        ];
      default:
        return [const MaterialPage(child: SplashScreen())];
    }
  }

  @override
  RouteInformation? restoreRouteInformation(List<Page> configuration) {
    if (configuration.length == 1) {
      return RouteInformation(uri: Uri.parse('/'));
    }

    if (configuration.length == 2) {
      final page = configuration[1] as MaterialPage;
      if (page.child is HomeScreen) {
        return RouteInformation(uri: Uri.parse('/home'));
      }
      if (page.child is NewsDetailsScreen) {
        return RouteInformation(uri: Uri.parse('/details'));
      }
    }

    return null;
  }
}
