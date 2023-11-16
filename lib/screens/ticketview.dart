import 'package:flutter/material.dart';
import 'package:yatra1/utilis/app_styles.dart';
import 'package:yatra1/utilis/applayout.dart';
import 'package:yatra1/widgets/thickcontainer.dart';

class TicketView extends StatelessWidget {
  final Map<String, dynamic>ticket;
  const TicketView({Key? key,required this.ticket}) : super(key:key);

  @override
  Widget build(BuildContext context) {
    final size= AppLayout.getSize(context);
    return SizedBox( //upcoming flight haru gareko sizedbox ma coz size fix rakheko xau hamile thats why container use gareko xaina
   width:size.width* 0.85,
height:AppLayout.getHeight(200),
child:Container(
  margin: EdgeInsets.only(right:AppLayout.getHeight(16)),
  child:SingleChildScrollView(
    
      child: Column(
        children:[
          //blue box /ticket
      Container(
      decoration:BoxDecoration(
      color:Color(0xFF526799),
      borderRadius: BorderRadius.only(topLeft:Radius.circular(AppLayout.getHeight(21)),
      topRight: Radius.circular(AppLayout.getHeight(21)))
      
      ),
      padding:EdgeInsets.all(AppLayout.getHeight(16)),
      child:Column(
        children: [
      Row(
      children: [
      Text(
      ticket['from']?['code'] ?? '', // Provide a default value or handle null
      style: Styles.headLinestyle3.copyWith(color: Colors.white),
      ),
      
      Expanded(child: Container()),
      const ThickContainer(),
      Expanded(child: Stack(
      children:   [
        SizedBox(
        height:AppLayout.getHeight(24),
        child:LayoutBuilder(
      
          builder: (BuildContext context, BoxConstraints constraints) { 
            print("The width is ${constraints.constrainWidth()}");
            return Flex(
            direction: Axis.horizontal,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: List.generate((constraints.constrainWidth()/6).floor(), (index) => SizedBox(
              width:AppLayout.getWidth(3),height:AppLayout.getHeight(1),child:const DecoratedBox(decoration: BoxDecoration(
                color:Colors.white
              ),),
              ))
            );
           },
        ),
      ),
      Center(child: Transform.rotate(angle: 1.5,child:const Icon(Icons.local_airport_rounded,color:Colors.white,),)),
      ],
      )),
       //orinstead  const spacerwidget ni use garna milxa
      
      const ThickContainer(),
      
      Expanded(child: Container()),
      Text(ticket['to']?['code']?? '', style: Styles.headLinestyle3.copyWith(color: Colors.white),),
      ],
      ),
      SizedBox(height:AppLayout.getHeight(3)),
       
       Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children:[
      SizedBox(
      width:AppLayout.getWidth(100), child:Text(ticket['from']?['name']?? "",style:Styles.headLinestyle4.copyWith(color:Colors.white),),
      ),
      Text(ticket['flying_time']?? '' , style: Styles.headLinestyle4.copyWith(color: Colors.white)),
      SizedBox(
      width:AppLayout.getWidth(100), child:
      Text( ticket['to']?['name'] ??
      '', textAlign: TextAlign.end, style: Styles.headLinestyle4.copyWith(color: Colors.white))
      
      ),
       ],
       )
       
       ],
      ),
      )
       //orange part
      , Container(
        color:Styles.orangeColor,//const Color(0xFFF37B67),
      child: Row(
      children:[
      SizedBox(
          height:AppLayout.getHeight(20),
          width:AppLayout.getWidth(10),
          child:const DecoratedBox(
      decoration: BoxDecoration(
      color:Colors.white,
      borderRadius:BorderRadius.only(
       topRight: Radius.circular(10),
       bottomRight: Radius.circular(10),
      
      ) 
      ),
          )
        )
       ,Expanded(child: Padding(
         padding:  const EdgeInsets.all(12.0),
         child: LayoutBuilder(
         builder:(BuildContext context,BoxConstraints constraints){
       return Flex(
           direction:Axis.horizontal,
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
           mainAxisSize: MainAxisSize.max,
            children: List.generate((constraints.constrainWidth()/15).floor(), (index) =>  SizedBox(
              width:AppLayout.getWidth(5),height:AppLayout.getHeight(1),
              child:const DecoratedBox(
              decoration:BoxDecoration(
                color:Colors.white
              ),
              )
            
            ))
           );
         },
         ),
       )
       ),
       SizedBox(
          height:AppLayout.getHeight(20),
          width:AppLayout.getWidth(10),
          child:const DecoratedBox(
      decoration: BoxDecoration(
      color:Colors.white,
      borderRadius:BorderRadius.only(
       topLeft: Radius.circular(10),
       bottomLeft: Radius.circular(10),
      
      ) 
      ),
          )
        )
      ]
      )
       )
       //bottom part of orange container
      , Container(
      decoration: BoxDecoration(
      color:Styles.orangeColor,
      borderRadius: const BorderRadius.only(bottomLeft:Radius.circular(21),
      bottomRight: Radius.circular(21))
      
      ),
      padding:const EdgeInsets.only(left:16,top:16,right:16,bottom:16),
      child:Column(
      children: [
      Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
       Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
      Text(ticket['date']??'', style: Styles.headLinestyle3.copyWith(color: Colors.white)),
          const SizedBox(height:5),
          Text(
            "Date",
            style:Styles.headLinestyle4.copyWith(color:Colors.white),
            ),
        ],
      ),
        Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
      Text(
      ticket['departure_time'] ?? 'Default Departure Time',
      style: Styles.headLinestyle3.copyWith(color: Colors.white),
      ),
      
          const SizedBox(height:5),
          Text(
           "Departure time",
            style:Styles.headLinestyle4.copyWith(color:Colors.white),
            ),
        ],
      ),
        Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
      Text(
      (ticket['number'] ?? '').toString(),
      style: Styles.headLinestyle3.copyWith(color: Colors.white),
      ),
      
      const SizedBox(height: 5),
          Text(
            "Number",
            style:Styles.headLinestyle4.copyWith(color:Colors.white),
            ),
        ],
      ),
      ],
      )
      ],
      ),
       ),
        ],
      ),
    ),
  ),
);
  }
}