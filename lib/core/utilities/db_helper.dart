import 'package:flutter/foundation.dart';
import 'package:nyt/core/protobuf/news_response/news_response.pb.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBHelper {
  DBHelper._();

  static final DBHelper dbHelper = DBHelper._();

  final String dbName = "history.db";
  final String tableName = "news_history";
  final String colId = "id";
  final String dataColumn = "data"; // Column to store serialized protobuf data

  Database? db;

  Future<Database?> initDB() async {
    String directory = await getDatabasesPath();
    String path = join(directory, dbName);

    db = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        db.execute(
            "CREATE TABLE IF NOT EXISTS $tableName ($colId INTEGER PRIMARY KEY AUTOINCREMENT, $dataColumn BLOB)");
      },
      onUpgrade: (db, oldVersion, newVersion) {
        // Handle schema upgrades here
        if (oldVersion < 1) {
          db.execute(
              "CREATE TABLE IF NOT EXISTS $tableName ($colId INTEGER PRIMARY KEY AUTOINCREMENT, $dataColumn BLOB)");
        }
      },
    );

    return db;
  }

  Future<void> insertRecord({required List<NewsResponse> newsResponseList}) async {
    await initDB();

    Batch batch = db!.batch();
    for (var newsResponse in newsResponseList) {
      batch.insert(
        tableName,
        {
          dataColumn: newsResponse.writeToBuffer(), // Serialize protobuf to byte array
        },
        conflictAlgorithm: ConflictAlgorithm.replace, // Handle conflicts
      );
    }
    await batch.commit(noResult: true);
  }

  Future<List<NewsResponse>> fetchAllRecords() async {
    await initDB();

    List<Map<String, dynamic>> data = await db!.query(tableName);

    List<NewsResponse> historyList = data.map((element) {
      final byteArray = element[dataColumn] as Uint8List; // Extract byte array
      return NewsResponse.fromBuffer(byteArray); // Deserialize protobuf
    }).toList();

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
