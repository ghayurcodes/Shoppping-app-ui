import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providerstate/provider/providers.dart';
import 'package:providerstate/provider/shop%20provider.dart';
import 'package:providerstate/screens/count.dart';
import 'package:providerstate/screens/thesmes.dart';
import 'package:providerstate/screens/ui%20try.dart';
import 'package:toastification/toastification.dart';


void main() {

  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => data(),)
      ],
      child: ToastificationWrapper(
        child: MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: light_mode,
          home: homeui(),
        ),
      ));


  }
}







