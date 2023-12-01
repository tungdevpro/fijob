import 'dart:convert';

class LocationRequester {
  final int? page;
  final int? limit;

  LocationRequester({
    this.page,
    this.limit,
  });

  factory LocationRequester.fromRawJson(String str) => LocationRequester.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory LocationRequester.fromJson(Map<String, dynamic> json) => LocationRequester(
        page: json["page"],
        limit: json["limit"],
      );

  Map<String, dynamic> toJson() => {
        "page": page,
        "limit": limit,
      };
}
