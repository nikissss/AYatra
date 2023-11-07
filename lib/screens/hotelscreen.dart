import 'package:flutter/material.dart';
import 'package:yatra1/utilis/app_styles.dart';
import 'package:yatra1/utilis/applayout.dart';

class HotelScreen extends StatefulWidget {
  final Map<String, dynamic> hotel;
  const HotelScreen({Key? key, required this.hotel}):super(key:key);

  @override
  State<HotelScreen> createState() => _HotelScreenState();
}

class _HotelScreenState extends State<HotelScreen> {
  @override
  Widget build(BuildContext context) {
    
  if (widget.hotel != null && widget.hotel.containsKey('price')) {
    print('Hotel price is ${widget.hotel['price']}');
  } else {
    print('Hotel data is missing or price is not available');
  }
    final size = AppLayout.getSize(context);
    var hotel;
    return Container(
      width:size.width*0.6,
      height:AppLayout.getHeight(350),
      padding:const EdgeInsets.symmetric(horizontal: 15, vertical:17),
      margin:const EdgeInsets.only(right:17,top:5),
      decoration: BoxDecoration(
        color:Styles.primaryColor,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
  color:Colors.grey.shade200,
  blurRadius: 2,
  spreadRadius: 1,
          )
        
        ]
      ),
      child:Column(
        children:[
        Container(
          height:AppLayout.getHeight(180),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color:Styles.primaryColor,
            image: DecorationImage(
              fit:BoxFit.cover,
              image: AssetImage(
                "lib/images/${widget.hotel['image']}",
              )
            
            )
          ),
        ),
         SizedBox(height:AppLayout.getHeight(10)),
     Text(
  widget.hotel != null && widget.hotel.containsKey('place')
      ? widget.hotel['place']
      : 'Place not available',
  style: Styles.headLinestyle2.copyWith(color: Styles.kakiColor),
),

    SizedBox(height:AppLayout.getHeight(5)),
      Text(
  widget.hotel != null && widget.hotel.containsKey('destination')
      ? widget.hotel['destination']
      : 'Destination not available',
  style: Styles.headLinestyle3.copyWith(color: Colors.white),
),

 SizedBox(height:AppLayout.getHeight(8)),
       Text(
  widget.hotel != null && widget.hotel.containsKey('price')
      ? '\$${widget.hotel['price']}/night'
      : 'Price not available',
  style: Styles.headLinestyle1.copyWith(color: Styles.kakiColor),
),

        ]
      )
    );
  }
}