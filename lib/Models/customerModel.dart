class Customer {
  String? uid;
  String? username;
  String? orders;
  String? points;
  String? wallet;
  String? payments;
  // customer pic or boss pic
  List? favorites;
  String? timestamp;

  Customer(
      {required this.uid,
      required this.username,
      required this.orders,
      required this.points,
      required this.wallet,
      required this.payments,
      required this.favorites,
      required this.timestamp});
}

class Order {
  String? oid;
  List? items;
  String? branchId;
  String? trip;
  String? deliveryTime;
  String? riderId;
  double? total;
  double? ratings;
  String? feedback;
  String? status;
  String? type;
  String? payment;
  String? timestamp;
}

// type { delivery , self pick up} if self pick up -deliveryTime,tip,riderId, = '';
// trip {name : 'Ayeduase - Ejisu, location : [000,000, 020901290]};

// order List sample
// {
//   {fid : }
// }