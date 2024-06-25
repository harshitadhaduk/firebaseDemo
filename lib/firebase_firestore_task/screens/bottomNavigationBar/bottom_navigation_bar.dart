import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_demo/firebase_firestore_task/screens/user/favourite_screen.dart';
import 'package:firebase_demo/firebase_firestore_task/screens/home/home_screen_firebase.dart';
import 'package:firebase_demo/firebase_firestore_task/screens/auth/profile_screen.dart';
import 'package:firebase_demo/firebase_firestore_task/screens/user/user_order_screen.dart';
import 'package:firebase_demo/firebase_firestore_task/screens/seller/add_product_screen.dart';
import 'package:firebase_demo/firebase_firestore_task/screens/seller/seller_order_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../preferenceManager/preference_manager.dart';
import '../seller/seller_home_screen.dart';

class BottomNavigationBarScreenFirBase extends StatefulWidget {
  final userType;
  const BottomNavigationBarScreenFirBase({super.key, this.userType});

  @override
  State<BottomNavigationBarScreenFirBase> createState() =>
      _BottomNavigationBarScreenFirBaseState();
}

class _BottomNavigationBarScreenFirBaseState
    extends State<BottomNavigationBarScreenFirBase> {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  final auth = FirebaseAuth.instance.currentUser!.uid;
  int select = 0;

  List screens = [
    HomeScreenFireBase(),
    UserOrderScreen(),
    FavouriteScreen(),
    ProfileScreenFireBase(),
  ];
  int select2 = 0;

  List screens2 = [
    SellerHomeScreen(),
    AddProductScreen(),
    SellerOrderScreen(),
    ProfileScreenFireBase(),
  ];

  @override
  void initState() {
    // TODO: implement initState

    getData();
    super.initState();
  }

  Future getData() async {
    var data = await firebaseFirestore.collection("userData").doc(auth).get();
    var data2 = data.data();
    var data3 = data2!["user type"];
    print("${data3}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: widget.userType != "Seller"
          ? BottomNavigationBar(
              unselectedItemColor: Colors.black,
              type: BottomNavigationBarType.fixed,
              currentIndex: select,
              onTap: (value) {
                setState(() {
                  select = value;
                });
              },
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: "Home",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_cart),
                  label: "Order",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.favorite),
                  label: "Favourite",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: "Person",
                ),
              ],
            )
          : BottomNavigationBar(
              unselectedItemColor: Colors.black,
              type: BottomNavigationBarType.fixed,
              currentIndex: select2,
              onTap: (value) {
                setState(() {
                  select2 = value;
                });
              },
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: "Home",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.add_business),
                  label: "Add Products",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_cart),
                  label: "Order",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: "Person",
                ),
              ],
            ),
      body: Center(
        child:
            widget.userType != "Seller" ? screens[select] : screens2[select2],
      ),
      // body: FutureBuilder(
      //   future: firebaseFirestore.collection("userData").doc(auth).get(),
      //   builder: (context, snapshot) {
      //     if (snapshot.connectionState == ConnectionState.done) {
      //       var data2 = snapshot.data!.data();
      //       var data3 = data2!["user type"];
      //       return Center(
      //         child: widget.userType != "Seller"
      //             ? screens[select]
      //             : screens2[select2],
      //       );
      //     } else {
      //       return const Center(
      //         child: CircularProgressIndicator(),
      //       );
      //     }
      //   },
      // ),
    );
  }
}
