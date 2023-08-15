import 'package:flutter/material.dart';
import 'package:jingle_shop/features/home/widgets/address_box.dart';
import 'package:jingle_shop/constants/global_variables.dart';
import 'package:jingle_shop/features/home/widgets/caraousel_image.dart';
import 'package:jingle_shop/features/home/widgets/deal_of_day.dart';
import 'package:jingle_shop/features/home/widgets/top_catagories.dart';
import 'package:jingle_shop/features/search/screens/search_screen.dart';
class HomeScreen extends StatefulWidget {
  static const String routeName = '/home-screen';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void navigateToSearchPage(String query){
    Navigator.pushNamed(context, SearchScreen.routeName,arguments: query);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: AppBar(
          backgroundColor: Colors.white,
          flexibleSpace: Container(
            decoration:const BoxDecoration(
              gradient: GlobalVariables.appBarGradient,
            ),
          ),
          title: Stack(
            children: [Row(
              mainAxisAlignment : MainAxisAlignment.spaceBetween,
              children: <Widget>[
                 Expanded(
                   child: Container(
                    height: 42,
                    margin: const EdgeInsets.only(left:15, top: 15),
                    child: Material(
                      borderRadius: BorderRadius.circular(30),
                      elevation: 1,
                      child: TextFormField(
                        onFieldSubmitted: navigateToSearchPage,
                        decoration: InputDecoration(
                          prefixIcon: InkWell(
                            onTap: (){},
                            child: const Padding(
                              padding: EdgeInsets.only(left:6),
                              child:Icon(Icons.search,color: Colors.black,size:23),
                            ),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding:const EdgeInsets.only(top:10),
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            borderSide: BorderSide.none,
                          ),
                          enabledBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            borderSide: BorderSide(color: Colors.black38,width: 1),
                          ),
                          hintText: 'Search',
                          hintStyle: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 17,
                          ),
                        ),
                      ),
                    ), ),
                 ),
                 Container(
                  color:Colors.transparent,
                  height:42,
                  margin: const EdgeInsets.symmetric(horizontal:10),
                  child: const Icon(Icons.mic,color: Colors.white,size: 25,),
                 ),
            ]),
          ]),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(25)),color: Colors.white),
          child: Column(
            children: const <Widget>[
              AddressBox(),
              SizedBox(height:10),
              TopCategories(),
              SizedBox(height:10),
              CaraouselImage(),
              DealOfDay(),
            ]
          ),
        ),
      ),
    ); 
  }
}