class DetailsDataModel {
  String? name;
  String? title;
  String? text;
  String? img;
  String? time;
  String? prize;

  DetailsDataModel({
    this.name,
    this.title,
    this.text,
    this.img,
    this.time,
    this.prize,
  });

  // for getting data
  DetailsDataModel.fromJson({required Map<String, dynamic> json}) {
    name = json['name'];
    title = json['title'];
    text = json['text'];
    img = json['img'];
    time = json['time'];
    prize = json['prize'];
  }

  //for posting data
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['title'] = this.title;
    data['text'] = this.text;
    data['img'] = this.img;
    data['time'] = this.time;
    data['prize'] = this.prize;
    return data;
  }
}
