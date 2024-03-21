class HundredPayResponseModel {
  final Billing? billing;
  final Status? status;
  final String? refId;
  final List<dynamic>? payments;
  final String? chargeSource;
  final String? createdAt;
  final String? id;
  final Customer? customer;
  final Metadata? metadata;
  final String? callBackUrl;
  final String? userId;
  final String? appId;
  final String? chargeId;
  final int? V;
  final String? hostedUrl;
  const HundredPayResponseModel(
      {this.billing,
      this.status,
      this.refId,
      this.payments,
      this.chargeSource,
      this.createdAt,
      this.id,
      this.customer,
      this.metadata,
      this.callBackUrl,
      this.userId,
      this.appId,
      this.chargeId,
      this.V,
      this.hostedUrl});
  HundredPayResponseModel copyWith(
      {Billing? billing,
      Status? status,
      String? refId,
      List<dynamic>? payments,
      String? chargeSource,
      String? createdAt,
      String? id,
      Customer? customer,
      Metadata? metadata,
      String? callBackUrl,
      String? userId,
      String? appId,
      String? chargeId,
      int? V,
      String? hostedUrl}) {
    return HundredPayResponseModel(
        billing: billing ?? this.billing,
        status: status ?? this.status,
        refId: refId ?? this.refId,
        payments: payments ?? this.payments,
        chargeSource: chargeSource ?? this.chargeSource,
        createdAt: createdAt ?? this.createdAt,
        id: id ?? this.id,
        customer: customer ?? this.customer,
        metadata: metadata ?? this.metadata,
        callBackUrl: callBackUrl ?? this.callBackUrl,
        userId: userId ?? this.userId,
        appId: appId ?? this.appId,
        chargeId: chargeId ?? this.chargeId,
        V: V ?? this.V,
        hostedUrl: hostedUrl ?? this.hostedUrl);
  }

  Map<String, Object?> toJson() {
    return {
      'billing': billing?.toJson(),
      'status': status?.toJson(),
      'ref_id': refId,
      'payments': payments,
      'charge_source': chargeSource,
      'createdAt': createdAt,
      '_id': id,
      'customer': customer?.toJson(),
      'metadata': metadata?.toJson(),
      'call_back_url': callBackUrl,
      'userId': userId,
      'app_id': appId,
      'chargeId': chargeId,
      '__v': V,
      'hosted_url': hostedUrl
    };
  }

  static HundredPayResponseModel fromJson(Map<String, Object?> json) {
    return HundredPayResponseModel(
        billing: json['billing'] == null
            ? null
            : Billing.fromJson(json['billing'] as Map<String, Object?>),
        status: json['status'] == null
            ? null
            : Status.fromJson(json['status'] as Map<String, Object?>),
        refId: json['ref_id'] == null ? null : json['ref_id'] as String,
        payments:
            json['payments'] == null ? null : json['payments'] as List<dynamic>,
        chargeSource: json['charge_source'] == null
            ? null
            : json['charge_source'] as String,
        createdAt:
            json['createdAt'] == null ? null : json['createdAt'] as String,
        id: json['_id'] == null ? null : json['_id'] as String,
        customer: json['customer'] == null
            ? null
            : Customer.fromJson(json['customer'] as Map<String, Object?>),
        metadata: json['metadata'] == null
            ? null
            : Metadata.fromJson(json['metadata'] as Map<String, Object?>),
        callBackUrl: json['call_back_url'] == null
            ? null
            : json['call_back_url'] as String,
        userId: json['userId'] == null ? null : json['userId'] as String,
        appId: json['app_id'] == null ? null : json['app_id'] as String,
        chargeId: json['chargeId'] == null ? null : json['chargeId'] as String,
        V: json['__v'] == null ? null : json['__v'] as int,
        hostedUrl:
            json['hosted_url'] == null ? null : json['hosted_url'] as String);
  }

  @override
  String toString() {
    return '''TestModel(
                billing:${billing.toString()},
status:${status.toString()},
refId:$refId,
payments:$payments,
chargeSource:$chargeSource,
createdAt:$createdAt,
id:$id,
customer:${customer.toString()},
metadata:${metadata.toString()},
callBackUrl:$callBackUrl,
userId:$userId,
appId:$appId,
chargeId:$chargeId,
V:$V,
hostedUrl:$hostedUrl
    ) ''';
  }

  @override
  bool operator ==(Object other) {
    return other is HundredPayResponseModel &&
        other.runtimeType == runtimeType &&
        other.billing == billing &&
        other.status == status &&
        other.refId == refId &&
        other.payments == payments &&
        other.chargeSource == chargeSource &&
        other.createdAt == createdAt &&
        other.id == id &&
        other.customer == customer &&
        other.metadata == metadata &&
        other.callBackUrl == callBackUrl &&
        other.userId == userId &&
        other.appId == appId &&
        other.chargeId == chargeId &&
        other.V == V &&
        other.hostedUrl == hostedUrl;
  }

  @override
  int get hashCode {
    return Object.hash(
        runtimeType,
        billing,
        status,
        refId,
        payments,
        chargeSource,
        createdAt,
        id,
        customer,
        metadata,
        callBackUrl,
        userId,
        appId,
        chargeId,
        V,
        hostedUrl);
  }
}

class Metadata {
  final String? isApproved;
  const Metadata({this.isApproved});
  Metadata copyWith({String? isApproved}) {
    return Metadata(isApproved: isApproved ?? this.isApproved);
  }

  Map<String, Object?> toJson() {
    return {'is_approved': isApproved};
  }

