import 'package:flutter/material.dart';
import 'package:yatra1/screens/payment.dart';
import 'package:yatra1/utilis/flight_model.dart';

class FlightBlock extends StatelessWidget {
  final FlightModel model;
  const FlightBlock({Key?key, required this.model}):super(key:key);
  
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
            model.name,
          ),
          
          IconButton(
            onPressed: (){}, 
            icon: Icon(
              Icons.info_outline,
              size: 18,
              color: Colors.black45.withOpacity(0.3),
              ),
            )
            ],
          ),
          RichText(text: TextSpan(
            children: [
              const WidgetSpan(
                child: Icon(
                  Icons.money_off_csred_rounded, 
                  size: 20,
                  ),
                  ),
                  
                  TextSpan(
                   text: model.id,
                  //text:"Nepal Government",
                    style: TextStyle(color: Colors.black) )
            ]
          ),
          ),
          const SizedBox(
            height: 10,
          ),
          Wrap(
            runSpacing: 10,
            spacing: 20 ,
            children: List.generate(
              2,
               (index) {
                //for dummy data
                Color color= index %2==0? Colors.orange : Colors.green;
                // return Padding(
                //   padding: const EdgeInsets.only(right:10, top:20),
                 return GestureDetector(
                  onTap:(){
                    //to seat selection
                  } ,
                   child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                          width: 2,
                          color: Color(0xffE5E5E5),
                        )
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                      
                      //  child: Text(
                      //   model.Refund[index], 
                      //   style: TextStyle(color: color),),
                        child: InkWell(
           onTap: () {
      // Navigate to the Payment page
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Payment(),
        ),
      );
    },
              child: Text(
                model.Refund[index], 
                // "Proceed with payment",
                 style: TextStyle(color: color),
            ),
          ),
                                 ),
                 );
               }
               ),
          )
        ],
      ),
    );
  }
}