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

class OneWayTicket extends StatefulWidget {
  const OneWayTicket({Key? key}) : super(key: key);

  @override
  State<OneWayTicket> createState() => _OneWayTicketState();
}

class _OneWayTicketState extends State<OneWayTicket> {
  DateTime _departureDate = DateTime.now();
  bool _isDepartureDateSelected = true;
  int _selectedAdultValue = 0;
  int _selectedChildValue = 0;
  String countryCode = "";
  String countryCode1 = "";
  String selectedOptions = "";
  late String d_country;
  late String a_country;


  void _showDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2024, 1, 10),
    ).then((value) {
      if (value != null) {
        setState(() {
          if (_isDepartureDateSelected) {
            _departureDate = value;
          } else {}
        });
      }
    });
  }

  void updateSelectedOptions() {
    setState(() {
      selectedOptions =
          "From: $countryCode\nTo: $countryCode1\nDeparture Date: ${DateFormat('yyyy-MM-dd').format(_departureDate)}\nAdults: $_selectedAdultValue\nChildren: $_selectedChildValue";
    });
  }
  //   List<FlightModel> flights = []; // Initialize an empty list
  // String previousDepartureCountry = "";
  // String previousArrivalCountry = "";
  @override
  Widget build(BuildContext context) {
    final size = AppLayout.getSize(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("One-Way-Ticket"),
        backgroundColor: Colors.blueGrey,
      ),
      backgroundColor: Styles.bgColor,
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        children: [
          const Gap(40),
          Text(
            "What are\nyou looking for?",
            style: Styles.headLinestyle1.copyWith(fontSize: 35),
          ),
          const Gap(40),
          Container(
            width: size.width * 0.44,
            height: size.width * 0.07,
            padding: const EdgeInsets.all(3.5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Color(0xFFF4F6FD),
            ),
            child: Center(child: Text("Airlines")),
          ),
          const Gap(10),
          Container(
            width: size.width * 0.44,
            height: size.width * 0.07,
            padding: const EdgeInsets.all(3.5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Color(0xFFF4F6FD),
            ),
            child: Center(child: Text("One-Way-Tickets")),
          ),
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
                    TextButton(
                      onPressed: () {
                        showCountryPicker(
                          context: context,
                          countryListTheme: CountryListThemeData(
                              inputDecoration: InputDecoration(
                                  hintText: "Type your destination",
                                  labelText: "Search")),
                          onSelect: (Country value) {
                            countryCode = value.name.toString();
                            setState(() {});
                          },
                        );
                      },
                      child: Text(countryCode.toString()),
                    ),
                    const Gap(130),
                    Icon(Icons.flight_land_rounded, color: Color(0xFFBFC2DF)),
                    TextButton(
                      onPressed: () {
                        showCountryPicker(
                          context: context,
                          countryListTheme: CountryListThemeData(
                              inputDecoration: InputDecoration(
                                  hintText: "Type your destination",
                                  labelText: "Search")),
                          onSelect: (Country value) {
                            countryCode1 = value.name.toString();
                            setState(() {});
                          },
                        );
                      },
                      child: Text(countryCode1.toString()),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Gap(10),
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
                const Gap(30),
                Row(
                  children: [
                    Text(DateFormat('yyyy-MM-dd').format(_departureDate)),
                    const Gap(17),
                    MaterialButton(
                      onPressed: () {
                        setState(() {
                          _isDepartureDateSelected = true;
                        });
                        _showDatePicker();
                      },
                      child: Padding(
                        padding: EdgeInsets.all(6.0),
                        child: Text("Choose date"),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          const Gap(10),
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
                      padding:
                          EdgeInsets.symmetric(vertical: 6, horizontal: 6),
                      child: Text("Adult = $_selectedAdultValue"),
                      onPressed: () => showCupertinoModalPopup(
                        context: context,
                        builder: (_) => SizedBox(
                          width: double.infinity,
                          height: 250,
                          child: CupertinoPicker(
                            backgroundColor: Colors.white,
                            itemExtent: 30,
                            scrollController: FixedExtentScrollController(
                              initialItem: 0,
                            ),
                            children: const [
                              Text('0'),
                              Text('1'),
                              Text('2'),
                              Text('3'),
                              Text('4'),
                              Text('5'),
                            ],
                            onSelectedItemChanged: (int value) {
                              setState(() {
                                _selectedAdultValue = value;
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                    const Gap(5),
                    CupertinoButton.filled(
                      padding:
                          EdgeInsets.symmetric(vertical: 6, horizontal: 6),
                      child: Text("Children = $_selectedChildValue"),
                      onPressed: () => showCupertinoModalPopup(
                        context: context,
                        builder: (_) => SizedBox(
                          width: double.infinity,
                          height: 250,
                          child: CupertinoPicker(
                            backgroundColor: Colors.white,
                            itemExtent: 30,
                            scrollController: FixedExtentScrollController(
                              initialItem: 0,
                            ),
                            children: const [
                              Text('0'),
                              Text('1'),
                              Text('2'),
                              Text('3'),
                              Text('4'),
                              Text('5'),
                            ],
                            onSelectedItemChanged: (int value1) {
                              setState(() {
                                _selectedChildValue = value1;
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
            child: ElevatedButton(
              onPressed: () {
                updateSelectedOptions();
                
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ListFlightScreen(
                      selectedOptions: selectedOptions,
                    ),
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
          Text(selectedOptions, style: Styles.textstyle),
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


  // void updateFlightList() {
  //   // Simulate fetching flights based on selected countries
  //   flights = getFlights(countryCode, countryCode1);

  //   // Trigger a rebuild to reflect the updated list
  //   setState(() {});
  // }

  // List<FlightModel> getFlights(d_country, a_country) {
  //   // Replace this with your actual logic to fetch flights from your data source
  //   // For simplicity, a hardcoded list is used in this example
  //   return [
  //     FlightModel(
  //   id: "Rs. 10000", 
  //   name: "Yeti Airlines", 
  //   price: "1000/-",
  //   d_country: "Australia",
  //   a_country: "Andorra"
  //   ),
  //   FlightModel(
  //   id: "Rs. 20000", 
  //   name: "Buddha Air", 
  //   price: "2000/-",
  //   d_country: "Nepal",
  //   a_country: "Australia"
  //   ),
  //     // Add more flights as needed
  //   ];
  // }

