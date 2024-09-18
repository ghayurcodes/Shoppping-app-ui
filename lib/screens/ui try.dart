
import 'package:flutter/material.dart';
import 'package:providerstate/screens/shop%20page.dart';
import 'package:providerstate/screens/thesmes.dart';

class homeui extends StatelessWidget {
  const homeui({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.shopping_bag_rounded,size: 60,),
            SizedBox(
              height: 15,
            ),

            Text("Ghayur Shop",style: TextStyle(
              color:Theme.of(context).colorScheme.primary,
              fontSize: 30,
              fontWeight: FontWeight.bold
            ),),
            Text("Trust Matters",
            style: TextStyle(
               color: Theme.of(context).colorScheme.inversePrimary
            ),),
            SizedBox(
              height: 40,
            ),
            mybutton(child: Text('Shop Now'), ontap: (){
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => shoppage(),));
            }),
          ],


        ),
      ),
    );
  }
}
