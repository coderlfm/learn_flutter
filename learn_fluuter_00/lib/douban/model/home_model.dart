// To parse this JSON data, do
//
//     final hotMoiveItem = hotMoiveItemFromMap(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

class HotMoiveItem {
  HotMoiveItem({
    required this.comment,
    required this.rating,
    required this.controversyReason,
    required this.pic,
    required this.rank,
    required this.uri,
    required this.isShow,
    required this.vendorIcons,
    required this.cardSubtitle,
    required this.id,
    required this.title,
    required this.hasLinewatch,
    required this.isReleased,
    required this.interest,
    required this.colorScheme,
    required this.type,
    required this.description,
    required this.tags,
    required this.coverUrl,
    required this.photos,
    required this.actions,
    required this.sharingUrl,
    required this.url,
    required this.honorInfos,
    required this.goodRatingStats,
    required this.subtype,
    required this.nullRatingReason,
  });

  String comment;
  Rating rating;
  String controversyReason;
  Pic pic;
  int rank;
  String uri;
  bool isShow;
  List<dynamic> vendorIcons;
  String cardSubtitle;
  String id;
  String title;
  bool hasLinewatch;
  bool isReleased;
  dynamic interest;
  ColorScheme colorScheme;
  String type;
  String description;
  List<dynamic> tags;
  String coverUrl;
  List<String> photos;
  List<String> actions;
  String sharingUrl;
  String url;
  List<HonorInfo> honorInfos;
  int goodRatingStats;
  String subtype;
  String nullRatingReason;

  factory HotMoiveItem.fromJson(String str) => HotMoiveItem.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory HotMoiveItem.fromMap(Map<String, dynamic> json) => HotMoiveItem(
        comment: json["comment"],
        rating: Rating.fromMap(json["rating"]),
        controversyReason: json["controversy_reason"],
        pic: Pic.fromMap(json["pic"]),
        rank: json["rank"],
        uri: json["uri"],
        isShow: json["is_show"],
        vendorIcons: List<dynamic>.from(json["vendor_icons"].map((x) => x)),
        cardSubtitle: json["card_subtitle"],
        id: json["id"],
        title: json["title"],
        hasLinewatch: json["has_linewatch"],
        isReleased: json["is_released"],
        interest: json["interest"],
        colorScheme: ColorScheme.fromMap(json["color_scheme"]),
        type: json["type"],
        description: json["description"],
        tags: List<dynamic>.from(json["tags"].map((x) => x)),
        coverUrl: json["cover_url"],
        photos: List<String>.from(json["photos"].map((x) => x)),
        actions: List<String>.from(json["actions"].map((x) => x)),
        sharingUrl: json["sharing_url"],
        url: json["url"],
        honorInfos: List<HonorInfo>.from(json["honor_infos"].map((x) => HonorInfo.fromMap(x))),
        goodRatingStats: json["good_rating_stats"],
        subtype: json["subtype"],
        nullRatingReason: json["null_rating_reason"],
      );

  Map<String, dynamic> toMap() => {
        "comment": comment,
        "rating": rating.toMap(),
        "controversy_reason": controversyReason,
        "pic": pic.toMap(),
        "rank": rank,
        "uri": uri,
        "is_show": isShow,
        "vendor_icons": List<dynamic>.from(vendorIcons.map((x) => x)),
        "card_subtitle": cardSubtitle,
        "id": id,
        "title": title,
        "has_linewatch": hasLinewatch,
        "is_released": isReleased,
        "interest": interest,
        "color_scheme": colorScheme.toMap(),
        "type": type,
        "description": description,
        "tags": List<dynamic>.from(tags.map((x) => x)),
        "cover_url": coverUrl,
        "photos": List<dynamic>.from(photos.map((x) => x)),
        "actions": List<dynamic>.from(actions.map((x) => x)),
        "sharing_url": sharingUrl,
        "url": url,
        "honor_infos": List<dynamic>.from(honorInfos.map((x) => x.toMap())),
        "good_rating_stats": goodRatingStats,
        "subtype": subtype,
        "null_rating_reason": nullRatingReason,
      };
}

class ColorScheme {
  ColorScheme({
    required this.isDark,
    required this.primaryColorLight,
    required this.baseColor,
    required this.secondaryColor,
    required this.avgColor,
    required this.primaryColorDark,
  });

  bool isDark;
  String primaryColorLight;
  List<double> baseColor;
  String secondaryColor;
  List<double> avgColor;
  String primaryColorDark;

  factory ColorScheme.fromJson(String str) => ColorScheme.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ColorScheme.fromMap(Map<String, dynamic> json) => ColorScheme(
        isDark: json["is_dark"],
        primaryColorLight: json["primary_color_light"],
        baseColor: List<double>.from(json["_base_color"].map((x) => x.toDouble())),
        secondaryColor: json["secondary_color"],
        avgColor: List<double>.from(json["_avg_color"].map((x) => x.toDouble())),
        primaryColorDark: json["primary_color_dark"],
      );

  Map<String, dynamic> toMap() => {
        "is_dark": isDark,
        "primary_color_light": primaryColorLight,
        "_base_color": List<dynamic>.from(baseColor.map((x) => x)),
        "secondary_color": secondaryColor,
        "_avg_color": List<dynamic>.from(avgColor.map((x) => x)),
        "primary_color_dark": primaryColorDark,
      };
}

class HonorInfo {
  HonorInfo({
    required this.kind,
    required this.uri,
    required this.rank,
    required this.title,
  });

  String kind;
  String uri;
  int rank;
  String title;

  factory HonorInfo.fromJson(String str) => HonorInfo.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory HonorInfo.fromMap(Map<String, dynamic> json) => HonorInfo(
        kind: json["kind"],
        uri: json["uri"],
        rank: json["rank"],
        title: json["title"],
      );

  Map<String, dynamic> toMap() => {
        "kind": kind,
        "uri": uri,
        "rank": rank,
        "title": title,
      };
}

class Pic {
  Pic({
    required this.large,
    required this.normal,
  });

  String large;
  String normal;

  factory Pic.fromJson(String str) => Pic.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Pic.fromMap(Map<String, dynamic> json) => Pic(
        large: json["large"],
        normal: json["normal"],
      );

  Map<String, dynamic> toMap() => {
        "large": large,
        "normal": normal,
      };
}

class Rating {
  Rating({
    required this.count,
    required this.max,
    required this.starCount,
    required this.value,
  });

  int count;
  int max;
  double starCount;
  double value;

  factory Rating.fromJson(String str) => Rating.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Rating.fromMap(Map<String, dynamic> json) => Rating(
        count: json["count"],
        max: json["max"],
        starCount: json["star_count"],
        value: json["value"].toDouble(),
      );

  Map<String, dynamic> toMap() => {
        "count": count,
        "max": max,
        "star_count": starCount,
        "value": value,
      };
}
