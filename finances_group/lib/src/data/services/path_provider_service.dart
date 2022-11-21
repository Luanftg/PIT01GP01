import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:path_provider/path_provider.dart';

import '../../models/finantial_movement.dart';

class PathProviderService {
  static Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    //log('directory: $directory.path');
    return directory.path;
  }

  static Future<File> get _localFile async {
    final path = await _localPath;
    //log('path: $path');
    // var fileIni = File('$path/finantialMovement.txt');
    // await fileIni.delete();

    return File('$path/finantialMovement.txt');
  }

  static Future<File> writeFinantialMovement(
      FinantialMovement finantialMovement) async {
    final file = await _localFile;

    try {
      var readFile = await PathProviderService.readFile();
      //log('readFile: $readFile');
      var list = List.from(jsonDecode(readFile)).toList();
      //log('listOfDynamic: ${list.toString()}');
      var listOfFM = list.map((e) => FinantialMovement.fromMap(e)).toList();
      //log('listOFFM: ${listOfFM.toString()}');
      //list.add(readFile);
      listOfFM.add(finantialMovement);
      //log('listOFFMADDE: ${listOfFM.toString()}');
      var list2 = listOfFM.map((e) => e.toJson()).toList();
      //log('list2: ${list2.toString()}');
      return file.writeAsString(list2.toString());
    } catch (e) {
      //log('Exception: $e');
      var list = [];
      list.add(finantialMovement.toJson());
      //log('list: ${list.toString()}');
      return await file.writeAsString(list.toString());
    }
  }

  static Future<String> readFile() async {
    try {
      final file = await _localFile;

      final contents = await file.readAsString();
      //log('contents: $contents');
      return contents;
    } catch (e) {
      return e.toString();
    }
  }
}
