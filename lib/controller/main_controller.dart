import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../utils/utils.dart';
import 'auth_controller.dart';

class MainController extends GetxController {
  var firestore;
  static MainController get to => Get.find();

  //creating variable collections
  var expenses = <String, dynamic>{}.obs;
  var income = <String, dynamic>{}.obs;

  //variable to select an id
  var expensesSelectedId = "".obs;
  var incomeSelectedId = "".obs;

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();

    firestore = FirebaseFirestore.instance;
  }

 
}
