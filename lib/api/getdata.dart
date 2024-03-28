class Charge {
  final String id;
  final String reference;
  final ChargeData data;

  Charge({required this.id, required this.reference, required this.data});

  factory Charge.fromJson(Map<String, dynamic> json) {
    return Charge(
      id: json['_id'],
      reference: json['reference'],
      data: ChargeData.fromJson(json['data']),
    );
  }
}

class ChargeData {
  final String network;
  final String transactionId;
  final String status;
  final String timestamp;
  final Value value;
  final Block block;
  final ChargeDetails charge;

  ChargeData({
    required this.network,
    required this.transactionId,
    required this.status,
    required this.timestamp,
    required this.value,
    required this.block,
    required this.charge,
  });

  factory ChargeData.fromJson(Map<String, dynamic> json) {
    return ChargeData(
      network: json['network'],
      transactionId: json['transaction_id'],
      status: json['status'],
      timestamp: json['timestamp'],
      value: Value.fromJson(json['value']),
      block: Block.fromJson(json['block']),
      charge: ChargeDetails.fromJson(json['charge']),
    );
  }
}

class Value {
  final LocalValue local;
  final CryptoValue crypto;

  Value({required this.local, required this.crypto});

  factory Value.fromJson(Map<String, dynamic> json) {
    return Value(
      local: LocalValue.fromJson(json['local']),
      crypto: CryptoValue.fromJson(json['crypto']),
    );
  }
}

class LocalValue {
  final double amount;
  final String currency;

  LocalValue({required this.amount, required this.currency});

  factory LocalValue.fromJson(Map<String, dynamic> json) {
    return LocalValue(
      amount: json['amount'],
      currency: json['currency'],
    );
  }
}

class CryptoValue {
  final double amount;
  final String currency;

  CryptoValue({required this.amount, required this.currency});

  factory CryptoValue.fromJson(Map<String, dynamic> json) {
    return CryptoValue(
      amount: json['amount'],
      currency: json['currency'],
    );
  }
}

class Block {
  final int height;
  final String hash;

  Block({required this.height, required this.hash});

  factory Block.fromJson(Map<String, dynamic> json) {
    return Block(
      height: json['height'],
      hash: json['hash'],
    );
  }
}

class ChargeDetails {
  final Customer customer;
  final Billing billing;
  final Status status;
  final String refId;
  final List<Payment> payments;

  ChargeDetails({
    required this.customer,
    required this.billing,
    required this.status,
    required this.refId,
    required this.payments,
  });

  factory ChargeDetails.fromJson(Map<String, dynamic> json) {
    return ChargeDetails(
      customer: Customer.fromJson(json['customer']),
      billing: Billing.fromJson(json['billing']),
      status: Status.fromJson(json['status']),
      refId: json['ref_id'],
      payments:
          List<Payment>.from(json['payments'].map((x) => Payment.fromJson(x))),
    );
  }
}

class Customer {
  final String userId;
  final String name;
  final String phone;
  final String email;

  Customer(
      {required this.userId,
      required this.name,
      required this.phone,
      required this.email});

  factory Customer.fromJson(Map<String, dynamic> json) {
    return Customer(
      userId: json['user_id'],
      name: json['name'],
      phone: json['phone'],
      email: json['email'],
    );
  }
}

class Billing {
  final String currency;
  final int vat;
  final String pricingType;
  final String description;
  final String amount;
  final String country;

  Billing({
    required this.currency,
    required this.vat,
    required this.pricingType,
    required this.description,
    required this.amount,
    required this.country,
  });

  factory Billing.fromJson(Map<String, dynamic> json) {
    return Billing(
      currency: json['currency'],
      vat: json['vat'],
      pricingType: json['pricing_type'],
      description: json['description'],
      amount: json['amount'],
      country: json['country'],
    );
  }
}

class Status {
  final Context context;
  final String value;
  final double totalPaid;

  Status({required this.context, required this.value, required this.totalPaid});

  factory Status.fromJson(Map<String, dynamic> json) {
    return Status(
      context: Context.fromJson(json['context']),
      value: json['value'],
      totalPaid: json['total_paid'],
    );
  }
}

class Context {
  final String status;
  final double value;

  Context({required this.status, required this.value});

  factory Context.fromJson(Map<String, dynamic> json) {
    return Context(
      status: json['status'],
      value: json['value'],
    );
  }
}

class Payment {
  final String network;
  final String transactionId;
  final String status;

  Payment(
      {required this.network,
      required this.transactionId,
      required this.status});

  factory Payment.fromJson(Map<String, dynamic> json) {
    return Payment(
      network: json['network'],
      transactionId: json['transaction_id'],
      status: json['status'],
    );
  }
}
