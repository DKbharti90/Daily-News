import 'package:news_app/model/category_model.dart';

List<CategoryModel> getCategoryModel(){
  List<CategoryModel> category=new List<CategoryModel>();


  CategoryModel categoryModel=new CategoryModel();
  categoryModel.imageUrl="https://blog.hubspot.com/hubfs/small-business-ideas.jpg";
  categoryModel.categoryName="Business";
  category.add(categoryModel);


  categoryModel=new CategoryModel();
  categoryModel.imageUrl="https://blog.hubspot.com/hubfs/small-business-ideas.jpg";
  categoryModel.categoryName="Business";
  category.add(categoryModel);


  categoryModel=new CategoryModel();
  categoryModel.imageUrl="https://blog.hubspot.com/hubfs/small-business-ideas.jpg";
  categoryModel.categoryName="Business";
  category.add(categoryModel);


  categoryModel=new CategoryModel();
  categoryModel.imageUrl="https://blog.hubspot.com/hubfs/small-business-ideas.jpg";
  categoryModel.categoryName="Business";
  category.add(categoryModel);

  return category;

}