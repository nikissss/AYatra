import 'package:country_picker/country_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:yatra1/screens/list_flight_screen.dart';
import 'package:yatra1/utilis/applayout.dart';
import 'package:yatra1/utilis/app_styles.dart';
import 'package:yatra1/utilis/dummy_data.dart';
import 'package:yatra1/utilis/flight_model.dart';
//import 'package:yatra1/widgets/double_text_widget.dart';
import 'package:yatra1/utilis/ticket_tabs.dart';

class SearchScreen extends StatefulWidget {
   const SearchScreen({super.key});
  
  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  //create datetime variable
  DateTime _departureDate = DateTime.now();
  DateTime _arrivalDate = DateTime.now();
  
  //show date picker method
void _showDatePicker(){
  showDatePicker(
    context: context, 
    initialDate: DateTime.now(), 
    firstDate: DateTime.now(),//DateTime(2023), 
    lastDate: DateTime(2024,1,10)
    ).then((value) {
      
        if(value!= null)
        {
          setState(() {
            if(_isDepartureDateSelected)
            {
              _departureDate = value;
            } else{
              _arrivalDate=value;
            }
          });
        }
        // _dateTime = value!;
     
    });
}
bool _isDepartureDateSelected = true;
int _selectedAdultValue=0;
int _selectedChildValue =0;
String countryCode="";
String countryCode1="";
String selectedOptions = "";
late String d_country;
  late String a_country;

void updateSelectedOptions() {
    setState(() {
      selectedOptions =
          "From: $countryCode\nTo: $countryCode1\nDeparture Date: ${DateFormat('yyyy-MM-dd').format(_departureDate)}\n Arrival Date: ${DateFormat('yyyy-MM-dd').format(_arrivalDate)}\nAdults: $_selectedAdultValue\nChildren: $_selectedChildValue";
    });
  }
  @override
  Widget build(BuildContext context) {
    final size=AppLayout.getSize(context);
    return Scaffold(
      backgroundColor: Styles.bgColor,
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
        children: [
          const Gap(40),
          Text("What are\nyou looking for?",style: Styles.headLinestyle1.copyWith(fontSize: 35)),
          const Gap(40),
          //const AppTicketTabs(firstTab: "Airline Tickets"),
          // Container(
          //   padding: const EdgeInsets.all(3.5),
          //   decoration: BoxDecoration(
          //     borderRadius: BorderRadius.circular(50),
          //     color:Color(0xFFF4F6FD),
          //   ),
          //   child: Row(
          //     children: [
          //       //Airline tickets
                Container(
                  width: size.width*.44,
                  height: size.width*0.07,
                  // padding: EdgeInsets.symmetric(vertical:7 ),
                  padding: const EdgeInsets.all(3.5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color:Color(0xFFF4F6FD),
                  ),
                  child:Center(child: Text("Airlines")),
                   
                ),
          const Gap(20),
          const AppTicketTabs(firstTab: "Two-way ticket", secondTab: "One-way ticket",)
        ,
        const Gap(10),
        Container(
  padding: EdgeInsets.symmetric(vertical: 6, horizontal: 12),
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(10),
    color: Colors.white,
  ),
  child: Row(
    children: [
      
      
      Row(
        children: [
          
          Icon(Icons.flight_takeoff_rounded, color: Color(0xFFBFC2DF)),
      // const Gap(10), 
          //button
          TextButton(
            onPressed: (){
              showCountryPicker(
                context: context, 
                countryListTheme: CountryListThemeData(
                  inputDecoration: InputDecoration(
                    hintText: "Type your destination",
                    labelText: "Search"
                  )
                ),
                onSelect: (Country value){
                  countryCode = value.name.toString();
                  setState(() {
                    
                  });
                }
                );
            }, 
            child: Text(countryCode.toString())
            ),
          
          const Gap(100),
            Icon(Icons.flight_land_rounded, color: Color(0xFFBFC2DF)),
            TextButton(
            onPressed: (){
              showCountryPicker(
                context: context, 
                countryListTheme: CountryListThemeData(
                  inputDecoration: InputDecoration(
                    hintText: "Type your destination",
                    labelText: "Search"
                  )
                ),
                onSelect: (Country value){
                  countryCode1 = value.name.toString();
                  setState(() {
                    
                  });
                }
                );
            }, 
            child: Text(countryCode1.toString())
            ),
            
          
        ],
      ),
    ],
  ),
),
        const Gap(10),
        // AppIconText(icon: Icons.flight_takeoff_rounded, text: "Departure",),
        Container(
  padding: EdgeInsets.symmetric(vertical: 6, horizontal: 12),
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(10),
    color: Colors.white,
  ),
  child: Row(
    children: [
      
      Icon(Icons.flight_takeoff_rounded, color: Color(0xFFBFC2DF)),
      const Gap(10),
      Text("Departure", style: Styles.textstyle),
      const Gap(10),  // Add a gap or SizedBox as needed
      Row(
        children: [
          //display chosen date
          // Text(_dateTime.month.toString()),
          Text(DateFormat('yyyy-MM-dd').format(_departureDate)),
          const Gap(17),
          //button
          MaterialButton(
            onPressed: (){
              setState(() {
                _isDepartureDateSelected =true;
              });
            _showDatePicker();
            },
            child: Padding(
              padding: EdgeInsets.all(6.0),
            child: Text("Choose date"),
          )
          ),
        ],
      ),
    ],
  ),
),

        const Gap(15),
        //AppIconText(icon: Icons.flight_land_rounded, text: "Arrival"),
         Container(
  padding: EdgeInsets.symmetric(vertical: 6, horizontal: 12),
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(10),
    color: Colors.white,
  ),
  child: Row(
    children: [
      Icon(Icons.flight_land_rounded, color: Color(0xFFBFC2DF)),
      const Gap(10),
      Text("Arrival", style: Styles.textstyle),
      const Gap(15),  // Add a gap or SizedBox as needed
      Row(
        children: [
          //display chosen date
          // Text(_dateTime.toString()),
          Text(DateFormat('yyyy-MM-dd').format(_arrivalDate)),
          const Gap(5),
          //button
          MaterialButton(
            onPressed: (){
              setState(() {
                _isDepartureDateSelected =false;
              });
            _showDatePicker();
            },
            child: Padding(
              padding: EdgeInsets.all(6.0),
            child: Text("Choose date"),
          )
          ),
        ],
      ),
    ],
  ),
),
        const Gap(15),
       // AppIconText(icon:Icons.people_alt_rounded, text:"No. of people"),
        Container(
  padding: EdgeInsets.symmetric(vertical: 6, horizontal: 12),
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(10),
    color: Colors.white,
  ),
  child: Row(
    children: [
      Icon(Icons.people_alt_rounded, color: Color(0xFFBFC2DF)),
      const Gap(10),
      Text("No. of people", style: Styles.textstyle),
      const Gap(30),  
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CupertinoButton.filled(
            padding: EdgeInsets.symmetric(vertical: 6, horizontal: 6),
            child: Text("Adult = $_selectedAdultValue"), 
            onPressed: () => showCupertinoModalPopup(
              context: context, 
              builder: (_) => SizedBox(
                width: double.infinity,
                height:250,
                child: CupertinoPicker(
                  backgroundColor: Colors.white,
                  itemExtent: 30,
                  scrollController:FixedExtentScrollController(
                    initialItem: 0,
                    ),
                    children: const[
                      Text('0'),
                      Text('1'),
                      Text('2'),
                      Text('3'),
                      Text('4'),
                      Text('5'),
                    ],
                    onSelectedItemChanged: (int value) {
                      setState(() {
                        _selectedAdultValue= value;
                      });
                    },
                ),
              ),
            ),
              ),
              const Gap(5),
              CupertinoButton.filled(
            padding: EdgeInsets.symmetric(vertical: 6, horizontal: 6),
            child: Text("Children = $_selectedChildValue"), 
            onPressed: () => showCupertinoModalPopup(
              context: context, 
              builder: (_) => SizedBox(
                width: double.infinity,
                height:250,
                child: CupertinoPicker(
                  backgroundColor: Colors.white,
                  itemExtent: 30,
                  scrollController:FixedExtentScrollController(
                    initialItem: 0,
                    ),
                    children: const[
                      Text('0'),
                      Text('1'),
                      Text('2'),
                      Text('3'),
                      Text('4'),
                      Text('5'),
                    ],
                    onSelectedItemChanged: (int value1) {
                      setState(() {
                        _selectedChildValue= value1;
                      });
                    },
                ),
              ),
            ),
              ),
        ],
      )
    ],

  ),
),
        const Gap(15),

        Container(
          // padding: EdgeInsets.symmetric(vertical: 12, horizontal:12),
          // decoration: BoxDecoration(
          //   borderRadius: BorderRadius.circular(10),
          //   color: Color(
          //     0xD91130CE
          //   )

          // ),
          // child: Center(
          //   child: Text(
          //         "Find Tickets",
          //         style: Styles.textStyle.copyWith(color: Colors.white,),
          //       ),
          // )
          child: ElevatedButton(
            onPressed: () 
            {
              updateSelectedOptions();
            Navigator.push(
            context,
             MaterialPageRoute(
             builder: (context) => ListFlightScreen(selectedOptions: selectedOptions),
             ),
              );
              updateFlightList();
            }, 
            child: Container(
              child: Text("Find Ticket"),
            ),
            ),
        ),
        const Gap(10),
          Text(selectedOptions, style: Styles.headLinestyle1.copyWith(fontSize: 20),),
          const Gap(40),

       
        //articles
        //AppDoubleTextWidget(BixText: "More Information", SmallText: "View All"),
        const Gap(15),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 400,
              width: size.width*0.42,
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade200,
                    blurRadius: 1,
                    spreadRadius: 1,
                  )
                ]
              ),
              child: Column(
                children: [
                  Container(
                    height: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12) ,
                      image: const DecorationImage(
                      image: AssetImage(
                         "assets/images/appIcon.png"
                        )
                        )
                    ),
                  ),
                  const Gap(12),
                  Text(
              "20% discount on the early booking. Don't miss out the chance",
              style: Styles.headLinestyle2
            )
              ]),
            ),

            Column(
              children: [
                Stack(
                  children: [
                    Container(
                  width: size.width*0.44,
                  height: 174,
                  
                  decoration: BoxDecoration(
                    color: Color(0xFF3AB8B8),
                    borderRadius: BorderRadius.circular(18)
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Discount \nFor Survey", style: Styles.headLinestyle2.copyWith(fontWeight: FontWeight.bold, color: Colors.white),),
                      const Gap(10),
                      Text("Take the survey about our services and get discount", style: Styles.headLinestyle2.copyWith(fontWeight: FontWeight.w500, color: Colors.white,fontSize:18)),
                    ],
                  ),
                ),
                Positioned(right:-45,
                top: -40,
                  child: 
                Container(
                  padding: EdgeInsets.all(30),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(width:18, color: Color(0xFF189999)),
                    color: Colors.transparent,
                  ),
                ),)
                ],
                )
              ,
              const Gap(15),
              Container(
                width: size.width*0.44,
                height: 210,
                padding: EdgeInsets.symmetric(vertical: 15,horizontal: 15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  color: const Color(0xFFEC6545)
                ),
                child: Column(
                  children: [
                    Text("Take Love", style: Styles.headLinestyle2.copyWith(color: Colors.white,fontWeight:FontWeight.bold,),textAlign:TextAlign.center ),
                    const Gap(5),
                    RichText(
                      text: const TextSpan(
                        children: [
                          TextSpan(
                            text: '<3',
                            style: TextStyle(fontSize: 38)
                          ),
                          TextSpan(
                            text: '<3',
                            style: TextStyle(fontSize: 50)
                          ),
                          TextSpan(
                            text: '<3',
                            style: TextStyle(fontSize: 38)
                          )
                        ]
                      )
                    )
                  ],
                ),
              )
              ],
            )
            
          ],
        )
        ],
      ),
    );
  }
  void updateFlightList() {
    // Only update the flight list if both departure and arrival countries are selected
    if (countryCode.isNotEmpty && countryCode1.isNotEmpty) {

      // Trigger a rebuild to reflect the updated list
      setState(() {
          flights = getFlights(countryCode, countryCode1);
          print("Updating flights with departure: $countryCode, arrival: $countryCode1");

      });
    }
  }
// void updateFlightList() {
//     // Only update the flight list if either departure or arrival countries change
   
//       flights = getFlights(countryCode, countryCode1);

//       // Update previous values
//       previousDepartureCountry = countryCode;
//       previousArrivalCountry = countryCode1;

//       // Trigger a rebuild to reflect the updated list
//       setState(() {});
    
//   }

  List<FlightModel> getFlights(String departureCountry, String arrivalCountry) {
    // Filter flights based on selected departure and arrival countries
    print("equal cha ki chaina check gareko");
    return flights.where((flight) =>
        flight.d_country == departureCountry && flight.a_country == arrivalCountry).toList();
  }
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("didchangedependencies called");
    // Call updateFlightList when the route changes
    updateFlightList();
  }
  
  void didPopNext() {
    print("didPopNext called");
    // Call updateFlightList when the route is popped (user navigates back)
    updateFlightList();
  }
}