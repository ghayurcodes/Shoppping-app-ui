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
    return LayoutBuilder(
      builder: (context, constraints) {
        var _height = constraints.maxHeight;
        var _width = constraints.maxWidth;

        return Scaffold(
          backgroundColor: Theme.of(context).colorScheme.surface,
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
            Theme.of(context).colorScheme.inversePrimary.withOpacity(0.5),
            title: Text(
              'Shop',
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            centerTitle: true,
          ),
          drawer: drawer(),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 4,
                child: Column(
                  children: [
                    SizedBox(height: _height * 0.03),
                    Text(
                      'Choose from a variety of Products',
                      style: TextStyle(
                        fontSize: _width * 0.05,
                        color: Theme.of(context).colorScheme.inversePrimary,
                      ),
                    ),
                    SizedBox(height: _height * 0.06),
                    Expanded(
                      child: Consumer<data>(builder: (context, value, child) {
                        return PageView.builder(
                          itemBuilder: (context, index) {
                            return iitemshow(
                              name: value.names[index],
                              price: value.prices[index],
                              image: value.image[index],
                              desc: value.descs[index],
                              ontap: () {
                                if (value.cart.contains(index)) {
                                  toast().showmsg('Already Added', Colors.red);
                                } else {
                                  toast().showmsg('Item added', Colors.green);
                                  value.cart.add(index);
                                }
                              },
                              height_: _height,
                              width_: _width,
                              onheart: () {
                                if (value.wishlist.contains(index)) {
                                  value.remove_wish(index);
                                } else {
                                  value.add_wishlist(index);
                                }
                              },
                              wishlisted: value.wishlist.contains(index),
                            );
                          },
                          itemCount: value.names.length,
                          scrollDirection: Axis.horizontal,
                          physics: BouncingScrollPhysics(),
                          controller: PageController(viewportFraction: 0.8),
                        );
                      }),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Center(
                  child: Text(
                    'Made With ❤️ by Ghayur',
                    style: TextStyle(
                      fontSize: _width * 0.05,
                      color: Theme.of(context).colorScheme.inversePrimary,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
