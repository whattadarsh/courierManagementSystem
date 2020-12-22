import 'package:flutter/foundation.dart';

class AddAddress extends ChangeNotifier {
  bool showAddAddress = true;
  void toggleaddAddressButton() {
    this.showAddAddress = !this.showAddAddress;
    notifyListeners();
  }
}
