class CardTransactionResponseModel {
  RavenEMV? ravenEMV;
  NibbsEMV? nibbsEMV;

  CardTransactionResponseModel({this.nibbsEMV, this.ravenEMV});
  factory CardTransactionResponseModel.fromJson(Map<String, dynamic> json) {
    return CardTransactionResponseModel(
        nibbsEMV: NibbsEMV.fromJson(json['nibbsEmv']),
        ravenEMV: RavenEMV.fromJson(json['dataModel']));
  }
  bool get isSuccessful => ravenEMV!.responseCode == '00' ? true : false;

  String get maskedCardNo => ravenEMV!.cardNo!.isEmpty
      ? ""
      : '${ravenEMV!.cardNo!.substring(0, 6)} ****** ${ravenEMV!.cardNo!.substring(ravenEMV!.cardNo!.length - 4, ravenEMV!.cardNo!.length)}';

  String get maskedPAN => nibbsEMV!.pan!.isEmpty
      ? ""
      : '${nibbsEMV!.pan!.substring(0, 6)}******${nibbsEMV!.pan!.substring(nibbsEMV!.pan!.length - 4, ravenEMV!.cardNo!.length)}';

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['nibbsEmv'] = nibbsEMV!.toJson();
    data['dataModel'] = ravenEMV!.toJson();

    return data;
  }
}

class RavenEMV {
  String? accountType;
  String? cardHolderName;
  String? cardNo;
  String? cardSequenceNumber;
  String? iccData;
  String? pinBlock;
  String? tLV;
  String? terminaID;
  String? track2;
  String? transactionType;
  String? amount;
  String? responseCode;
  String? totalAmoount;
  String? cardOrg;
  String? cardType;
  String? pSerialNo;

  RavenEMV(
      {this.accountType,
      this.cardHolderName,
      this.cardNo,
      this.cardSequenceNumber,
      this.iccData,
      this.pinBlock,
      this.tLV,
      this.terminaID,
      this.track2,
      this.transactionType,
      this.amount,
      this.responseCode,
      this.totalAmoount,
      this.cardOrg,
      this.pSerialNo = '',
      this.cardType});
  RavenEMV.fromJson(Map<String, dynamic> json) {
    cardOrg = json['cardOrg']?.toString();
    cardType = json['cardType']?.toString();
    accountType = json['AccountType']?.toString();
    cardHolderName = _hexTocAscii(json['CardHolderName']?.toString() ?? "");
    cardNo = json['CardNo']?.toString();
    cardSequenceNumber = json['CardSequenceNumber']?.toString();
    iccData = json['IccData']?.toString();
    pinBlock = json['PinBlock']?.toString();
    tLV = json['TLV']?.toString();
    terminaID = json['TerminaID']?.toString();
    track2 = json['Track2']?.toString();
    transactionType = json['TransactionType']?.toString();
    amount = json['amount']?.toString();
    responseCode = json['responseCode']?.toString();
    totalAmoount = json['totalAmoount']?.toString();
    pSerialNo = json['poseidonSerialNumber']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['cardType'] = cardType;
    data['cardOrg'] = cardOrg;
    data['AccountType'] = accountType;
    data['CardHolderName'] = cardHolderName;
    data['CardNo'] = cardNo;
    data['CardSequenceNumber'] = cardSequenceNumber;
    data['IccData'] = iccData;
    data['PinBlock'] = pinBlock ?? '';
    data['TLV'] = tLV;
    data['TerminaID'] = terminaID;
    data['Track2'] = track2;
    data['TransactionType'] = transactionType;
    data['amount'] = amount;
    data['responseCode'] = responseCode;
    data['totalAmoount'] = totalAmoount;
    data['poseidonSerialNumber'] = pSerialNo;
    return data;
  }

  String _hexTocAscii(String hexString) => hexString.isEmpty
      ? ""
      : List.generate(
          hexString.length ~/ 2,
          (i) => String.fromCharCode(
              int.parse(hexString.substring(i * 2, (i * 2) + 2), radix: 16)),
        ).join();
}

class NibbsEMV {
  String? account;
  String? aip;
  String? amount;
  String? atc;
  String? capabilities;
  String? cip;
  String? clrpin;
  String? clrsesskey;
  String? cryptogram;
  String? cvm;
  String? expirydate;
  String? field0;
  String? field11;
  String? field12;
  String? field123;
  String? field128;
  String? field13;
  String? field14;
  String? field18;
  String? field2;
  String? field22;
  String? field23;
  String? field25;
  String? field26;
  String? field28;
  String? field3;
  String? field32;
  String? field35;
  String? field37;
  String? field4;
  String? field40;
  String? field41;
  String? field42;
  String? field43;
  String? field49;
  String? field52;
  String? field55;
  String? field7;
  String? filename;
  String? host;
  String? iad;
  String? mid;
  String? pan;
  String? panseqno;
  String? pinblock;
  String? port;
  String? rrn;
  String? sn;
  bool? ssl;
  String? stan;
  String? tid;
  String? totalamount;
  String? track;
  String? tvr;
  String? unpredictable;

  String get fomattedExpiry {
    final month = expirydate!.substring(2);
    final year = expirydate!.substring(0, 2);

    return '$month/$year';
  }

