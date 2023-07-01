class KeyDetails {
  String? encpinkey;
  String? encsesskey;
  String? clrpinkey;
  String? port;
  String? ip;
  String? clrsesskey;
  String? encmasterkey;
  String? paramdownload;
  String? tid;
  String? clrmasterkey;

  KeyDetails(
      {this.encpinkey,
        this.encsesskey,
        this.clrpinkey,
        this.port,
        this.ip,
        this.clrsesskey,
        this.encmasterkey,
        this.paramdownload,
        this.tid,
        this.clrmasterkey});

  KeyDetails.fromJson(Map<dynamic, dynamic> json) {
    encpinkey = json['encpinkey'];
    encsesskey = json['encsesskey'];
    clrpinkey = json['clrpinkey'];
    port = json['port'];
    ip = json['ip'];
    clrsesskey = json['clrsesskey'];
    encmasterkey = json['encmasterkey'];
    paramdownload = json['paramdownload'];
    tid = json['tid'];
    clrmasterkey = json['clrmasterkey'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['encpinkey'] = encpinkey;
    data['encsesskey'] = encsesskey;
    data['clrpinkey'] = clrpinkey;
    data['port'] = port;
    data['ip'] = ip;
    data['clrsesskey'] = clrsesskey;
    data['encmasterkey'] = encmasterkey;
    data['paramdownload'] = paramdownload;
    data['tid'] = tid;
    data['clrmasterkey'] = clrmasterkey;
    return data;
  }
}
