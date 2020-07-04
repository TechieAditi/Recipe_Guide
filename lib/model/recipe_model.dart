class RecipeModel{
  String label;
  String img;
  String src;
  String url;
  RecipeModel({this.label,this.img,this.src,this.url});
  factory RecipeModel.fromMap(Map<String,dynamic> parsedJson)
  {
    return  RecipeModel(
      url: parsedJson["url"],
      label: parsedJson["label"],
      img:parsedJson["image"],
      src: parsedJson["source"]
    );
  }

}