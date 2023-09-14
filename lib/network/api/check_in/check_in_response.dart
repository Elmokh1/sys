class CheckInResponse {
  int? proje_id;
  String? message;

  CheckInResponse({this.proje_id, this.message});

  CheckInResponse.fromJson(Map<String, dynamic> json) {
    proje_id = json['proje_id'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['proje_id'] = this.proje_id;
    data['message'] = this.message;
    return data;
  }
}
