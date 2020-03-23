import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:puan_hesaplama/models/exam.dart';
import 'package:path/path.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static DatabaseHelper _databaseHelper;
  static Database _database;

  String _examTable = 'exams';
  String _columnID = "id";
  String _columnName = "name";
  String _columnTyt = "tyt";
  String _columnObp = "obp";
  String _columnSay = "say";
  String _columnSoz = "soz";
  String _columnEst = "est";
  String _columnDil = "dil";
  String _columnDate = "date" ;



  DatabaseHelper._internal();

  factory DatabaseHelper() {
    if (_databaseHelper == null) {
      _databaseHelper = DatabaseHelper._internal();
      return _databaseHelper;
    }else{
      return _databaseHelper;
    }
  }

  Future<Database> _getDatabase() async {
    if (_database == null) {
      _database = await _initializeDatabase();
      return _database;
    } else {
      return _database;
    }
  }

  _initializeDatabase() async {
    Directory path = await getApplicationDocumentsDirectory();
    String filePath = join(path.path, "exams.db");

    var studentDB =
        await openDatabase(filePath, version: 1, onCreate: _createDB);

    return studentDB;
  }

  Future _createDB(Database db, int version) async {
    await db.execute(
        "CREATE TABLE $_examTable ($_columnID INTEGER PRIMARY KEY AUTOINCREMENT, $_columnName TEXT, $_columnTyt DOUBLE, $_columnObp DOUBLE,$_columnSay DOUBLE,$_columnSoz DOUBLE,$_columnEst DOUBLE,$_columnDil DOUBLE, $_columnDate TEXT )");
  }

  Future<int> addExam(Exam exam) async {
    var db = await _getDatabase();
    var result = db.insert(_examTable, exam.toMap());
    debugPrint("başarılı");
    return result;
  }

  Future<List<Map<String,dynamic>>> getExams() async{
    var db = await _getDatabase();
    var result = db.query(_examTable,orderBy: '$_columnID DESC' );
    return result;
  }

  Future<int> updateExam(Exam exam) async{
    var db = await _getDatabase();
    var result = db.update(_examTable, exam.toMap(),where: '$_columnID = ?',whereArgs: [exam.id]);
  return result;
  }

  Future<int> deleteExam(int id) async{
    var db = await _getDatabase();
    var result= db.delete(_examTable,where: '$_columnID = ?',whereArgs: [id]);
    return result;
  }

  Future<int> deleteAllExam() async{
    var db = await _getDatabase();
    var result= db.delete(_examTable);
    return result;
  }
}
