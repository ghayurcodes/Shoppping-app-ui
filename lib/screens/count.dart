

import 'dart:async';
import 'dart:io';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providerstate/provider/providers.dart';



class countexample extends StatefulWidget {
  const countexample({super.key});

  @override
  State<countexample> createState() => _countexampleState();
}

class _countexampleState extends State<countexample> {



  @override
  Widget build(BuildContext context) {

    print('build----');
    final countProviderr =Provider.of<countprovider>(context,listen: false);
    return Scaffold(

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          countProviderr.setcount();
        },
        child: Icon(CupertinoIcons.add),
      ),
      appBar: AppBar(
        title: InkWell(
          child: const Text("Provide"),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => page2()),
            );
          },
        ),
        centerTitle: true,
        backgroundColor: CupertinoColors.systemPurple,
      ),

      body: Center(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Consumer<countprovider>(builder: (context, value, child) {
              print('only text builds');
              return InkWell(child: Text(value.count.toString(), style: TextStyle(fontSize: 30)),
              onTap: () => value.setcount(),);
            },),
            Container(
              height:100,
            ),
            Container(
              height: 200,
              width: 300,
              color: Colors.blueGrey,
              child: Consumer<colorchange>(
                builder: (context, value, child) {
                  print('only container building--------');
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Slider(value:value.value, onChanged:(val){
                        value.setval(val);

                      },
                        max: 1,
                        min: 0,
                        activeColor: Colors.red,
                        label: 'fwefe',),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                                color: Colors.pink.withOpacity(value.colval),
                                height:100
                            ),
                          ),
                          Expanded(
                            child: Container(
                                color: Colors.yellow.withOpacity(value.colval),
                                height:100
                            ),
                          )
                        ],
                      )

                    ],
                  );
                },

              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 330,
              width: MediaQuery.of(context).size.width,
              color: Colors.blue,
              child: ListView.builder(itemBuilder: (context, index) {
                return Consumer<like>(builder: (context, value, child) {
                  print('only bulb part building=--------');
                  return ListTile(
                    title: Text('item ${index+1}'),
                    trailing: IconButton(
                      onPressed: (){
                        if(value.indexes.contains(index)){
                          value.removeclick(index);
                        }
                        else{
                          value.setclick(index);
                        }
                      },
                      icon: value.indexes.contains(index)?Icon(CupertinoIcons.lightbulb_fill):Icon(CupertinoIcons.lightbulb),
                    )
                  );
                });},itemCount: 5,),
            )
          ],
        ),
      ),
    );
  }
}


class page2 extends StatefulWidget {//has transparent nav bar
  const page2({super.key});

  @override
  State<page2> createState() => _page2State();
}

class _page2State extends State<page2> {

  @override
  Widget build(BuildContext context) {
    final value=Provider.of<testprov>(context);//thi line Subscribe the whole class to the provider class.
    // So whenever notify listeners call in provider class, this class get rebuild.

    print('whole rebuilt');

    return  Scaffold(
      extendBodyBehindAppBar: true,
      
      appBar: AppBar(

        flexibleSpace: ClipRRect(
          child: BackdropFilter(
             filter: ImageFilter.blur(sigmaX: 3,sigmaY: 3),
            child: Container(
              color: Colors.transparent,
            ),

          ),
        ),
        title: const Text('Selected Items'),
        backgroundColor:Colors.transparent,
      ),
      body: Column(
        children: [
      Expanded(
      child: ListView.builder(
      itemCount: 5,
        itemBuilder: (context, index) {
          return Consumer<like>(
            builder: (context, value, child) {
              return value.indexes.contains(index)
                  ? ListTile(
                tileColor: Colors.lightBlue,
                title: Text('Item ${index + 1}'),
                trailing: IconButton(
                  onPressed: () {
                    value.removeclick(index);
                  },
                  icon: const Icon(CupertinoIcons.lightbulb_fill),
                ),
              )
                  : Container();
            },
          );
        },
      ),
    ),

    Expanded(child: Container(
            color: Colors.grey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('loading test'),
          SizedBox(
            width: double.maxFinite,
            height: 30,
          ),
          ElevatedButton(onPressed: () {
            value.chk();
            // print('button rebuilt');
          }, child: value.loading_?Text('kloasing'):Text('press'))
        ],
      ),
          ))
        ],
      ),
    );

  }
}
