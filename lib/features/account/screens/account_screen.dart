import 'package:flutter/material.dart';
import 'package:jingle_shop/constants/global_variables.dart';
import 'package:jingle_shop/features/account/widgets/below_app_bar.dart';
import 'package:jingle_shop/features/account/widgets/orders.dart';
import 'package:jingle_shop/features/account/widgets/top_buttons.dart';
class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          flexibleSpace: Container(
            decoration:const BoxDecoration(
              gradient: GlobalVariables.appBarGradient,
            ),
          ),
          title: Row(
            mainAxisAlignment : MainAxisAlignment.spaceBetween,
            children: <Widget>[
               Container(
                alignment: Alignment.topLeft,
                child: Image.asset('assets/images/jingl.png',
                width: 120,
                height: 45,
                color: Colors.white,
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 15,right: 15),
                child:Row(
                  children: const <Widget>[
                    Padding(
                    padding: EdgeInsets.only(right: 15),
                    child: Icon(Icons.notifications_outlined, color: Colors.white,),
                  ),
                  Icon(Icons.search, color: Colors.white,),
                  ],
                ),
              ),
          ]),
        ),
      ),
      body:Column(
          children:const <Widget>[
            BelowAppBar(),
            SizedBox(height: 10,),
            TopButtons(),
             SizedBox(height: 10,),
             Orders(),
          ],
        ),
    );
  }
}