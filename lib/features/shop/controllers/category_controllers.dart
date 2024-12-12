// import 'package:get/get.dart';
// import 'package:get_storage/get_storage.dart';
// import 'package:philately/common/widgets/loaders/loaders.dart';
// import 'package:philately/data/repositories/categories/category_repository.dart';
// import 'package:philately/features/shop/models/category_models.dart';
//
// class CategoryController extends GetxController{
//   static CategoryController get instance => Get.find();
//
//   final _categoryRepository = Get.put(CategoryRepository());
//   RxList<CategoryModel> allCategories = <CategoryModel>[].obs;
//   RxList<CategoryModel> featuredCategories = <CategoryModel>[].obs;
//   final isLoading = false.obs;
//
//   @override
//   void onInit(){
//     fetchCategories();
//     super.onInit();
//   }
//   /// Load Category data
//     Future<void> fetchCategories() async{
//     try{
//       // SHOW LOADER WHILE  loading categories
//       isLoading.value = true;
//       // Fetch Categories from data Source
//       final categories = await _categoryRepository.getAllCategories();
//
//       // Update the categories
//       allCategories.assignAll(categories);
//
//       // filter categories list
//       featuredCategories.assignAll(allCategories.where((categories) => categories.isFeatured && categories.parentId.isEmpty).take(8).toList());
//
//     } catch (e){
//       TLoaders.errorSnackBar(title: 'Oh snap',message: e.toString());
//     }
//     }
//   /// Load selected category data
//   /// get category or subcategory products
// }