class DataLocal {
  String? key;
  int? code;
  String? content;
  int? maxAge;

  DataLocal({this.key, this.code, this.content, this.maxAge});

  DataLocal.fromJson(Map<String, dynamic> json) {
    key = json['key'];
    code = json['code'];
    content = json['content'];
    maxAge = json['max_age'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['key'] = key;
    data['code'] = code;
    data['content'] = content;
    data['max_age'] = maxAge;
    return data;
  }
}
