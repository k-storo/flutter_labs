import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

Future<List<Item>> fetchItems(http.Client client) async {
  final response = await client
      .get('https://my-json-server.typicode.com/k-storo/json_example/catalog');

  // Use the compute function to run parseItems in a separate isolate.
  return compute(parseItems, response.body);
}

// A function that converts a response body into a List<Item>.
List<Item> parseItems(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<Item>((json) => Item.fromJson(json)).toList();
}

class CatalogModel {
  Item getById(int id) => Item();

  Item getByPosition(int position) {
    return getById(position);
  }
}

class Item {
  final int id;
  final String name;
  final String picture;
  final String desc;
  final int watchingHours;
  final int viewCount;
  final String type;
  final String watchType;
  final String videoUrl;

  Item(
      {this.id,
      this.name,
      this.picture,
      this.desc,
      this.watchingHours,
      this.viewCount,
      this.type,
      this.watchType,
      this.videoUrl});

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      id: json['id'] as int,
      name: json['name'] as String,
      picture: json['picture'] as String,
      desc: json['desc'] as String,
      watchingHours: json['watchinghours'] as int,
      viewCount: json['viewcount'] as int,
      type: json['type'] as String,
      watchType: json['watchtype'] as String,
      videoUrl: json['videourl'] as String,
    );
  }

  @override
  int get hashCode => id;

  @override
  bool operator ==(Object other) => other is Item && other.id == id;
} //
