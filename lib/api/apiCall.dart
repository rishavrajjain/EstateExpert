import 'dart:convert';

import 'package:google_maps_flutter_tutorial/model/places_response.dart';
import 'package:http/http.dart' as http;

Map<String, String> get headers => {
      "Content-Type": "application/json",
      "Accept": "application/json",
      "Authorization": "fsq3Yw8sdG/1V1qT1Ror6D2sXNWzU/V/yH1accKRGpVbItM=",
    };

class UsersApi {
  static Future<List<Result>> getUsersData(
      {required double latitude,
      required double longitude,
      String? queryData}) async {
    Uri url;
    url = Uri.parse(
        'https://api.foursquare.com/v3/places/search?ll=$latitude,$longitude');
    if (queryData != null) {
      url = Uri.parse(
          'https://api.foursquare.com/v3/places/search?ll=$latitude,$longitude&query=$queryData');
    }
    final res = await http.get(url, headers: headers);
    print('---------');
    print(res.body);
    var results = json.decode(res.body);
    print('---222222------');
    print(results);
    List<Result> usersList = [];
    print('---3333------');
    print(results['results'][3]);
    for (var u in results['results']) {
      Result user = Result.fromJson(u);
      usersList.add(user);
    }
    return usersList;
  }
}
