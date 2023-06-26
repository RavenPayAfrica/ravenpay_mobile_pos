class TerminalModel {
  int? id;
  String? serial;
  String? email;
  String? businessName;
  String? tidLabel;
  String? tid;
  String? affiliateAppId;
  int? status;
  String? createdAt;
  String? updatedAt;

  TerminalModel({
    this.id,
    this.serial,
    this.email,
    this.businessName,
    this.tidLabel,
    this.tid,
    this.affiliateAppId,
    this.status,
    this.createdAt,
    this.updatedAt,
  });
  TerminalModel.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toInt();
    serial = json['serial']?.toString();
    email = json['email']?.toString();
    businessName = json['business_name']?.toString();
    tidLabel = json['tid_label']?.toString();
    tid = json['tid']?.toString();
    affiliateAppId = json['affiliate_app_id']?.toString();
    status = json['status']?.toInt();
    createdAt = json['created_at']?.toString();
    updatedAt = json['updated_at']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['serial'] = serial;
    data['email'] = email;
    data['business_name'] = businessName;
    data['tid_label'] = tidLabel;
    data['tid'] = tid;
    data['affiliate_app_id'] = affiliateAppId;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
