import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:jingle_shop/common/widgets/custom_button.dart';
import 'package:jingle_shop/features/address/screens/address_screen.dart';
import 'package:jingle_shop/features/cart/widgets/cart_product.dart';
import 'package:jingle_shop/features/cart/widgets/cart_subtotal.dart';
import 'package:jingle_shop/features/home/widgets/address_box.dart';
import 'package:jingle_shop/providers/user_provider.dart';
import 'package:provider/provider.dart';

import '../../../constants/global_variables.dart';
import '../../search/screens/search_screen.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  void navigateToSearchPage(String query) {
    Navigator.pushNamed(context, SearchScreen.routeName, arguments: query);
  }

  void navigateToAddress(int sum) {
    Navigator.pushNamed(
      context,
      AddressScreen.routeName,
      arguments: sum.toString(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final user = context.watch<UserProvider>().user;
    int sum = 0;
    int intSum = 0;
    int total = 0;
    if (user.cart!.isNotEmpty) {
      user.cart!.map((e) {
        total += e['quantity'] == null ? 0 : e['quantity'] as int;
        sum += ((e['quantity'] == null ? 0 : e['quantity'] as int) *
            e['product']['price']) as int;
        return sum;
      }).toList();
      intSum = sum.round().toInt();
    }

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          iconTheme: const IconThemeData(
            color: Colors.white, //change your color here
          ),
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: GlobalVariables.appBarGradient,
            ),
          ),
          title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  child: Container(
                    height: 42,
                    margin: const EdgeInsets.only(left: 15),
                    child: Material(
                      borderRadius: BorderRadius.circular(7),
                      elevation: 1,
                      child: TextFormField(
                        onFieldSubmitted: navigateToSearchPage,
                        decoration: InputDecoration(
                          prefixIcon: InkWell(
                            onTap: () {},
                            child: const Padding(
                              padding: EdgeInsets.only(left: 6),
                              child: Icon(Icons.search,
                                  color: Colors.black, size: 23),
                            ),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: const EdgeInsets.only(top: 10),
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(7)),
                            borderSide: BorderSide.none,
                          ),
                          enabledBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(7)),
                            borderSide:
                                BorderSide(color: Colors.black38, width: 1),
                          ),
                          hintText: 'Search',
                          hintStyle: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 17,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  color: Colors.transparent,
                  height: 42,
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  child: const Icon(
                    Icons.mic,
                    color: Colors.white,
                    size: 25,
                  ),
                ),
              ]),
        ),
      ),
      body: total == 0
          ? Center(
              child: Image.asset(
                './assets/images/empty_cart.png',
                alignment: Alignment.center,
              ),
            )
          : SingleChildScrollView(
              child: Column(
                children: [
                  const AddressBox(),
                  const CartSubTotal(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomButton(
                      text: 'Proceed To Buy (${user.cart!.length}) items',
                      onTap: () => navigateToAddress(intSum),
                      color: Colors.yellow[600],
                    ),
                  ),
                  const SizedBox(height: 15),
                  Container(
                    color: Colors.black12.withOpacity(0.08),
                    height: 1,
                  ),
                  const SizedBox(height: 5),
                  ListView.builder(
                    itemCount: user.cart!.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return CartProduct(index: index);
                    },
                  )
                ],
              ),
            ),
    );
  }
}
