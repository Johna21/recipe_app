import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class NoRecipedetails extends StatelessWidget {

  final String title;
  final String rating;
  final String description;
  final String thumbnaiUrl;



  NoRecipedetails({Key? key,
    required this.title,
    required this.rating,
    required this.description,
    required this.thumbnaiUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return CupertinoPageScaffold(
      backgroundColor: Colors.transparent,
        child: Container(
          height: MediaQuery.of(context).size.height*.9,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(60),
              topRight: Radius.circular(60)
            ),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: CustomScrollView(

            slivers: [

              SliverList(

                  delegate: SliverChildListDelegate(
                    [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CupertinoButton(

                            onPressed: (){
                              Navigator.pop(context);
                            },
                            color: Colors.blue,
                            child: Text('Go Back'),
                          ),
                          SizedBox(height: 20,),
                          Text(title,
                          style: CupertinoTheme.of(context).
                          textTheme.navLargeTitleTextStyle,

                          ),
                          SizedBox(height: 20,),
                          Column(
                            children: [
                              Container(
                                width: double.infinity,
                                clipBehavior: Clip.antiAlias,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20)
                                ),
                                child:
                                    Image.network(thumbnaiUrl,
                                    fit: BoxFit.fitWidth,
                                    ),
                              ),
                              Stack(
                                  children: [
                                    Align(
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            padding: EdgeInsets.all(5),
                                            margin: EdgeInsets.all(10),
                                            decoration: BoxDecoration(
                                              color: Colors.black.withOpacity(0.4),
                                              borderRadius: BorderRadius.circular(15),
                                            ),
                                            child: Row(
                                              children: [
                                                Icon(
                                                  Icons.star,
                                                  color: Colors.yellow,
                                                  size: 18,
                                                ),
                                                SizedBox(width: 7,),
                                                Text(rating),
                                              ],
                                            ),
                                          ),


                                        ],
                                      ),
                                      alignment: Alignment.bottomLeft,
                                    )
                                  ],
                              )
                            ],
                          ),
                          SizedBox(height: 20,),
                          Text(
                            description,
                            style: TextStyle(
                              fontSize: 20
                            ),
                          ),
                          SizedBox(height: 20,),
                          Text('Ingredients',
                          style: CupertinoTheme.
                            of(context).textTheme
                            .navTitleTextStyle
                            .copyWith(
                            fontSize: 25
                          ),
                          ),
                          CircularProgressIndicator(),
                          // SizedBox(height: 20,),


                        ],
                      )
                    ]
                  )
              )
            ],
          ),
        ));
  }
}
