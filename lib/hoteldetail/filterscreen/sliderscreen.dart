import 'package:flutter/material.dart';
// import 'package:yatra1/appLocalization.dart';

class SliderView extends StatefulWidget {
  final Function(double) onChnagedistValue;
  final double distValue;

  const SliderView(
      {Key? key, required this.onChnagedistValue, required this.distValue})
      : super(key: key);
  @override
  _SliderViewState createState() => _SliderViewState();
}

class _SliderViewState extends State<SliderView> {
  double distValue = 50.0;

  @override
  void initState() {
    distValue = widget.distValue;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                flex: distValue.round(),
                child: SizedBox(),
              ),
              Container(
                width: 170,
                child: Row(
                  children: [
                    Text(
                   "Less_than",
                      textAlign: TextAlign.center,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 4.0, right: 4.0),
                      child: Text(
                        "${(distValue / 10).toStringAsFixed(1)}",
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Text(
                     "km_text",
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 100 - distValue.round(),
                child: SizedBox(),
              ),
            ],
          ),
          Slider(
            onChanged: (value) {
              setState(() {
                distValue = value;
              });
              try {
                widget.onChnagedistValue(distValue);
              } catch (e) {}
            },
            min: 0.0,
            max: 100.0,
            activeColor: Colors.blueGrey,
            inactiveColor: Colors.black.withOpacity(0.4),
            //   divisions: 100,
            value: distValue,
          ),
        ],
      ),
    );
  }
}