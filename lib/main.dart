import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:fluttertoast/fluttertoast.dart';
main(){
  runApp(MyApp());
}
class MyApp extends StatefulWidget {
  
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
    Razorpay _razorpay;
  @override
  void initState() {
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);_razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);_razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
    super.initState();
  }
  void _handlePaymentSuccess(PaymentSuccessResponse response) {
  Fluttertoast.showToast(
        msg: "Payment Successfull",
        toastLength: Toast.LENGTH_LONG,);
}
void _handlePaymentError(PaymentFailureResponse response) {
  Fluttertoast.showToast(
        msg: "Payment Failed",
        toastLength: Toast.LENGTH_LONG,);
}
void _handleExternalWallet(ExternalWalletResponse response) {
 Fluttertoast.showToast(
        msg: "Payment from wallet",
        toastLength: Toast.LENGTH_LONG,);
}
@override
  void dispose() {
    _razorpay.clear();
    super.dispose();
  }
  var options = {  'key': 'rzp_test_efgJjl04ZQDs8u', 
   'amount': 100, 
   //in the smallest currency sub-unit.  
   'name': 'Flutter Bootcamp',  
   'description': 'OFFLINE BOOTCAMP IN 45 DAYS', 
   'prefill': {  
      'contact': '918920613195',  
    'email': 'akshaymadan098@gmail.com'  }};

    paynow(){
      _razorpay.open(options);
    }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      title: "RazorPay",
      home: Scaffold(
        appBar: AppBar(
          title: Text("Razor Pay"),
        ),
        backgroundColor: Colors.yellow,
        body: Center(
          child: Container(
            
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("Complete Flutter bootcamo with 15 projects",style: TextStyle(color: Colors.white,fontSize: 20),),
                Text("Rs- 11,999",style: TextStyle(color: Colors.white),),
                RaisedButton(
                  child: Text("Buy Now",style: TextStyle(color: Colors.white),),
                  onPressed: (){
                    paynow();
                  },
                  color: Colors.green,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}