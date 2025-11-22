import '../../../../../../core/utils/app_assets.dart';

class CategoryModel {
  final String icon;
  final String title;

  CategoryModel({required this.title, required this.icon});

  static List<CategoryModel> categories = [
    CategoryModel(title: "Programming", icon: AppAssets.softWareIcon),
    CategoryModel(title: "Hardware", icon: AppAssets.hardWareIcon),
    CategoryModel(
      title: "Mechanical Design",
      icon: AppAssets.mechanicalDesignIcone,
    ),
    CategoryModel(title: "3D Design", icon: AppAssets.categoryOtherIcon),
    CategoryModel(title: "Graphic Design", icon: AppAssets.categoryOtherIcon),
    CategoryModel(title: "Others", icon: AppAssets.categoryOtherIcon),
  ];
}
