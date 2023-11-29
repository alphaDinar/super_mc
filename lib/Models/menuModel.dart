class Store {
  String? rid;
  String? name;
  String? logo;
  String? theme;

  String? timestamp;

  Store({
    required this.rid,
    required this.name,
    required this.logo,
    required this.theme,
    required this.timestamp,
  });

  static List<Store> storeList() {
    return [
      Store(
          rid: '01', name: 'super_mc', logo: 'images/logo.png', theme: 'redAccent' ,timestamp: '1')
    ];
  }
}

class Branch {
  String? bid;
  String? name;
  String? store;
  String? location;
  String? timestamp;
}

class Food {
  String? fid;
  String? name;
  String? category;
  String? img;
  String? price;
  List? exceptions;
  String? etras;
  String? ingredients;
  String? timestamp;

  Food(
      {required this.fid,
      required this.name,
      required this.price,
      required this.exceptions,
      required this.etras,
      required this.ingredients,
      required this.timestamp});
}
// food extras [ {name : extra_cheese, price : 20} ]
// ingredients [tomato, pork, pepperoni]

class Offer {
  String? fid;
  String? name;
  String? img;
  String? fullPrice;
  String? discount;
  String? price;
  List? exceptions;
  String? etras;
  String? ingredients;
  String? endsAt;
  String? timestamp;

  Offer(
      {required this.fid,
      required this.name,
      required this.price,
      required this.exceptions,
      required this.etras,
      required this.ingredients,
      required this.timestamp});
}

// Offer extras [ {name : extra_cheese, price : 20} ]
// ingredients [tomato, pork, pepperoni]