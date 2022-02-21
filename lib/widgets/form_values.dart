import 'dart:convert';

// Formvalues formvaluesFromJson(String str) => Formvalues.fromJson(json.decode(str));
// String formvaluesToJson(Formvalues data) => json.encode(data.toJson());

class Formvalues {
  Formvalues( {
    this.name,
    this.ingredient,
    this.image_url,
    this.description
});

  String? name;
  String? description;
  String? image_url;
  String? ingredient;

  List<Map<String,String>>? inglist;
  //
  // factory Formvalues.fromJson(Map<String,dynamic>json) =>Formvalues(
  //     name:json["name"],
  //   description: json["description"],
  //   image_url: json["image_url"],
  //   ingredient:json["ingredient"],
  //     );
  // Map<String,dynamic>toJson()=>{
  //  "name":name,
  //   "description":description,
  //   "image_url":image_url,
  //   "ingredient":ingredient
  // };

  // @override
  // String toString() => '$name, $description, $image_url, $ingredient $inglist';

}
class CommentForm{
CommentForm({
  this.comment,
  this.user

});

  String? comment;
  String? user;
}