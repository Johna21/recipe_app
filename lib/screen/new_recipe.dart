import 'package:flutter/cupertino.dart';
import 'package:food_recipe/widgets/form_values.dart';
import 'package:food_recipe/widgets/recipe_forms.dart';


class NewRecipe extends StatelessWidget {
  const NewRecipe({Key? key}) : super(key: key);

  void _addRecipe(BuildContext context, Formvalues values){}

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Add recipe '),
      ),
        child: CustomScrollView(
          slivers: [
            SliverSafeArea(
                sliver: SliverList(
                    delegate: SliverChildListDelegate(
                      [
                        RecipeForms(),
                      ]
                    )))
          ],
        ),
    );
  }
}
