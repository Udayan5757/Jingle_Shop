import 'package:flutter/material.dart';
import 'package:jingle_shop/constants/loader.dart';
import 'package:jingle_shop/features/account/widgets/single_product.dart';
import 'package:jingle_shop/features/admin/screens/add_product_screen.dart';
import 'package:jingle_shop/features/admin/services/admin_service.dart';
import 'package:jingle_shop/models/product.dart';
class PostsScreen extends StatefulWidget {
  const PostsScreen({super.key});

  @override
  State<PostsScreen> createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {
  List<Product>? products;
  final AdminService adminService = AdminService();
  @override
  void initState() {
    super.initState();
    fetchAllProducts();
  }
  Future fetchAllProducts() async{
    products = await adminService.fetchAllProducts(context);
    setState(() {
    });
  }
  void deleteProduct(Product product,int index){
    adminService.deleteProduct(context: context, product: product, onSuccess: (){
      products!.removeAt(index);
      setState(() {
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return products==null 
    ? const Loader()
    :Scaffold(
    body: GridView.builder(
      itemCount: products!.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (context,i){
      final productData = products![i];
      return Column(
        children: [
          SizedBox(height: 140,
          child: SingleProduct(image: productData.images[0]),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                  child: Text(
                    productData.name,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                ),
                IconButton(
                    onPressed: ()=> deleteProduct(productData, i),
                    icon: const Icon(
                      Icons.delete_outline,
                    ),
                  ),
            ],
          ),
        ],
      );
       
    }),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromARGB(255, 210, 191, 214),
        child: Icon(Icons.add,),
        onPressed: (){
          Navigator.pushNamed(context, AddProductScreen.routeName);
        },
        tooltip: 'Add a Product',
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}