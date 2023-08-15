
import 'package:flutter/material.dart';
import 'package:jingle_shop/providers/user_provider.dart';
import 'package:provider/provider.dart';
class AddressBox extends StatelessWidget {
  const AddressBox({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context,listen:false).user;
    return Container(
      height:40,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(25),),
        gradient: LinearGradient(colors:[
          Color.fromRGBO(172, 185, 213, 1),
          Color.fromRGBO(228,239,233,1),
        ],
        stops: [0.5,1.0],
        ),
      ), 
      padding: const EdgeInsets.only(left:10),
      child: Row(
        children:  <Widget>[
          const Icon(Icons.location_on_outlined,size:20),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left:5),
              child:Text('Delivery to ${user.name} - ${user.address}',
              style: const TextStyle(fontWeight: FontWeight.w500),
              overflow: TextOverflow.ellipsis,),
            ),
          ),
          const Padding(padding: EdgeInsets.only(left:5,top:2,right: 5),
          child: Icon(Icons.arrow_drop_down_outlined,size: 18,),
          )
      ],
      ),
    );
  }
}