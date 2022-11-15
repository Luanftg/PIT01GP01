import 'dart:developer';
import 'dart:io';

import 'package:path_provider/path_provider.dart';

import '../../models/finantial_movement.dart';

class PathProviderService {
  static Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    log('directory: $directory.path');
    return directory.path;
  }

  static Future<File> get _localFile async {
    final path = await _localPath;
    log('path: $path');
    return File('$path/finantialMovement.txt');
  }

  static Future<File> writeFinantialMovement(
      FinantialMovement finantialMovement) async {
    final file = await _localFile;

    return file.writeAsString(finantialMovement.toJson(),
        mode: FileMode.append);
  }

  static Future<String> readFile() async {
    try {
      final file = await _localFile;

      final contents = await file.readAsString();
      log('contents: $contents');
      return contents;
    } catch (e) {
      return e.toString();
    }
  }
}
