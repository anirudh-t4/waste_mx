class VendorTransaction {
  final bool pending;
  final String type;
  final String clientId;
  final String clientName;
  final String amount;

  VendorTransaction(
      {this.pending, this.type, this.clientId, this.clientName, this.amount});
}

class Wallet{
  final String id;
  final String fullname;
  final String email;
  final String refId;
  final int balance;
  final List transactions;
  final String localCurrency;

  Wallet({this.balance, this.transactions, this.localCurrency, this.id, this.fullname, this.email, this.refId});

  Map<String, dynamic> toMap(){
    return {
      "fullname": fullname,
      "email": email,
      "refId": refId
    };
  }
}

class CardDetails{
  String name;
  String number;
  String expiryDate;
  String cvv;

  CardDetails({this.name, this.number, this.expiryDate, this.cvv});

  Map<String, dynamic> toMap(){
    return {
      "name": name,
      "number": number,
      "expiryDate": expiryDate,
      "cvv": cvv
    };
  }
}