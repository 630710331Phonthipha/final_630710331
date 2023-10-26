import 'package:flutter/services.dart';
import 'package:final_630710331/models/Bangkok.dart';

class BangkokRepository{
  static List<Bangkok> bangkok = [];

  static Future<String> readJsonData(String path) async {
    return await rootBundle.loadString(path);
  }
}