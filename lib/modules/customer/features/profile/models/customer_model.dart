import 'package:cloud_firestore/cloud_firestore.dart';
import 'address_model.dart';

///Project Imports
import 'package:couriermanagementsystem/core/models/courier_model.dart';

class Customer {
  String uid;
  String name;
  String email;
  String phoneNumber;
  List<String> userAddresses = [];
  List<Address> fetchedAddress = [];
  List<Courier> fetchedCouriers = [];
  List<String> userCouriers = [];

  ///Constructur
  Customer({
    this.uid,
    this.name,
    this.email,
    this.phoneNumber,
    this.userAddresses = const [],
    this.userCouriers = const [],
  });

  Future<void> addAddr(Address _newAddr) async {
    String addrId = await _newAddr.addAddressToDatabase();
    this.userAddresses.add(addrId);
  }

  Future<void> removeAddr(int index) async {
    String id = this.userAddresses[index];
    this.userAddresses.remove(id);
    FirebaseFirestore _db = FirebaseFirestore.instance;
    await _db.collection("userAddresses").doc(id).delete();
    // return addr.id;
  }

  factory Customer.fromJson(DocumentSnapshot _snapshot) {
    Map<String, dynamic> parsedJson = _snapshot.data();
    var userAddressesFromJson = parsedJson['userAddresses'] as List;
    var userCouriersFromJson = parsedJson['userCouriers'] as List;
    List<String> userAddresses = userAddressesFromJson != null
        ? userAddressesFromJson.map((address) => address.toString()).toList()
        : [];
    List<String> userCouriers = userCouriersFromJson != null
        ? userCouriersFromJson.map((cur) => cur.toString()).toList()
        : [];
    return Customer(
      uid: _snapshot.id,
      name: parsedJson["name"],
      email: parsedJson["email"],
      phoneNumber: parsedJson["phoneNumber"],
      userAddresses: userAddresses,
      userCouriers: userCouriers,
    );
  }
  Future<void> fetchAddressses() async {
    FirebaseFirestore _db = FirebaseFirestore.instance;
    this.userAddresses.forEach((id) async {
      await _db.collection("userAddresses").doc(id).get().then((value) {
        this
            .fetchedAddress
            .add(Address.fromJson(parsedJson: value.data(), id: value.id));
      });
    });
    print("addresses fetched");
  }

  Future<void> fetchCouriers() async {
    FirebaseFirestore _db = FirebaseFirestore.instance;
    this.userCouriers.forEach((id) async {
      await _db.collection("couriers").doc(id).get().then((value) {
        this.fetchedCouriers.add(Courier.fromJson(value));
      });
    });
    print("couriers fetched");
  }

  Map<String, dynamic> toJson() {
    var userAddressesToJson = userAddresses != null
        ? userAddresses //.map((address) => address.toJson()).toList()
        : [];
    var userCouriersToJson = userCouriers != null
        ? userCouriers //.map((address) => address.toJson()).toList()
        : [];
    return {
      "name": name,
      "email": email,
      "phoneNumber": phoneNumber,
      "userAddresses": userAddressesToJson,
      "userCouriers": userCouriersToJson,
    };
  }
}
