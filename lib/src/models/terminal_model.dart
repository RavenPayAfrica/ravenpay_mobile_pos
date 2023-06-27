abstract class Terminal {}

class TerminalModel extends Terminal {
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

class TerminalRequestModel extends Terminal {
  int? id;
  String? email;
  String? quantity;
  int? amount;
  String? purpose;
  String? deliveryState;
  String? deliveryLga;
  String? deliveryAddress;
  String? landmark;
  int? status;
  String? declineReason;
  String? type;
  String? deliveryOption;
  String? affiliateAppId;
  String? createdAt;

  TerminalRequestModel({
    this.id,
    this.email,
    this.quantity,
    this.amount,
    this.purpose,
    this.deliveryState,
    this.deliveryLga,
    this.deliveryAddress,
    this.landmark,
    this.status,
    this.declineReason,
    this.type,
    this.deliveryOption,
    this.affiliateAppId,
    this.createdAt,
  });
  TerminalRequestModel.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toInt();
    email = json['email']?.toString();
    quantity = json['quantity']?.toString();
    amount = json['amount']?.toInt();
    purpose = json['purpose']?.toString();
    deliveryState = json['delivery_state']?.toString();
    deliveryLga = json['delivery_lga']?.toString();
    deliveryAddress = json['delivery_address']?.toString();
    landmark = json['landmark']?.toString();
    status = json['status']?.toInt();
    declineReason = json['decline_reason']?.toString();
    type = json['type']?.toString();
    deliveryOption = json['delivery_option']?.toString();
    affiliateAppId = json['affiliate_app_id']?.toString();
    createdAt = json['created_at']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['email'] = email;
    data['quantity'] = quantity;
    data['amount'] = amount;
    data['purpose'] = purpose;
    data['delivery_state'] = deliveryState;
    data['delivery_lga'] = deliveryLga;
    data['delivery_address'] = deliveryAddress;
    data['landmark'] = landmark;
    data['status'] = status;
    data['decline_reason'] = declineReason;
    data['type'] = type;
    data['delivery_option'] = deliveryOption;
    data['affiliate_app_id'] = affiliateAppId;
    data['created_at'] = createdAt;
    return data;
  }
}
