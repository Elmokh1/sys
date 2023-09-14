class LoginModel {
  int? uid;
  int? companyId;
  List<int>? companyIds;
  int? partnerId;
  String? accessToken;
  bool? companyName;
  bool? country;
  String? contactAddress;

  LoginModel(
      {
        this.uid,
        this.companyId,
        this.companyIds,
        this.partnerId,
        this.accessToken,
        this.companyName,
        this.country,
        this.contactAddress});

  LoginModel.fromJson(Map<String, dynamic> json) {
    uid = json['uid'];
    companyId = json['company_id'];
    if (json['company_ids'] != null) {
      if (json['company_ids'] is List) {
        companyIds = List<int>.from(json['company_ids']);
      } else {
        // Handle the case where 'company_ids' is not an array but a single integer.
        companyIds = [json['company_ids']];
      }
    }
    partnerId = json['partner_id'];
    accessToken = json['access_token'];
    companyName = json['company_name'];
    country = json['country'];
    contactAddress = json['contact_address'];
  }


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uid'] = this.uid;
    data['company_id'] = this.companyId;
    data['company_ids'] = this.companyIds;
    data['partner_id'] = this.partnerId;
    data['access_token'] = this.accessToken;
    data['company_name'] = this.companyName;
    data['country'] = this.country;
    data['contact_address'] = this.contactAddress;
    return data;
  }
}