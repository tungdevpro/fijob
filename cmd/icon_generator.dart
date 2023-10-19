import 'dart:io';

List<String> data = [];
void main() async {
  // Đường dẫn đến thư mục bạn muốn lấy danh sách tên file
  String folderPath = 'assets/icons/';

  // Gọi hàm lấy danh sách tên file
  List<String> fileNames = await getFileNamesInFolder(folderPath);

  // In danh sách tên file
  for (String fileName in fileNames) {
    final r = snakeCase(fileName.substring(0, fileName.length - 3));
    data.add("static const String ic${r[0].toUpperCase()}${r.substring(1)} = 'assets/icons/$fileName';");
  }
  final file = File('lib/commons/constants/asset/icon_resource.dart');
  file.writeAsStringSync('abstract class IconResource { \n', mode: FileMode.write);
  file.writeAsStringSync('\tconst IconResource._();\n', mode: FileMode.writeOnlyAppend);
  file.writeAsStringSync('\n', mode: FileMode.writeOnlyAppend);
  file.writeAsStringSync(data.join('\n\t'), mode: FileMode.writeOnlyAppend);
  file.writeAsStringSync('\n}', mode: FileMode.writeOnlyAppend);
}

Future<List<String>> getFileNamesInFolder(String folderPath) {
  Directory directory = Directory(folderPath);
  Stream<FileSystemEntity> entityList = directory.list();
  return entityList.where((entity) => entity is File).map((entity) => entity.path.split('/').last).toList();
}

String snakeCase(String text) {
  String a = text.toLowerCase().replaceAllMapped(RegExp(r'[-_\s.]+(.)?'), (match) {
    String? c = match.group(1);
    return c != null ? c.toUpperCase() : '';
  });
  return a.substring(0, 1).toLowerCase() + a.substring(1);
}
