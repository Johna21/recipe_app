import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_recipe/graphql/recipe_ql.dart';
import 'package:food_recipe/widgets/form_values.dart';
import 'package:food_recipe/widgets/ingredient_section.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:image_picker/image_picker.dart';

class RecipeForms extends StatefulWidget {
  const RecipeForms({Key? key,
    // required this.onSubmit
  }) : super(key: key);
  // final ValueChanged<Formvalues> onSubmit;

  @override
  _RecipeFormsState createState() => _RecipeFormsState();
}

class _RecipeFormsState extends State<RecipeForms> {

  final values = Formvalues();
  final Recipedata mutatevalue = Recipedata();
  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController imageurlController = TextEditingController();
  TextEditingController ingredController = TextEditingController();
   List<XFile>? _image;

  Future selectImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);

    setState(() {
      // _image = image;
    });
    if(image == null) return ;
  }


  @override
  Widget build(BuildContext context) {
    return Material(
          child: CupertinoPageScaffold(
              navigationBar: CupertinoNavigationBar(
                middle: Text('Add recipe '),
              ),

            child: Mutation(
              options: MutationOptions(document: gql(mutatevalue.mutationfile),
              fetchPolicy: FetchPolicy.networkOnly,
                onCompleted: (data)=>Navigator.pop(context,data !=null,),
                onError: (err){
                print(err!.graphqlErrors);

                },
                update: (GraphQLDataProxy cache, QueryResult? result){
                return cache;
                }

              ),
              builder: (
                  RunMutation insert,
                  QueryResult? result
                  ){
                return SingleChildScrollView(
                  child: Column(

                    children: [
                      SizedBox(height: 80,),
                      CupertinoTextField(
                        placeholder: 'Name',
                        padding: const EdgeInsets.all(18),
                        onChanged: (value){
                          values.name = value;

                        },
                        controller: nameController,
                      ),
                      SizedBox(height: 20,),
                      CupertinoTextField(
                        placeholder: 'Description',
                        padding: const EdgeInsets.all(18),
                        onChanged: (value){
                          values.description = value;
                        },
                        controller: descriptionController ,
                      ),
                      SizedBox(height: 20,),
                      CupertinoTextField(
                        placeholder: 'Image url',
                        padding: const EdgeInsets.all(18),
                        onChanged: (value){
                          values.image_url = value;
                        },
                        controller: imageurlController,
                      ),
                      SizedBox(height: 40,),
                      IngredientSection(
                        onupdate: (value){
                          values.inglist = value;
                        },
                      ),
                      CupertinoTextField(
                        placeholder: 'ingredient',
                        padding: const EdgeInsets.all(18),
                        onChanged: (value){
                          values.ingredient = value;
                        },
                        controller: ingredController,
                      ),
                      SizedBox(height: 40,),
                      CupertinoButton(
                        color: Colors.blue,
                          child: Text('Add Recipe'), onPressed: ( ){

                             insert({
                               'objects':[{
                                 'name': values.name,
                                 'description': values.description,
                                 'image_url': values.image_url,
                                  'ingredients':{
                                   'data':[
                                     {
                                       'name':values.ingredient,
                                       // ignore: equal_keys_in_map
                                       // 'name':values.inglist
                                     }
                                   ]
                                  }

                               }]


                             });



                      }),


                    ],
                  ),

                );

              },

            ),
          )
      //   ],
      // ),
    );
  }
}
