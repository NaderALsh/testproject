class ProductData{
  int? id;
  String? title;
  dynamic price;
  String? description;
  String? category;
  String? image;
  Map? rating;
  
    ProductData(
      {this.id,
      this.title,
      required this.price,
      this.description,
      this.category,
      this.image,
      this.rating
      });

}
