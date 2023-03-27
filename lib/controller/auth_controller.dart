import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:pesa_app/screens/openScreen.dart';
import 'package:pesa_app/screens/welcome.dart';

import '../utils/utils.dart';

class AuthController extends GetxController {
  static AuthController get to => Get.find();
  late Rx<User?> firebaseUser;
//holds extra user data
  var firebaseUserData = {}.obs;
//from Utils
  var auth;
  var firestore;

  late CollectionReference users;

  //creating variable collections
  var expenses = <String, dynamic>{}.obs;
  var income = <String, dynamic>{}.obs;

  //variable to select an id
  var expenseSelectedId = "".obs;
  var incomeSelectedId = "".obs;

  @override
  void onReady() {
    super.onReady();
    auth = FirebaseAuth.instance;
    firestore = FirebaseFirestore.instance;
    // initialize user
    users = firestore.collection('users');
    firebaseUser = Rx<User?>(auth.currentUser);
    firebaseUserData.value = {};
    //track user data changes
    firebaseUser.bindStream(auth.userChanges());
    //If user changes to null, send user to login screen
    ever(firebaseUser, _setInitialScreen);
  }

  _setInitialScreen(User? user) async {
    if (true) {
      if (user == null) {
        // if the user is not found then the user is navigated to the Register Screen
        Get.offAll(() => const openScreen());
      } else {
        // if the user exists and logged in the the user is navigated to the Dashboard Screen
        Utils.showLoading(message: "Fetching Profile...");
        var fsUser = await users.doc(user.uid).get();
        firebaseUserData.value.addAll(
            fsUser.data() == null ? {} : fsUser.data() as Map<String, dynamic>);
        update();
        Get.offAll(() => welcome());
        Utils.dismissLoader();

        expenses.bindStream(expenseStream());
        income.bindStream(incomeStream());
      }
    }
  }

  Future<bool> register(
      String firstName,
      String lastName,
      String email,
      String phone,
      String? totalIncome,
      String? totalExpenses,
      String password) async {
    Utils.showLoading(message: "Creating account…");
    try {
      await (auth as FirebaseAuth)
          .createUserWithEmailAndPassword(email: email, password: password);
      var user = auth.currentUser;
      if (user != null) {
        await (user as User).updateDisplayName(lastName);
        var fsUser = await users.doc(user.uid).get();

        if (!fsUser.exists) {
          await users.doc(user.uid).set({
            "firstName": "$firstName",
            "lastName": "$lastName",
            "email": "$email",
            "phone": "$phone",
            "income": "$totalIncome",
            "expense": "$totalExpenses"
          });
        }
        Utils.showSuccess("Signup Successful!");
        Utils.dismissLoader();

        return true;
      } else {
        Utils.showError("Signup Failed!");
        Utils.dismissLoader();

        return false;
      }
    } catch (firebaseAuthException) {
      print((firebaseAuthException as FirebaseAuthException).message);
      Utils.showError("Signup Failed!");
      Utils.dismissLoader();
      return false;
    }
  }

  Future<bool> login(String email, password) async {
    Utils.showLoading(message: "Authenticating…");

    try {
      await (auth as FirebaseAuth)
          .signInWithEmailAndPassword(email: email, password: password);
      var user = auth.currentUser;

      if (user != null) {
        Utils.showSuccess("Login Successful!");
        Utils.dismissLoader();
        return true;
      }
    } catch (firebaseAuthException) {
      print((firebaseAuthException as FirebaseAuthException).message);

      Utils.showError("Login  Failed!");
      Utils.dismissLoader();
      return false;
    }
    Utils.dismissLoader();
    return false;
  }

  Future signOut() async {
    Utils.showLoading(message: "Signing out…");

    await auth.signOut();
    Utils.dismissLoader();
  }

