import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BookingForm(),
    );
  }
}

class BookingForm extends StatefulWidget {
  @override
  _BookingFormState createState() => _BookingFormState();
}

class _BookingFormState extends State<BookingForm> {
  int numberOfRooms = 1;
  int numberOfAdults = 1;
  int numberOfChildren = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Booking Form'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Number of Rooms'),
            DropdownButton<int>(
              value: numberOfRooms,
              onChanged: (value) {
                setState(() {
                  numberOfRooms = value!;
                
                });
                
              },
              items: List.generate(5, (index) => index + 1)
                  .map((int value) => DropdownMenuItem<int>(
                        value: value,
                        child: Text(value.toString()),
                      ))
                  .toList(),
            ),
            SizedBox(height: 16),
            Text('Number of Adults'),
            DropdownButton<int>(
              value: numberOfAdults,
              onChanged: (value) {
                setState(() {
                  numberOfAdults = value!;
                });
              },
              items: List.generate(10, (index) => index + 1)
                  .map((int value) => DropdownMenuItem<int>(
                        value: value,
                        child: Text(value.toString()),
                      ))
                  .toList(),
            ),
            SizedBox(height: 16),
            Text('Number of Children'),
            DropdownButton<int>(
              value: numberOfChildren,
              onChanged: (value) {
                setState(() {
                  numberOfChildren = value!;
                });
              },
              items: List.generate(5, (index) => index)
                  .map((int value) => DropdownMenuItem<int>(
                        value: value,
                        child: Text(value.toString()),
                      ))
                  .toList(),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Handle the booking logic here
                print('Rooms: $numberOfRooms, Adults: $numberOfAdults, Children: $numberOfChildren');
              },
              child: Text('Book Now'),
            ),
          ],
        ),
      ),
    );
  }
}