  NibbsEMV({
    this.account,
    this.aip,
    this.amount,
    this.atc,
    this.capabilities,
    this.cip,
    this.clrpin,
    this.clrsesskey,
    this.cryptogram,
    this.cvm,
    this.expirydate,
    this.field0,
    this.field11,
    this.field12,
    this.field123,
    this.field128,
    this.field13,
    this.field14,
    this.field18,
    this.field2,
    this.field22,
    this.field23,
    this.field25,
    this.field26,
    this.field28,
    this.field3,
    this.field32,
    this.field35,
    this.field37,
    this.field4,
    this.field40,
    this.field41,
    this.field42,
    this.field43,
    this.field49,
    this.field52,
    this.field55,
    this.field7,
    this.filename,
    this.host,
    this.iad,
    this.mid,
    this.pan,
    this.panseqno,
    this.pinblock,
    this.port,
    this.rrn,
    this.sn,
    this.ssl,
    this.stan,
    this.tid,
    this.totalamount,
    this.track,
    this.tvr,
    this.unpredictable,
  });
  NibbsEMV.fromJson(Map<String, dynamic> json) {
    account = json['account']?.toString();
    aip = json['aip']?.toString();
    amount = json['amount']?.toString();
    atc = json['atc']?.toString();
    capabilities = json['capabilities']?.toString();
    cip = json['cip']?.toString();
    clrpin = json['clrpin']?.toString();
    clrsesskey = json['clrsesskey']?.toString();
    cryptogram = json['cryptogram']?.toString();
    cvm = json['cvm']?.toString();
    expirydate = json['expirydate']?.toString();
    field0 = json['field0']?.toString();
    field11 = json['field11']?.toString();
    field12 = json['field12']?.toString();
    field123 = json['field123']?.toString();
    field128 = json['field128']?.toString();
    field13 = json['field13']?.toString();
    field14 = json['field14']?.toString();
    field18 = json['field18']?.toString();
    field2 = json['field2']?.toString();
    field22 = json['field22']?.toString();
    field23 = json['field23']?.toString();
    field25 = json['field25']?.toString();
    field26 = json['field26']?.toString();
    field28 = json['field28']?.toString();
    field3 = json['field3']?.toString();
    field32 = json['field32']?.toString();
    field35 = json['field35']?.toString();
    field37 = json['field37']?.toString();
    field4 = json['field4']?.toString();
    field40 = json['field40']?.toString();
    field41 = json['field41']?.toString();
    field42 = json['field42']?.toString();
    field43 = json['field43']?.toString();
    field49 = json['field49']?.toString();
    field52 = json['field52']?.toString();
    field55 = json['field55']?.toString();
    field7 = json['field7']?.toString();
    filename = json['filename']?.toString();
    host = json['host']?.toString();
    iad = json['iad']?.toString();
    mid = json['mid']?.toString();
    pan = json['pan']?.toString();
    panseqno = json['panseqno']?.toString();
    pinblock = json['pinblock']?.toString();
    port = json['port']?.toString();
    rrn = json['rrn']?.toString();
    sn = json['sn']?.toString();
    ssl = json['ssl'];
    stan = json['stan']?.toString();
    tid = json['tid']?.toString();
    totalamount = json['totalamount']?.toString();
    track = json['track']?.toString();
    tvr = json['tvr']?.toString();
    unpredictable = json['unpredictable']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['account'] = account;
    data['aip'] = aip;
    data['amount'] = amount;
    data['atc'] = atc;
    data['capabilities'] = capabilities;
    data['cip'] = cip;
    data['clrpin'] = clrpin;
    data['clrsesskey'] = clrsesskey;
    data['cryptogram'] = cryptogram;
    data['cvm'] = cvm;
    data['expirydate'] = expirydate;
    data['field0'] = field0;
    data['field11'] = field11;
    data['field12'] = field12;
    data['field123'] = field123;
    data['field128'] = field128;
    data['field13'] = field13;
    data['field14'] = field14;
    data['field18'] = field18;
    data['field2'] = field2;
    data['field22'] = field22;
    data['field23'] = field23;
    data['field25'] = field25;
    data['field26'] = field26;
    data['field28'] = field28;
    data['field3'] = field3;
    data['field32'] = field32;
    data['field35'] = field35;
    data['field37'] = field37;
    data['field4'] = field4;
    data['field40'] = field40;
    data['field41'] = field41;
    data['field42'] = field42;
    data['field43'] = field43;
    data['field49'] = field49;
    data['field52'] = field52;
    data['field55'] = field55;
    data['field7'] = field7;
    data['filename'] = filename;
    data['host'] = host;
    data['iad'] = iad;
    data['mid'] = mid;
    data['pan'] = pan;
    data['panseqno'] = panseqno;
    data['pinblock'] = pinblock;
    data['port'] = port;
    data['rrn'] = rrn;
    data['sn'] = sn;
    data['ssl'] = ssl;
    data['stan'] = stan;
    data['tid'] = tid;
    data['totalamount'] = totalamount;
    data['track'] = track;
    data['tvr'] = tvr;
    data['unpredictable'] = unpredictable;
    return data;
  }
}
