
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:philately/features/shop/models/category_models.dart';
import 'package:philately/utils/exceptions/firebase_exceptions.dart';
import 'package:philately/utils/exceptions/format_exceptions.dart';

class CategoryRepository extends GetxController {
  static CategoryRepository get instance => Get.find();


  ///Variables
  final _db = FirebaseFirestore.instance;

  /// Get all categories
  Future<List<CategoryModel>> getAllCategories() async{
    try{
      final snapshot = await _db.collection('Categories').get();
      final list = snapshot.docs.map((document) => CategoryModel.fromSnapshot(document)).toList();
      return list;
    }on TFirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong please try again';
    }
  }
}