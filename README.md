# platform_conveter_app

<img src= "https://github.com/user-attachments/assets/b3e46dd6-200a-4a51-89de-32e5172bea5f" height=25% width=25%>
<img src= "https://github.com/user-attachments/assets/63ed08f5-9347-4a7a-99fc-af0a5ca9cf17"height=25% width=25%>
<img src= "https://github.com/user-attachments/assets/9daac90a-2d81-4312-b60a-03671039e4a1"height=25% width=25%>
<img src= "https://github.com/user-attachments/assets/2b1ae7ce-9669-44bf-b5cd-0a88e34d31d1"height=25% width=25%>
<img src= "https://github.com/user-attachments/assets/57139ad2-1700-4212-92d0-ab0ad54516ea"height=25% width=25%>
<img src= "https://github.com/user-attachments/assets/2f6e11b1-58e3-42a8-83c4-581b3f4a9dfb"height=25% width=25%>
<img src= "https://github.com/user-attachments/assets/35074f71-c550-440c-8b95-0b78deb95287"height=25% width=25%>
<img src= "https://github.com/user-attachments/assets/7f5cda00-014e-4c92-9c38-e286a8519e06"height=25% width=25%>
<img src= "https://github.com/user-attachments/assets/c7be542d-598d-4899-9f62-eafde33305d6"height=25% width=25%>
<img src= "https://github.com/user-attachments/assets/3898ec23-efff-4f9e-9889-6b3dc5d88673"height=25% width=25%>


# platform converter :
Creating a platform converter app using Flutter with a Cupertino design and database integration is a great way to ensure a native iOS feel while maintaining cross-platform functionality. Here's how to do it step by step:
Set Up Flutter Environment Make sure you have Flutter installed and set up. Create a new Flutter project:
Add Dependencies Update your pubspec.yaml file to include the necessary dependencies for SQLite:
yaml
Copy code
dependencies:
  flutter:
    sdk: flutter
  cupertino_icons: ^1.0.2
  sqflite: ^2.0.0+3
  path: ^1.8.0
Create the UI with Cupertino Widgets Use Cupertino widgets to build the user interface. Here's a simple implementation of the main screen:
Copy code
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: 'Platform Converter',
      home: ConverterScreen(),
    );
  }
}
Implement Database Logic Set up SQLite to store conversion history or user preferences. Here’s a basic example of how to implement the database helper:
Copy code
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;
  DatabaseHelper._internal();

  Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB();
    return _database!;
  }

  Future<Database> _initDB() async {
    String path = join(await getDatabasesPath(), 'converter.db');
    return await openDatabase(path, version: 1, onCreate: (db, version) {
      return db.execute(
        "CREATE TABLE conversions(id INTEGER PRIMARY KEY, value REAL, unit TEXT)",
      );
    });
  }

  Future<void> insertConversion(double value, String unit) async {
    final db = await database;
    await db.insert('conversions', {'value': value, 'unit': unit});
  }

  Future<List<Map<String, dynamic>>> getConversions() async {
    final db = await database;
    return await db.query('conversions');
  }
}



