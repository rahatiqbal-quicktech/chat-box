import 'package:get/get.dart';

class SignUpController extends GetxController {
  String phoneNumber = "";
  savePhoneNumber(String phone) {
    phoneNumber = phone;
    print(phoneNumber);
  }
}
