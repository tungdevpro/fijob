class DataLocal {
  String? key;
  int? code;
  String? content;

  DataLocal({this.key, this.code, this.content});

  DataLocal.fromJson(Map<String, dynamic> json) {
    key = json['key'];
    code = json['code'];
    content = json['content'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['key'] = key;
    data['code'] = code;
    data['content'] = content;
    return data;
  }
}
