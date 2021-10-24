import 'package:tech_test/%20model/albummatches_model.dart';

class Results {
  Albummatches? albummatches;

  Results(this.albummatches);

  Results.fromJson(Map<String, dynamic> json) {
    albummatches = (json['albummatches'] != null
        ? Albummatches.fromJson(json['albummatches'])
        : null)!;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (albummatches != null) {
      data['albummatches'] = albummatches!.toJson();
    }
    return data;
  }
}
