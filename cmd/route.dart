import 'dart:async';
import 'dart:io';

List<String> data = [];

void main() async {
  String folderPath = 'lib/presentation/';
  List<String> fileNames = await getFileNamesInFolder(folderPath);
  final filePages = fileNames.map((e) => convertFileName(e)).toList();
  filePages.removeWhere((element) => element == '');
  for (var i = 0; i < filePages.length; i++) {
    final regex = RegExp(filePages[i]);
    final fol = await dirContents(Directory(folderPath + fileNames[i]));
    final files = fol.whereType<File>().toList();
    final currentFile = files.where((e) => e.path.substring(e.path.length - 10) == '_page.dart').firstOrNull;
    if(currentFile == null) return;
    final contents = await currentFile.readAsString();
    if(regex.hasMatch(contents)) {

    }
  }
}

Future<List<String>> getFileNamesInFolder(String folderPath) {
  Directory directory = Directory(folderPath);
  Stream<FileSystemEntity> entityList = directory.list();
  return entityList.map((entity) => entity.path.split('/').last).toList();
}

Future<List<FileSystemEntity>> dirContents(Directory dir) {
  var files = <FileSystemEntity>[];
  var completer = Completer<List<FileSystemEntity>>();
  var lister = dir.list(recursive: false);
  lister.listen((file) => files.add(file), onDone: () => completer.complete(files));
  return completer.future;
}

String convertFileName(String text) {
  if(text == 'shared') return '';
  String a = text.toLowerCase().replaceAllMapped(RegExp(r'[-_\s.]+(.)?'), (match) {
    String? c = match.group(1);
    return c != null ? c.toUpperCase() : '';
  });
  return '${a.substring(0, 1).toUpperCase()}${a.substring(1)}Page';
}