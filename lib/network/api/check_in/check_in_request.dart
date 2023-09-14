


class CheckInRequest {
  CheckInRequest({
    this.access_token,
    this.id,});

  CheckInRequest.fromJson(dynamic json) {
    access_token = json['access_token'];
    id = json['id'];
  }
  String? access_token;
  String? id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['access_token'] = access_token;
    map['id'] = id;
    return map;
  }
}