  //creating expenses
  createExpenses(
      expenseName, expenseAmount, expenseCategory, User? user) async {
    Utils.showLoading(message: "Adding an expense");
    var userId = AuthController.to.firebaseUser.value?.uid;
    try {
      await users.doc(user!.uid).collection('Expense').add({
        "userId": userId,
        "expenseName": expenseName,
        "expenseAmount": expenseAmount,
        "expenseCategory": expenseCategory,
        'created': DateTime.now().millisecondsSinceEpoch
      });
      Utils.showSuccess("success");
    } catch (e) {
      Utils.showError('failed to add. try again');
    }
    Utils.dismissLoader();
  }

  //creating inome
  createIncome(incomeName, incomeAmount, incomeSource, User? user) async {
    Utils.showLoading(message: "Adding income");
    var userId = AuthController.to.firebaseUser.value?.uid;
    try {
      await users.doc(user!.uid).collection('Income').add({
        "userId": userId,
        "incomeName": incomeName,
        "incomeAmount": incomeAmount,
        "incomeSource": incomeSource,
        'created': DateTime.now().millisecondsSinceEpoch
      });
      Utils.showSuccess("success");
    } catch (e) {
      Utils.showError('failed to add. try again');
    }
    Utils.dismissLoader();
  }

  //edit expenses
  editExpenses(expenseName, expenseAmount, expenseCategory, User? user) async {
    Utils.showLoading(message: "Editing  expense");
    var userId = AuthController.to.firebaseUser.value?.uid;

    try {
      // var snapshot = user
      await users
          .doc(user!.uid)
          .collection('Expense')
          .doc(expenseSelectedId.value)
          .update({
        "userId": userId,
        "expenseName": expenseName,
        "expenseAmount": expenseAmount,
        "expenseCategory": expenseCategory,
      });
      Utils.showSuccess("success");
    } catch (e) {
      Utils.showError('failed to add. try again');
    }
    Utils.dismissLoader();
  }

  //editing inome
  editIncome(incomeName, incomeAmount, incomeSource, User? user) async {
    Utils.showLoading(message: "Editing income");
    var userId = AuthController.to.firebaseUser.value?.uid;
    try {
      await users
          .doc(user!.uid)
          .collection('Income')
          .doc(incomeSelectedId.value)
          .update({
        "userId": userId,
        "incomeName": incomeName,
        "incomeAmount": incomeAmount,
        "incomeSource": incomeSource,
      });
      Utils.showSuccess("success");
    } catch (e) {
      Utils.showError('failed to add. try again');
    }
    Utils.dismissLoader();
  }

  deleteExpense(id) async {
    Utils.showLoading(message: "Deleting Expense");
    var userId = AuthController.to.firebaseUser.value?.uid;
    try {
      await users.doc(userId!).collection('Expense').doc(id).delete();

      Utils.showSuccess("success");
    } catch (e) {
      Utils.showError('failed to delete. try again');
    }
    Utils.dismissLoader();
  }

  deleteIncome(id) async {
    Utils.showLoading(message: "Deleting Income");
    var userId = AuthController.to.firebaseUser.value?.uid;
    try {
      await users.doc(userId!).collection('Income').doc(id).delete();

      Utils.showSuccess("success");
    } catch (e) {
      Utils.showError('failed to delete. try again');
    }
    Utils.dismissLoader();
  }

  selectExpense(id) {
    expenseSelectedId.value = id;
  }

  selectIncome(id) {
    incomeSelectedId.value = id;
  }

  // Fetch livestream
  Stream<Map<String, dynamic>> expenseStream() {
    var ref = FirebaseFirestore.instance
        .collection('Expense')
        .where('userId', isEqualTo: AuthController.to.auth.currentUser.uid)
        .orderBy('created')
        .snapshots();
    var data = <String, dynamic>{};
    return ref.map((list) {
      return {for (var element in list.docs) element.id: element.data()};
    });
  }

  // Fetch livestream
  Stream<Map<String, dynamic>> incomeStream() {
    var ref = FirebaseFirestore.instance
        .collection('Income')
        .where('userId', isEqualTo: AuthController.to.auth.currentUser.uid)
        .orderBy('created')
        .snapshots();
    var data = <String, dynamic>{};
    return ref.map((list) {
      return {for (var element in list.docs) element.id: element.data()};
    });
  }
}
