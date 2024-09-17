

import 'package:flutter/cupertino.dart';

class data with ChangeNotifier{
  final Names=['Sneakers','Bags','Toys','clothes'];
  final Desc=['Ultra comfort','Best for travel','A child must have','Level up your fashion game'];
  final Price=[100,50,20,80];
  final Images=['assets/images/pngegg.png','assets/images/bag.png','assets/images/toy.png','assets/images/clothes.png'];

  List cart=[];
  List wishlist=[];

  get names=>Names;
  get descs=>Desc;
  get prices=>Price;
  get image=>Images;

  void add(index){
    cart.add(index);
    notifyListeners();
  }

  void remove(int index){
    cart.remove(index);
    notifyListeners();
  }

  void reset(){
    cart.clear();
    notifyListeners();
  }

  void remove_wish(int index){
    wishlist.remove(index);
    notifyListeners();
  }
  void add_wishlist(int index){
    wishlist.add(index);
    notifyListeners();
  }

  void reset_wish(){
    wishlist.clear();
    notifyListeners();
  }



}

