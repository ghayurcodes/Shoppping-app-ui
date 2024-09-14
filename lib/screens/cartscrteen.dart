import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:input_quantity/input_quantity.dart';
import 'package:providerstate/screens/thesmes.dart';

import '../provider/shop provider.dart';

class cartscreen extends StatefulWidget {
  const cartscreen({super.key});

  @override
  State<cartscreen> createState() => _cartscreenState();
}

class _cartscreenState extends State<cartscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      drawer:drawer(),
      appBar: AppBar(
        actions: [
          Icon(CupertinoIcons.cart,),
          SizedBox(
            width: 10,
          )
        ],
        backgroundColor: Theme.of(context).colorScheme.inversePrimary.withOpacity(0.5),
        title: Text('Cart',style: TextStyle(
            color:Theme.of(context).colorScheme.primary,
            fontSize: 30,
            fontWeight: FontWeight.bold
        )),
        centerTitle: true,

      ),
      body:Consumer<data>(builder: (context, value, child) {
        return value.cart.isEmpty?Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Empty cart please add items!',style: TextStyle(fontWeight: FontWeight.w200,fontSize: 30,color:  Theme.of(context).colorScheme.primary,)),
            Text('🙈',style: TextStyle(
              fontSize: 40
            ),)
          ],
        ),
        ) :Column(
          children: [
            Expanded(
              child: ListView.builder(itemBuilder: (context, index) {
                return value.cart.contains(index)?Container(
                  width: MediaQuery.of(context).size.width*0.9,
                  height: MediaQuery.of(context).size.height*0.1,
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.secondary,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                            spreadRadius: 1,
                            blurRadius: 10,
                            color: Colors.black.withOpacity(0.2)
                        )
                      ]
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(children: [
                        Container(child: Image(image:AssetImage(value.image[index])),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.grey.withOpacity(0.5)
                          ),
                          margin: EdgeInsets.all(7),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(value.names[index],style: TextStyle(fontWeight: FontWeight.w600,fontSize: 33,color: Theme.of(context).colorScheme.inversePrimary,)),
                            Text('\$'+value.prices[index].toString(),style: TextStyle(fontWeight: FontWeight.w400,fontSize: 14,color:  Theme.of(context).colorScheme.primary,))

                          ],
                        )
                      ],),
                      Row(
                        children: [
                          SizedBox(
                            width: 75,
                            child: InputQty(
                              maxVal: 99,
                              initVal: 0,
                              minVal: 0,
                              steps: 1,
                              onQtyChanged: (val) {
                                print(val);
                              },
                                decoration: QtyDecorationProps(
                                    qtyStyle: QtyStyle.classic,
                                  isBordered: false,
                                  borderShape: BorderShapeBtn.circle,


                                ),

                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: GestureDetector(
                              child: Container(child: Icon(Icons.remove,size: 30,),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.grey.withOpacity(0.5)
                                ),
                                margin: EdgeInsets.all(7),
                              ),
                              onTap: (){
                                value.remove(index);
                              },
                            ),
                          ),
                        ],
                      ),


                    ],
                  ),

                ):Container();
              },itemCount: value.Names.length,),
            ),
            Container(
              width: 250,
              height: 80,
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.inversePrimary.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: [
                    BoxShadow(
                        spreadRadius: 0,
                        blurRadius: 10,
                        color: Colors.black.withOpacity(0.2)
                    )
                  ]
              ),
              child: Center(child: Text('Checkout!',style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 35,
                  color: Theme.of(context).colorScheme.inversePrimary
              ),)),
            ),
            SizedBox(
              height: 40,
            )
          ],
        );
      },)

    );
  }
}
