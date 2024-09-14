import 'dart:async';

import 'package:flutter/foundation.dart';


class countprovider with ChangeNotifier{
int _count=0;
int get count => _count;



void setcount(){
  _count++;
  notifyListeners();
}
}


class colorchange with ChangeNotifier{
  double value=0.0;

  double get colval =>value;

  void setval(double v){
    value=v;
    notifyListeners();
  }

}


class like with ChangeNotifier{
List<int> indexes=[];

  List get click=>indexes;

  void setclick(int g){
    indexes.add(g);
    notifyListeners();

  }



void removeclick(int g){
  indexes.remove(g);
  notifyListeners();


}

}


class testprov with ChangeNotifier{

  bool loadng=false;

  get loading_ =>loadng;

  void lloading(bool c){
    loadng=c;
    notifyListeners();
  }


  void chk(){
    lloading(true);
    Timer(
     Duration(seconds:  2),() {
        print('done');
        lloading(false);
     },

    );
  }
}


