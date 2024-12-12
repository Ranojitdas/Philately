import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:philately/data/repositories/user/user_model.dart';
import 'package:philately/utils/exceptions/firebase_exceptions.dart';
import 'package:philately/utils/exceptions/format_exceptions.dart';

class UserRepository extends GetxController{
  static UserRepository get instance => Get.find();

  final FirebaseFirestore _db = FirebaseFirestore.instance;


  /// function to save data to firestore
  Future<void> saveUserRecord(UserModel user) async {
    try{
      await _db.collection("Users").doc(user.id).set(user.toJson());
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch(_) {
      throw const TFormatException();
    } on PlatformException catch(e){
      throw TPlatformException(e.code).message;
    } catch (e){
      throw 'Something Went wrong, please try again';
    }
  }
}