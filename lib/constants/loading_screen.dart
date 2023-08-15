import 'package:flutter/material.dart';

import 'global_variables.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      appBar: PreferredSize(
        
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: GlobalVariables.appBarGradient,
            ),
          ),
          title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  alignment: Alignment.topLeft,
                  child: Image.asset(
                    'assets/images/jingl.png',
                    width: 120,
                    height: 45,
                    color: Colors.white,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: Row(
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
      body: Center(
        child: Image.asset(
          './assets/images/loading_gif.png!bw700',
          alignment: Alignment.center,
        ),
      ),
    );
  }
}
