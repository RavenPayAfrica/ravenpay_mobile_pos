class AflliateInfoModel {
  int? id;
  String? email;
  String? address;
  double? devicePrice;
  String? appName;
  String? appId;
  String? createdAt;
  String? updatedAt;
  String? serialNumber;

  AflliateInfoModel(
      {this.id,
      this.email,
      this.address,
      this.devicePrice,
      this.appName,
      this.appId,
      this.createdAt,
      this.updatedAt,
      this.serialNumber});
  AflliateInfoModel.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toInt();
    email = json['email']?.toString();
    address = json['address']?.toString();
    devicePrice = (json['device_price'] as num).toDouble();
    appName = json['app_name']?.toString();
    appId = json['app_id']?.toString();
    createdAt = json['created_at']?.toString();
    updatedAt = json['updated_at']?.toString();
    serialNumber = json['key_serial']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['email'] = email;
    data['address'] = address;
    data['device_price'] = devicePrice;
    data['app_name'] = appName;
    data['app_id'] = appId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['key_serial'] = serialNumber;
    return data;
  }
}
