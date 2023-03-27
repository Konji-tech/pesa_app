import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../utils/utils.dart';
import 'auth_controller.dart';

class MainController extends GetxController {
  var firestore;
  static MainController get to => Get.find();

 

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();

    firestore = FirebaseFirestore.instance;
  }

 
}
