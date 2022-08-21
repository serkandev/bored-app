class activtyModel {
  dynamic? activity;
  dynamic? accessibility;
  dynamic? type;
  dynamic? participants;
  dynamic? price;
  dynamic? link;
  dynamic? key;

  activtyModel({this.activity, this.accessibility, this.type, this.participants, this.price, this.link, this.key});

  activtyModel.fromJson(Map<String, dynamic> json) {
    activity = json['activity'];
    accessibility = json['accessibility'];
    type = json['type'];
    participants = json['participants'];
    price = json['price'];
    link = json['link'];
    key = json['key'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['activity'] = activity;
    data['accessibility'] = accessibility;
    data['type'] = type;
    data['participants'] = participants;
    data['price'] = price;
    data['link'] = link;
    data['key'] = key;
    return data;
  }
}
