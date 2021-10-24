import 'package:tech_test/%20model/images_model.dart';

class Album {
  String? name;
  String? artist;
  String? url;
  List<Images>? image;
  String? streamable;
  String? mbid;

  Album(
      {this.name,
      this.artist,
      this.url,
      this.image,
      this.streamable,
      this.mbid});

  Album.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    artist = json['artist'];
    url = json['url'];
    if (json['image'] != null) {
      image = [];
      json['image'].forEach((v) {
        image?.add(Images.fromJson(v));
      });
    }
    streamable = json['streamable'];
    mbid = json['mbid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['artist'] = artist;
    data['url'] = url;
    if (image != null) {
      data['image'] = image!.map((v) => v.toJson()).toList();
    }
    data['streamable'] = streamable;
    data['mbid'] = mbid;
    return data;
  }
}
