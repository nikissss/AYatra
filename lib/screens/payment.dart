import 'package:flutter/material.dart';
import 'package:khalti_flutter/khalti_flutter.dart';

class Payment extends StatefulWidget {
  const Payment({super.key});

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  String referenceId="";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Proceed with payment"),
        backgroundColor: Colors.blueGrey,
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: (){
              payWithKhaltiInApp();
            }, child: const Text("Pay with Khalti")),
            Text(referenceId),
        ],)
        ),
    );
  }
  payWithKhaltiInApp(){
    KhaltiScope.of(context).pay(
      config: PaymentConfig(
        amount: 1000, 
        productIdentity: "product id", 
        productName: "Product name"),
        preferences:[
          PaymentPreference.khalti
        ],
        onSuccess: onSuccess,
         onFailure: onFailure,
         onCancel: onCancel,
         );
  }
  void onSuccess(PaymentSuccessModel success)
{
  showDialog(context: context, builder: (context){
    return AlertDialog(title: Text("Payment Successful"),
    actions: [
      SimpleDialogOption(child: const Text("OK"),
        onPressed: (){
          setState(() {
            referenceId = success.idx;
          });
        Navigator.pop(context);
      }
      ),
    ],
    );
  });
}
void onFailure(PaymentFailureModel failure)
{
  debugPrint(failure.toString());
}
void onCancel(){
  debugPrint("cancelled");
}
}