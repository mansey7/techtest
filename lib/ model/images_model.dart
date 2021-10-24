class Images {
  String? text;
  String? size;

  Images({this.text, this.size});

  Images.fromJson(Map<String, dynamic> json) {
    text = json['#text'];
    size = json['size'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['#text'] = text;
    data['size'] = size;
    return data;
  }
}