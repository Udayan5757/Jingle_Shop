import 'package:flutter/cupertino.dart';
import 'package:jingle_shop/features/account/screens/wishlist_screen.dart';
import 'package:jingle_shop/features/account/services/account_services.dart';
import 'package:jingle_shop/features/account/widgets/account_button.dart';
import 'package:jingle_shop/features/admin/screens/admin_screen.dart';
import 'package:jingle_shop/features/admin/services/admin_service.dart';
import 'package:jingle_shop/features/order_details/screens/all_orders_details_screen.dart';
import 'package:jingle_shop/features/product_details/services/product_detail_service.dart';

import '../../../models/order.dart';

class TopButtons extends StatefulWidget {
  const TopButtons({super.key});

  @override
  State<TopButtons> createState() => _TopButtonsState();
}

class _TopButtonsState extends State<TopButtons> {
  List<Order>? orders;
  final AccountServices accountServices = AccountServices();
  final ProductDetailService productDetailService = ProductDetailService();
  @override
  void initState() {
    super.initState();
    fetchOrdes();
  }

  void fetchOrdes() async {
    orders = await accountServices.fetchMyOrders(
      context: context,
    );
    setState(() {});
  }
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Row(
        children: <Widget>[
          AccountButton(text: 'Your Orders', onTap: (){
            Navigator.pushNamed(context, AllOrderDetailsScreen.routeName,);
          },),
          AccountButton(text: 'Turn Seller', onTap: () {
            ProductDetailService().userType(context: context);
          }),
        ],
      ),
      const SizedBox(
        height: 10,
      ),
      Row(
        children: <Widget>[
          AccountButton(
            text: 'Log Out',
            onTap: () => AccountServices().logOut(context),
          ),
          AccountButton(text: 'Your WishList', onTap: (){
            Navigator.pushNamed(context, WishListScreen.routeName,);
          }),
        ],
      ),
    ]);
  }
}