  static Metadata fromJson(Map<String, Object?> json) {
    return Metadata(
        isApproved:
            json['is_approved'] == null ? null : json['is_approved'] as String);
  }

  @override
  String toString() {
    return '''Metadata(
                isApproved:$isApproved
    ) ''';
  }

  @override
  bool operator ==(Object other) {
    return other is Metadata &&
        other.runtimeType == runtimeType &&
        other.isApproved == isApproved;
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, isApproved);
  }
}

class Customer {
  final String? userId;
  final String? name;
  final String? phone;
  final String? email;
  const Customer({this.userId, this.name, this.phone, this.email});
  Customer copyWith(
      {String? userId, String? name, String? phone, String? email}) {
    return Customer(
        userId: userId ?? this.userId,
        name: name ?? this.name,
        phone: phone ?? this.phone,
        email: email ?? this.email);
  }

  Map<String, Object?> toJson() {
    return {'user_id': userId, 'name': name, 'phone': phone, 'email': email};
  }

  static Customer fromJson(Map<String, Object?> json) {
    return Customer(
        userId: json['user_id'] == null ? null : json['user_id'] as String,
        name: json['name'] == null ? null : json['name'] as String,
        phone: json['phone'] == null ? null : json['phone'] as String,
        email: json['email'] == null ? null : json['email'] as String);
  }

  @override
  String toString() {
    return '''Customer(
                userId:$userId,
name:$name,
phone:$phone,
email:$email
    ) ''';
  }

  @override
  bool operator ==(Object other) {
    return other is Customer &&
        other.runtimeType == runtimeType &&
        other.userId == userId &&
        other.name == name &&
        other.phone == phone &&
        other.email == email;
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, userId, name, phone, email);
  }
}

class Status {
  final Context? context;
  final String? value;
  final int? totalPaid;
  const Status({this.context, this.value, this.totalPaid});
  Status copyWith({Context? context, String? value, int? totalPaid}) {
    return Status(
        context: context ?? this.context,
        value: value ?? this.value,
        totalPaid: totalPaid ?? this.totalPaid);
  }

  Map<String, Object?> toJson() {
    return {
      'context': context?.toJson(),
      'value': value,
      'total_paid': totalPaid
    };
  }

  static Status fromJson(Map<String, Object?> json) {
    return Status(
        context: json['context'] == null
            ? null
            : Context.fromJson(json['context'] as Map<String, Object?>),
        value: json['value'] == null ? null : json['value'] as String,
        totalPaid:
            json['total_paid'] == null ? null : json['total_paid'] as int);
  }

  @override
  String toString() {
    return '''Status(
                context:${context.toString()},
value:$value,
totalPaid:$totalPaid
    ) ''';
  }

  @override
  bool operator ==(Object other) {
    return other is Status &&
        other.runtimeType == runtimeType &&
        other.context == context &&
        other.value == value &&
        other.totalPaid == totalPaid;
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, context, value, totalPaid);
  }
}

class Context {
  final String? status;
  final int? value;
  const Context({this.status, this.value});
  Context copyWith({String? status, int? value}) {
    return Context(status: status ?? this.status, value: value ?? this.value);
  }

  Map<String, Object?> toJson() {
    return {'status': status, 'value': value};
  }

  static Context fromJson(Map<String, Object?> json) {
    return Context(
        status: json['status'] == null ? null : json['status'] as String,
        value: json['value'] == null ? null : json['value'] as int);
  }

  @override
  String toString() {
    return '''Context(
                status:$status,
value:$value
    ) ''';
  }

  @override
  bool operator ==(Object other) {
    return other is Context &&
        other.runtimeType == runtimeType &&
        other.status == status &&
        other.value == value;
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, status, value);
  }
}

class Billing {
  final String? currency;
  final int? vat;
  final String? pricingType;
  final String? description;
  final String? amount;
  final String? country;
  const Billing(
      {this.currency,
      this.vat,
      this.pricingType,
      this.description,
      this.amount,
      this.country});
  Billing copyWith(
      {String? currency,
      int? vat,
      String? pricingType,
      String? description,
      String? amount,
      String? country}) {
    return Billing(
        currency: currency ?? this.currency,
        vat: vat ?? this.vat,
        pricingType: pricingType ?? this.pricingType,
        description: description ?? this.description,
        amount: amount ?? this.amount,
        country: country ?? this.country);
  }

  Map<String, Object?> toJson() {
    return {
      'currency': currency,
      'vat': vat,
      'pricing_type': pricingType,
      'description': description,
      'amount': amount,
      'country': country
    };
  }

  static Billing fromJson(Map<String, Object?> json) {
    return Billing(
        currency: json['currency'] == null ? null : json['currency'] as String,
        vat: json['vat'] == null ? null : json['vat'] as int,
        pricingType: json['pricing_type'] == null
            ? null
            : json['pricing_type'] as String,
        description:
            json['description'] == null ? null : json['description'] as String,
        amount: json['amount'] == null ? null : json['amount'] as String,
        country: json['country'] == null ? null : json['country'] as String);
  }

  @override
  String toString() {
    return '''Billing(
                currency:$currency,
vat:$vat,
pricingType:$pricingType,
description:$description,
amount:$amount,
country:$country
    ) ''';
  }

  @override
  bool operator ==(Object other) {
    return other is Billing &&
        other.runtimeType == runtimeType &&
        other.currency == currency &&
        other.vat == vat &&
        other.pricingType == pricingType &&
        other.description == description &&
        other.amount == amount &&
        other.country == country;
  }

  @override
  int get hashCode {
    return Object.hash(
        runtimeType, currency, vat, pricingType, description, amount, country);
  }
}
