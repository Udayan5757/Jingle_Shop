import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:jingle_shop/common/widgets/custom_button.dart';
import 'package:jingle_shop/constants/loader.dart';
import 'package:jingle_shop/features/admin/models/sales.dart';
import 'package:jingle_shop/features/admin/services/admin_service.dart';
import 'package:jingle_shop/features/admin/widgets/category_products_chart.dart';
import 'package:jingle_shop/features/product_details/services/product_detail_service.dart';

class AnalyticsScreen extends StatefulWidget {
  const AnalyticsScreen({super.key});

  @override
  State<AnalyticsScreen> createState() => _AnalyticsScreenState();
}

class _AnalyticsScreenState extends State<AnalyticsScreen> {
  final AdminService adminService = AdminService();
  int totalSales = 0;
  List<Sales> earnings = [];
  int totalAmount = 0;
  @override
  void initState() {
    super.initState();
    getEarnings();
  }

  getEarnings() async {
    var earningData = await adminService.getEarnings(context);
    totalSales = earningData['totalEarnings'];
    earnings = earningData['sales'];
    totalAmount = totalSales.toInt();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8, bottom: 20),
      child: Column(
        children: [
          Text('total sales : ${totalAmount.toString()}'
            ,textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.green),
          ),
          SizedBox(
            height: height/3,
            child: CategoryProductChart(seriesList: [
              charts.Series(
                id: 'Sales',
                data: earnings,
                domainFn: (Sales sales, _) => sales.label,
                measureFn: (Sales sales, _) => sales.earning,
              ),
            ]),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            'Analytical Representation',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontSize: 22,
            ),
          ),
          Expanded(
            child: Align(
                alignment: Alignment.bottomCenter,
                child: CustomButton(
                    text: 'Turn To User',
                    onTap: () =>
                        ProductDetailService().userType(context: context))),
          ),
        ],
      ),
    );
  }
}
