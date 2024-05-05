import 'package:flutter/foundation.dart';
import 'package:nyt/features/news/domain/entities/news_response.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBHelper {
  DBHelper._();

  static final DBHelper dbHelper = DBHelper._();

  final String dbName = "history.db";
  final String tableName = "news_history";
  final String colId = "id";
  final String section = "section";
  final String title = "title";
  final String url = "url";
  final String abstract = "abstract";
  final String byline = "byline";
  final String publishedDate = "published_date";

  Database? db;

  Future<Database?> initDB() async {
    String directory = await getDatabasesPath();
    String path = join(directory, dbName);

    db = await openDatabase(path, version: 1, onCreate: (db, version) {
      db.execute(
          "CREATE TABLE IF NOT EXISTS $tableName ($colId INTEGER PRIMARY KEY AUTOINCREMENT, $section TEXT, $title TEXT, $url TEXT, $abstract TEXT, $byline TEXT, $publishedDate TEXT)");
    });

    return db;
  }

  Future<void> insertRecord({required List<NewsResponse> newsResponseList}) async {
    await initDB();

    Batch batch = db!.batch();
    newsResponseList.forEach((newsResponse) {
      batch.insert(
        tableName,
        {
          section: newsResponse.section,
          title: newsResponse.title,
          url: newsResponse.url,
          abstract: newsResponse.abstract,
          byline: newsResponse.byline,
          publishedDate: newsResponse.publishedDate,
        },
      );
    });
    await batch.commit(noResult: true);
  }

  Future<List<NewsResponse>> fetchAllRecords() async {
    await initDB();

    List<Map<String, dynamic>> data = await db!.query(tableName);

    List<NewsResponse> historyList =
    data.map((e) => NewsResponse.fromJson(e)).toList();

    return historyList;
  }

  Future<void> clearRecords() async {
    await initDB();

    // Execute a SQL query to delete all records from the table
    await db!.delete(tableName);

    // Optionally, you can print a message or perform any other action after clearing the records
    if (kDebugMode) {
      print('All records cleared successfully');
    }
  }
}
