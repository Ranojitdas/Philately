
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:philately/features/shop/models/category_models.dart';

class CategoryModel {
  String id;
  String name;
  String image;
  String parentId;
  bool isFeatured;

  CategoryModel({
    required this.id,
    required this.name,
    required this.image,
    required this.isFeatured,
    this.parentId = '',
});

  /// Empty Helper Function
  static CategoryModel empty() => CategoryModel(id: '', name: '', image: '', isFeatured: false);

  /// Convert model to Json structure so that we can store data in Firebase
Map<String, dynamic> toJson(){
  return{
    'Name' : name,
    'Image' : image,
    'ParentId' : parentId,
    'IsFeatured': isFeatured,
  };
}

/// Map JSON oriented document snapshot from firebase to UserModel
factory CategoryModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document){
  if(document.data() != null){
    final data = document.data()!;

    //map json record to the model
    return CategoryModel(
        id: document.id,
        name: data['Name'] ?? '',
        image: data['Image'] ?? '',
        isFeatured: data['IsFeatured'] ?? '',
        parentId : data['ParentId'] ?? false,
    );
  } else {
    return CategoryModel.empty();
  }
}








}