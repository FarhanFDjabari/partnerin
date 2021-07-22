class CategoryModel {
  String imageUrl;
  String category;

  CategoryModel({required this.imageUrl, required this.category});
}

var categoryList = [
  CategoryModel(imageUrl: 'assets/images/fnb-category.png', category: 'F & B'),
  CategoryModel(
      imageUrl: 'assets/images/cosmetic-category.png', category: 'Kosmetik'),
  CategoryModel(
      imageUrl: 'assets/images/cargo-category.png', category: 'Ekspedisi'),
  CategoryModel(
      imageUrl: 'assets/images/boutique-category.png', category: 'Fashion'),
  CategoryModel(
      imageUrl: 'assets/images/agri-category.png', category: 'Agrikultur'),
  CategoryModel(
      imageUrl: 'assets/images/other-category.png', category: 'Lainnya'),
];
