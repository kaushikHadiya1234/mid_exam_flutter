// To parse this JSON data, do
//
//     final reviewModel = reviewModelFromJson(jsonString);

import 'dart:convert';

ReviewModel reviewModelFromJson(String str) => ReviewModel.fromJson(json.decode(str));

String reviewModelToJson(ReviewModel data) => json.encode(data.toJson());

class ReviewModel {
  String? status;
  String? requestId;
  List<Datum>? data;

  ReviewModel({
    this.status,
    this.requestId,
    this.data,
  });

  factory ReviewModel.fromJson(Map<String, dynamic> json) => ReviewModel(
    status: json["status"],
    requestId: json["request_id"],
    data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "request_id": requestId,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Datum {
  String? reviewId;
  String? reviewTitle;
  String? reviewAuthor;
  String? reviewSource;
  String? reviewSourceUrl;
  String? reviewText;
  int? rating;
  DateTime? reviewDatetimeUtc;
  ReviewLanguage? reviewLanguage;
  List<String>? photos;

  Datum({
    this.reviewId,
    this.reviewTitle,
    this.reviewAuthor,
    this.reviewSource,
    this.reviewSourceUrl,
    this.reviewText,
    this.rating,
    this.reviewDatetimeUtc,
    this.reviewLanguage,
    this.photos,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    reviewId: json["review_id"],
    reviewTitle: json["review_title"],
    reviewAuthor: json["review_author"],
    reviewSource: json["review_source"],
    reviewSourceUrl: json["review_source_url"],
    reviewText: json["review_text"],
    rating: json["rating"],
    reviewDatetimeUtc: json["review_datetime_utc"] == null ? null : DateTime.parse(json["review_datetime_utc"]),
    reviewLanguage: reviewLanguageValues.map[json["review_language"]]!,
    photos: json["photos"] == null ? [] : List<String>.from(json["photos"]!.map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "review_id": reviewId,
    "review_title": reviewTitle,
    "review_author": reviewAuthor,
    "review_source": reviewSource,
    "review_source_url": reviewSourceUrl,
    "review_text": reviewText,
    "rating": rating,
    "review_datetime_utc": reviewDatetimeUtc?.toIso8601String(),
    "review_language": reviewLanguageValues.reverse[reviewLanguage],
    "photos": photos == null ? [] : List<dynamic>.from(photos!.map((x) => x)),
  };
}

enum ReviewLanguage { EN }

final reviewLanguageValues = EnumValues({
  "en": ReviewLanguage.EN
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
