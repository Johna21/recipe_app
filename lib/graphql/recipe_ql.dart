import 'package:flutter/material.dart';
class Recipedata extends StatelessWidget {
  // static var where;

   Recipedata({Key? key}) : super(key: key);

  final String graphdata =  r'''
    query fetchRecipList{
  recipe(order_by:{created_at:desc_nulls_last}){
    id
    name
    description
    image_url
    __typename
    ingredients{
    name
    }
     
  }
}
''';
   final String commentdata =  r'''
    query{
   comment{
   comment
}
}
''';




  final String ingredientList = r'''
  query ingredientList{
  ingredient(order_by:{recipe:{created_at:desc}}){
    
    
    name
  }
}
  ''';






  final String fetchingredients = r"""
   query fetchIngredietn($where:ingredient_bool_exp) {
  ingredient(where: $where) {
    
    name
    
  }
}
 """;

   final String mutationfile = r'''
   mutation($objects:[recipe_insert_input!]! ){
  insert_recipe(objects:$objects){
    returning{
      id
      name
      description
      image_url
      ingredients{
        name
        recipe_id
        id
      }
    }
  }
}
  ''';

   final String userInsert = r'''
    mutation($objects:[user_insert_input!]!){
  insert_user(objects:$objects){
		returning{
      user_name
      email
      
    }
  }
   ''';
   final String commentmutation = r'''
   mutation($user_name: String, $comment: bpchar){
   insert_user(objects:{

   user_name:$user_name,
   comments:{
   data:{
   comment: $comment
   }
   }
   }){
   returning{
   comments{
   user_id
   comment
   }
   }
   }

   }
  ''';



   final String subscriptiondata =  r'''
    subscription subscriptiondata{
  recipe(order_by:{created_at:desc_nulls_last}){
    id
    name
    description
    image_url
    __typename
     ingredients{
     id
      name
    }
  }
}
''';

   final
   String commsub =  r'''
    subscription{
comment{
comment
}
}
''';


  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

// class Ingfetch{
//    String ingredientList = '''
//   query ingredientList($id: Int){
//   ingredient(order_by:{recipe:{created_at:desc}}, where:{recipe_id:{_eq:$id}}){
//
//
//     name
//   }
// }
//   ''';
// }