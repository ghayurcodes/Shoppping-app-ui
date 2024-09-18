import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providerstate/screens/thesmes.dart';

import '../provider/shop provider.dart';
import 'cartscrteen.dart';

class wishlist extends StatefulWidget {
  const wishlist({super.key});

  @override
  State<wishlist> createState() => _wishlistState();
}

class _wishlistState extends State<wishlist> {

  @override
  Widget build(BuildContext context) {
    final cartprovider=Provider.of<data>(context,listen:false);
    return Scaffold(
      backgroundColor: Theme
          .of(context)
          .colorScheme
          .surface,
      appBar: AppBar(
        actions: [
          GestureDetector(
            child: Icon(CupertinoIcons.cart),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => cartscreen(),
                ),
              );
            },
          ),
          SizedBox(width: 10),
        ],
        backgroundColor:
        Theme
            .of(context)
            .colorScheme
            .inversePrimary
            .withOpacity(0.5),
        title: Text(
          'Wishlist',
          style: TextStyle(
            color: Theme
                .of(context)
                .colorScheme
                .primary,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      drawer: drawer(),
      body:cartprovider.wishlist.isEmpty? Center(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height:  MediaQuery.of(context).size.height*0.15,
          padding: EdgeInsets.all(10),
          child: FittedBox(
            fit: BoxFit.contain,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Wishlist is Empty!',style: TextStyle(fontWeight: FontWeight.w200,fontSize: 30,color:  Theme.of(context).colorScheme.primary,)),
                Text('🙈',style: TextStyle(
                  fontSize: 30
                ),)
              ],
            )
          ),
        ),
      ):Column(
    children: [
    Expanded(
      flex:7 ,
    child: Consumer<data>(builder: (context, value, child) {
      return ListView.builder(itemBuilder: (context, index) {
        return value.wishlist.contains(index)?Container(
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
                    value.remove_wish(index);
                  },
                ),
              ),


            ],
          ),

        ):Container();
      },itemCount: value.Names.length,);
    },),
    ),
    Padding(
      padding: const EdgeInsets.only(bottom: 40),
      child: GestureDetector(
        onTap: () {
          cartprovider.reset_wish();
          checkout(context,"All cleared😄");
          setState(() {

          });
        },
        child: Container(
          width: 250,
          height: 80,
          decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.inversePrimary.withOpacity(0.2),
              borderRadius: BorderRadius.circular(25),
              boxShadow: [
                BoxShadow(
                    spreadRadius: 3,
                    blurRadius: 10,
                    color: Colors.black.withOpacity(0.2)
                )
              ]
          ),
          child: Center(child: Text('Remove all!',style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 35,
              color: Theme.of(context).colorScheme.inversePrimary
          ),)),
        ),
      ),
    )
    ],
    ),
    );
  }
}



