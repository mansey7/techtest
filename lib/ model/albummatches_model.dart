import 'package:tech_test/%20model/album_model.dart';

class Albummatches {
  List<Album>? album;

  Albummatches({this.album});

  Albummatches.fromJson(Map<String, dynamic> json) {
    if (json['album'] != null) {
      album = [];
      json['album'].forEach((v) {
        album!.add(Album.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (album != null) {
      data['album'] = album!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
