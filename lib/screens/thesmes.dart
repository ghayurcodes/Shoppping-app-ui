
import 'dart:ui';

import 'package:animate_to/animate_to.dart';
import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:providerstate/screens/shop%20page.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:providerstate/screens/wishlist.dart';
import 'package:toastification/toastification.dart';
import 'cartscrteen.dart';

ThemeData light_mode=ThemeData(colorScheme:ColorScheme.light(
  primary: Colors.grey.shade900,
  secondary: Colors.white,
    surface: Colors.grey.shade300,
  inversePrimary: Colors.grey.shade700
)
);



class mybutton extends StatelessWidget {
  final Widget child;
  final ontap;
  const mybutton({super.key,required this.child,required this.ontap});

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: ontap,
      child: Container(
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white60
        ),
        child: child,
      ),
    );
  }
}


class drawertile extends StatelessWidget {
  final icon;
  final text;
  final ontap;
  const drawertile({super.key, this.icon, this.text, this.ontap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        padding: EdgeInsets.only(left: 50,),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Icon(icon,color: Theme.of(context).colorScheme.primary,),
            SizedBox(
              width: 15,
            ),
            Text(text,style: TextStyle(fontWeight: FontWeight.w200,fontSize: 30,color:  Theme.of(context).colorScheme.primary,),),

          ],
        ),

      ),
    );
  }
}


class iitemshow extends StatefulWidget {
  final name;
  final desc;
  final price;
  final image;
  final ontap;
  final height_;
  final width_;
  final onheart;
  bool wishlisted;

   iitemshow({super.key,
    required this.name,
    required this.price,
    required this.image,
    required this.desc,
    required this.ontap,
    required this .height_,
    required  this.width_,
    required this.onheart,
    required this.wishlisted,
  });

  @override
  State<iitemshow> createState() => _iitemshowState();
}

class _iitemshowState extends State<iitemshow> {
  @override
  Widget build(BuildContext context) {
    var _animateToController;
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        padding: EdgeInsets.all(20),
        decoration:BoxDecoration(
            image:  DecorationImage(
              image: AssetImage('assets/images/bg.jpg'),
              fit: BoxFit.cover,
              invertColors: true

            ),
           boxShadow: [
             BoxShadow(
                color: Colors.black.withOpacity(0.8),
               spreadRadius: 1,
               blurRadius: 8,

             )
           ],
          borderRadius: BorderRadius.circular(20)
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
        flex: 2,
              child: BlurryContainer(
                elevation: 3,
                  color: Colors.white.withOpacity(0.3),
                  child: Container(child: Image.asset(widget.image,),

               ),
              padding: EdgeInsets.all(25),
                 borderRadius: BorderRadius.circular(15)
              ),
            ),
            Expanded(
              child: FittedBox(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 0.01*widget.height_,),
                    Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.6),
                          borderRadius: BorderRadius.circular(10)
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(widget.name,style: TextStyle(
                              color: Colors.black,
                              fontSize: 30,
                              fontWeight: FontWeight.bold
                          ),),
                          SizedBox(height: (10/widget.height_)*widget.height_,),
                          Text(widget.desc,style: TextStyle(
                              color: Colors.black.withOpacity(1),
                              fontSize: 15,
                              fontWeight: FontWeight.normal
                          ),),
                        ],
                      ),
                    ),
                    SizedBox(height: (20/widget.height_)*widget.height_,),
                    SizedBox(
                      width:(263/widget.width_)*widget.width_,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: EdgeInsets.all(2),
                            decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.7),
                                borderRadius: BorderRadius.circular(10)
                            ),
                            child: Text('\$${widget.price.toString()} ',style: TextStyle(
                                color: Colors.black,
                                fontSize: 25,
                                fontWeight: FontWeight.bold
                            ),),
                          ),
                          Row(
                            children: [
                              widget.wishlisted? mybutton(child: Icon(CupertinoIcons.heart_fill,color: Colors.red,), ontap:widget.onheart): mybutton(child: Icon(CupertinoIcons.heart), ontap:widget.onheart),

                              SizedBox(width: 8,),
                              mybutton(child: Icon(Icons.add), ontap: widget.ontap),



                            ],
                          )

                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
            


          ],
        ),

      ),
    );
  }
}

class drawer extends StatelessWidget {
  const drawer({super.key});

  @override
  Widget build(BuildContext context) {
    return  Drawer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              DrawerHeader(child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(CupertinoIcons.bag,size: 50,),
                  Text("Trust Matters",
                    style: TextStyle(
                        color: Colors.grey.shade700,
                    ),),
                ],
              ),),
              SizedBox(
                height: 35,
              ),
              drawertile(icon: CupertinoIcons.home,text:'Home', ontap: (){
                Navigator.pop(context);
                Navigator.pushReplacement(context, MaterialPageRoute(builder:(context) => shoppage(),));
              },),
              SizedBox(
                height: 20,
              ),
              drawertile(icon: CupertinoIcons.heart,text:'Wishlist', ontap: (){
                Navigator.pop(context);
                Navigator.pushReplacement(context, MaterialPageRoute(builder:(context) => wishlist(),));
              },),
              SizedBox(
                height: 20,
              ),
              drawertile(icon: CupertinoIcons.cart,text:'Cart', ontap: (){
                Navigator.pop(context);
                Navigator.pushReplacement(context, MaterialPageRoute(builder:(context) => cartscreen(),));
              },),

            ],
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 40),
            child: drawertile(icon: CupertinoIcons.delete,text:'Exit', ontap: (){
              SystemNavigator.pop();
              print('exit..');
            },),
          ),









        ],
      ),
    );
  }
}


class toast{

  ToastificationItem showmsg(String msg, Color c){
    return  toastification.show(
      title: Text(msg,style: TextStyle(fontSize: 18),),
      autoCloseDuration: const Duration(milliseconds: 1500),
      borderRadius: BorderRadius.circular(25),
      showProgressBar: false,
      showIcon: false,
      style: ToastificationStyle.minimal,
      alignment: Alignment.topCenter,
      primaryColor: c,
      boxShadow: const [
        BoxShadow(
          color: Color(0x07000000),
          blurRadius: 16,
          offset: Offset(0, 16),
          spreadRadius: 0,
        )
      ],
    );
  }

}


 checkout(context,msg){
  return showDialog(context: context, builder: (context) {
    return AlertDialog(content: Container(
      width:MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height*0.1,
      child: Center(
        child: Text(msg,style:TextStyle(
          fontSize: 25,
          color: Colors.black,
          fontWeight: FontWeight.w700
        ),),
      ),
    ),
    actions: [
    Center(
      child: ElevatedButton(onPressed: () {
        Navigator.pop(context);
      }, child: Text('ok'),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.transparent),
          side: WidgetStateProperty.all(
            BorderSide(
              color: Colors.black.withOpacity(0.2), // Transparent black border
              width: 2, // Border width
            ),
          ),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10), // Border radius
            ),
          ),
          elevation: WidgetStateProperty.all(1), // Remove any elevation/shadow
        ),
      ),
    ),

    ],
    backgroundColor:Theme.of(context).colorScheme.surface ,);});
}


