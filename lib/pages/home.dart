import 'package:flutter/material.dart';
import 'package:mobile_store_app/pages/baseAppbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'signout.dart';
class Home extends StatefulWidget {
  
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String data="";
  bool cu=false;
  String uid="";
  String email="";
  @override
  Widget build(BuildContext context) {
    FirebaseAuth.instance
  .idTokenChanges()
  .listen((User? user) {
    if (user == null) {
      data="Please login";
      cu=false;
    } else {
      data="welcome";
      cu=true;
      email=user.email!;
      uid=user.uid;
    }
  });
    return Scaffold(
      appBar: BaseAppBar().getTopAppBar("MOBILE CAFE"),
      drawer: BaseAppBar().getDrawer(context),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (cu) ...[
              Container(
                height: 200,
                width: 200,
                child: const Text("please login"),
              ),
            ] else ...[
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Text("welcome"),
                      Text(email),
                      //Text(uid),

                      MaterialButton(
                        onPressed: (){
                          signOut().userout;
                          
                        },
                        color: Colors.red,
                        textColor: Colors.white,
                        child: Text("Signout"),
                        )
                    ],
                  ),
                ],
              ),
        ],
        ]
      ),
      bottomNavigationBar: BaseAppBar().getBottomAppbar(context),
      floatingActionButton: BaseAppBar().getFloatingButton(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterDocked,
    );
  }
}