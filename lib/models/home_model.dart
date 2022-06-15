class HomeModel {
  bool status;
  String message;
  HomeData data;

  HomeModel({this.status, this.message, this.data});

  HomeModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new HomeData.fromJson(json['data']) : null;
  }

}

class HomeData {
  String temp;

  HomeData({this.temp});

  HomeData.fromJson(Map<String, dynamic> json) {
    temp = json['temp'];
  }

}