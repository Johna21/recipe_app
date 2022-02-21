import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class IngredientSection extends StatefulWidget {
  IngredientSection({Key? key, required this.onupdate}) : super(key: key);
  final ValueChanged<List<Map<String,String>>> onupdate;
  final Uuid uuid = Uuid();
  @override
  _IngredientSectionState createState() => _IngredientSectionState();
}

class _IngredientSectionState extends State<IngredientSection> {


  // final fields =[];

  final List<Map<String,String>> fields =[];
  void _addFields(){
    fields.add({widget.uuid.v1(): ''});
    setState(() {

    });
  }
  void _updateField(String value, int index){
    final key = fields[index].keys.first;
    fields[index][key]=value;
    widget.onupdate(fields);
  }
  void _removeField(int index){
    widget.onupdate(fields);
    fields.removeAt(index);
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Add Ingredients',
        style: CupertinoTheme.of(context).textTheme.navTitleTextStyle,
        ),
        SizedBox(height: 15,),
        for(var i = 0; i<fields.length;i++)
        Row(
          key: ValueKey(fields[i].keys.first),
          children: [
            Expanded(
              child: CupertinoTextField(
                padding: EdgeInsets.all(18),
                onChanged: (value){
                  _updateField(value, i);
                },
              ),
            
            ),
            CupertinoButton(
                child: Icon(CupertinoIcons.minus_circle), 
                onPressed: (){
                  _removeField(i);
                })
          ],
        ),
        CupertinoButton(
            child: Text('+ Add field'),
            onPressed: (){
                    _addFields();
            })
      ],
    );
  }
}
