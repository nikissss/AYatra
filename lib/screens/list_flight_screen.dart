import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:yatra1/utilis/dummy_data.dart';
import 'package:yatra1/utilis/flight_model.dart';
import 'package:yatra1/utilis/FlightBlock.dart';


class ListFlightScreen extends StatelessWidget {
   final FlightModel? model;
   final String selectedOptions;
   ListFlightScreen({Key?key, this.model, required  this.selectedOptions}) :super(key:key);
  final DateFormat format = DateFormat("dd MMM");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F5FA),
      bottomNavigationBar: BottomAppBar(
        color: Colors.blueGrey,
        elevation: 0,
        child: Container(
          width: double.maxFinite,
          height: AppBar().preferredSize.height,
          child: Row(
            children: [
              Expanded(
                child: ListTile(
                  title:Text(
                   format.format(DateTime.now()),
                    style: TextStyle(color: Colors.black),
                    ) ,
                ),
              )
            ],
          ),
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        elevation: 0,
        title: Text("Flights"),
        actions: [
          IconButton(
            onPressed: (){
               if (model != null) {
                // Example: Navigate to another screen using the passed model
             var selectedOptions;
             Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => ListFlightScreen(selectedOptions: selectedOptions),
  ),
);

              }
            },
            icon: Image.asset(
              "lib/assets/images/logo.png"
            ),
             //icon: SvgPicture.asset("assets/images/paint.png"),
             )
        ],
        ),
        body: ListView.builder(
          physics: BouncingScrollPhysics(),
          itemCount: flights.length,
          itemBuilder: (_,index){
            return Container
            (
              padding:EdgeInsets.only(bottom: 20) ,
              child:FlightBlock(model:flights[index]));
          }),
    );
  }

}

