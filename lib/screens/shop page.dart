import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providerstate/screens/cartscrteen.dart';
import 'package:providerstate/screens/thesmes.dart';
import 'package:toastification/toastification.dart';

import '../provider/shop provider.dart';

class shoppage extends StatelessWidget {
  const shoppage({super.key});


  @override
  Widget build(BuildContext context) {
    var _height=MediaQuery.of(context).size.height;
    var _width=MediaQuery.of(context).size.width;
    return  Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        actions: [
          GestureDetector(child: Icon(CupertinoIcons.cart,),
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => cartscreen(),));
          },),
          SizedBox(
            width: 10,
          )
        ],
        backgroundColor: Theme.of(context).colorScheme.inversePrimary.withOpacity(0.5),
        title: Text('Shop',style: TextStyle(
            color:Theme.of(context).colorScheme.primary,
            fontSize: 30,
            fontWeight: FontWeight.bold
        )),
        centerTitle: true,
      ),
      drawer:  drawer(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              SizedBox(height: (30/_height)*890,),
              Text('choose from a variety of Products',style: TextStyle(
                  color: Theme.of(context).colorScheme.inversePrimary
              ),),
              SizedBox(height: (60/_height)*890,),
              Consumer<data>(builder: (context, value, child) {
                return SizedBox(
                  height: (520/_height)*890,
                  child: PageView.builder(itemBuilder: (context, index) {
                    return iitemshow(name: value.names[index], price: value.prices[index], image: value.image[index], desc: value.descs[index],ontap: (){
                      if(value.cart.contains(index)){
                        toast().showmsg('Already Added', Colors.red);
                      }
                      else{
                        toast().showmsg('Item added', Colors.green);
                        value.cart.add(index);
                      }
                    },height_:_height ,width_: _width,);
                  },itemCount: value.Names.length,
                    scrollDirection: Axis.horizontal,
                  physics: BouncingScrollPhysics(),
                  controller: PageController(
                    viewportFraction: 0.8
                  ),),
                );
              },),



            ],
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 30),
            child: Text('Made With ❤️ by Ghayur',style: TextStyle(
                color: Theme.of(context).colorScheme.inversePrimary
            ),),
          ),

        ],
      ),
    );
  }
}
