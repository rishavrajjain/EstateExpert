// To parse this JSON data, do
//
//     final places = placesFromJson(jsonString);

import 'dart:convert';

Places placesFromJson(String str) => Places.fromJson(json.decode(str));

String placesToJson(Places data) => json.encode(data.toJson());

class Places {
  Places({
    this.results,
    this.context,
  });

  List<Result>? results;
  Context? context;

  factory Places.fromJson(Map<String, dynamic> json) => Places(
        results:
            List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
        context: Context.fromJson(json["context"]),
      );

  Map<String, dynamic> toJson() => {
        "results": List<dynamic>.from(results!.map((x) => x.toJson())),
        "context": context!.toJson(),
      };
}

class Context {
  Context({
    this.geoBounds,
  });

  GeoBounds? geoBounds;

  factory Context.fromJson(Map<String, dynamic> json) => Context(
        geoBounds: GeoBounds.fromJson(json["geo_bounds"]),
      );

  Map<String, dynamic> toJson() => {
        "geo_bounds": geoBounds!.toJson(),
      };
}

class GeoBounds {
  GeoBounds({
    this.circle,
  });

  Circle? circle;

  factory GeoBounds.fromJson(Map<String, dynamic> json) => GeoBounds(
        circle: Circle.fromJson(json["circle"]),
      );

  Map<String, dynamic> toJson() => {
        "circle": circle!.toJson(),
      };
}

class Circle {
  Circle({
    this.center,
    this.radius,
  });

  LocationCenter? center;
  int? radius;

  factory Circle.fromJson(Map<String, dynamic> json) => Circle(
        center: LocationCenter.fromJson(json["center"]),
        radius: json["radius"],
      );

  Map<String, dynamic> toJson() => {
        "center": center!.toJson(),
        "radius": radius,
      };
}

class LocationCenter {
  LocationCenter({
    this.latitude,
    this.longitude,
  });

  double? latitude;
  double? longitude;

  factory LocationCenter.fromJson(Map<String, dynamic> json) => LocationCenter(
        latitude: json["latitude"].toDouble(),
        longitude: json["longitude"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "latitude": latitude,
        "longitude": longitude,
      };
}

class Result {
  Result({
    this.fsqId,
    this.categories,
    this.chains,
    this.distance,
    this.geocodes,
    this.link,
    this.location,
    this.name,
    this.relatedPlaces,
    this.timezone,
  });

  String? fsqId;
  List<Category>? categories;
  List<dynamic>? chains;
  int? distance;
  Geocodes? geocodes;
  String? link;
  Location? location;
  String? name;
  RelatedPlaces? relatedPlaces;
  String? timezone;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        fsqId: json["fsq_id"],
        categories: List<Category>.from(
            json["categories"].map((x) => Category.fromJson(x))),
        chains: List<dynamic>.from(json["chains"].map((x) => x)),
        distance: json["distance"],
        geocodes: Geocodes.fromJson(json["geocodes"]),
        link: json["link"],
        location: Location.fromJson(json["location"]),
        name: json["name"],
        relatedPlaces: RelatedPlaces.fromJson(json["related_places"]),
        timezone: json["timezone"],
      );

  Map<String, dynamic> toJson() => {
        "fsq_id": fsqId,
        "categories": List<dynamic>.from(categories!.map((x) => x.toJson())),
        "chains": List<dynamic>.from(chains!.map((x) => x)),
        "distance": distance,
        "geocodes": geocodes!.toJson(),
        "link": link,
        "location": location!.toJson(),
        "name": name,
        "related_places": relatedPlaces!.toJson(),
        "timezone": timezone,
      };
}

class Category {
  Category({
    this.id,
    this.name,
    this.icon,
  });

  int? id;
  String? name;
  IconData? icon;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        name: json["name"],
        icon: IconData.fromJson(json["icon"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "icon": icon!.toJson(),
      };
}

class IconData {
  IconData({
    this.prefix,
    this.suffix,
  });

  String? prefix;
  String? suffix;

  factory IconData.fromJson(Map<String, dynamic> json) => IconData(
        prefix: json["prefix"],
        suffix: json["suffix"],
      );

  Map<String, dynamic> toJson() => {
        "prefix": prefix,
        "suffix": suffix,
      };
}

enum Suffix { PNG }

final suffixValues = EnumValues({".png": Suffix.PNG});

class Geocodes {
  Geocodes({
    this.main,
    this.roof,
  });

  LocationCenter? main;
  LocationCenter? roof;

  factory Geocodes.fromJson(Map<String, dynamic> json) => Geocodes(
        main: LocationCenter.fromJson(json["main"]),
        roof: json["roof"] == null ? null : LocationCenter.fromJson(json["roof"]),
      );

  Map<String, dynamic> toJson() => {
        "main": main!.toJson(),
        "roof": roof == null ? null : roof!.toJson(),
      };
}

class Location {
  Location({
    this.censusBlock,
    this.country,
    this.crossStreet,
    this.dma,
    this.formattedAddress,
    this.locality,
    this.postcode,
    this.region,
    this.address,
  });

  String? censusBlock;
  Country? country;
  String? crossStreet;
  Dma? dma;
  String? formattedAddress;
  String? locality;
  String? postcode;
  Region? region;
  String? address;

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        censusBlock: json["census_block"],
        country: countryValues.map[json["country"]],
        crossStreet: json["cross_street"],
        dma: dmaValues.map[json["dma"]],
        formattedAddress: json["formatted_address"],
        locality: json["locality"],
        postcode: json["postcode"],
        region: regionValues.map[json["region"]],
        address: json["address"],
      );

  Map<String, dynamic> toJson() => {
        "census_block": censusBlock,
        "country": countryValues.reverse[country],
        "cross_street": crossStreet,
        "dma": dmaValues.reverse[dma],
        "formatted_address": formattedAddress,
        "locality": locality,
        "postcode": postcode,
        "region": regionValues.reverse[region],
        "address": address,
      };
}

enum Country { US }

final countryValues = EnumValues({"US": Country.US});

enum Dma { WICHITA_HUTCHINSON_PLUS }

final dmaValues =
    EnumValues({"Wichita-Hutchinson Plus": Dma.WICHITA_HUTCHINSON_PLUS});

enum Region { KS }

final regionValues = EnumValues({"KS": Region.KS});

class RelatedPlaces {
  RelatedPlaces();

  factory RelatedPlaces.fromJson(Map<String, dynamic> json) => RelatedPlaces();

  Map<String, dynamic> toJson() => {};
}

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap ??= map.map((k, v) => MapEntry(v, k));
    return reverseMap!;
  }
}
