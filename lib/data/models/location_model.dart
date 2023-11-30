class LocationModel {
  String? createdAt;
  String? name;
  String? code;
  String? id;

  LocationModel({this.createdAt, this.name, this.code, this.id});

  LocationModel.fromJson(Map<String, dynamic> json) {
    createdAt = json['created_at'];
    name = json['name'];
    code = json['code'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['created_at'] = createdAt;
    data['name'] = name;
    data['code'] = code;
    data['id'] = id;
    return data;
  }
}
