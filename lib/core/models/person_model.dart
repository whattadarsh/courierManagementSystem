abstract class Customer {
  String name;
  String email;
  String phoneNumber;
  //TODO: Extend this 
  void setFields({String name, String email, String phoneNumber}) {
    this.name = name;
    this.email = email;
    this.phoneNumber = phoneNumber;
  }
}
