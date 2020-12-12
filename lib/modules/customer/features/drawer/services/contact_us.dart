//Contact us
import 'package:url_launcher/url_launcher.dart';

contactUs() async {
  // Android and iOS
  const url =
      'mailto:b180001@nitsikkim.ac.in?subject=Feedback%20for%20CourierWay&body=Hello%20Adarsh,%0D%0A';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    // throw 'Could not launch $url';
    print("Error while launching mail app");
  }
}
