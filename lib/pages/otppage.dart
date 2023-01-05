import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:test_project/pages/home.dart';

class OtpPage extends StatefulWidget {
  final String number;
  const OtpPage({Key? key, required this.number}) : super(key: key);

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  TextEditingController _pinCotroller = TextEditingController();
  String pinvaleus = '';
  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;
    return Scaffold(
    body: Center(
      child: Column(

       children: [
         SizedBox(height: h/4,),
         Padding(
           padding: const EdgeInsets.only(left: 20),
           child: Text("OTP",style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),),
         ),
         Text("Enter otp to your mobile",style:TextStyle(color: Colors.grey,fontSize: 18)),
         Text("number +91"+widget.number.toString(),style: TextStyle(color: Colors.grey,fontSize: 18),),
         SizedBox(height: h/12,),
         Container(
           width: w/1.5,
           child: PinCodeTextField(
             backgroundColor: Colors.transparent,
             appContext: context,
             keyboardType: TextInputType.number,
             length: 4,
             controller: _pinCotroller,
             obscureText: true,
             onChanged: (pinCode) {
               print(pinCode);
             },
             onCompleted: (v){
               setState(() {
              pinvaleus = v;
               });

             },
             pinTheme: PinTheme(
                 shape: PinCodeFieldShape.box,
                 borderRadius: BorderRadius.circular(5),
                 inactiveColor: Colors.grey,
                 inactiveFillColor: Colors.grey,
                 activeColor: Colors.grey,
                 fieldHeight: 45,
                 fieldWidth: 45,
                 activeFillColor: Colors.orange
             ),
           ),
         ),
         SizedBox(height: h/12,),
         MaterialButton(onPressed: (){
           if(pinvaleus!="")
           Navigator.pushReplacement(
               context,
               MaterialPageRoute(
                 builder: (context) =>
                     HomePage(),
               ));
         },
           color: Colors.lightBlue,
           shape: RoundedRectangleBorder(
             borderRadius:BorderRadius.circular(10),
           ),
           child: Column(
             children: [
               SizedBox(height: 10,),
               Row(
                 mainAxisAlignment: MainAxisAlignment.spaceAround,
                 children: [
                   SizedBox(width: 10,),
                   Text("Submit",style: TextStyle(color: Colors.white,fontSize: 24),),
                   SizedBox(width: 10,)
                 ],
               ),
               SizedBox(height: 10,)
             ],
           ),
         )

       ],

      ),
    ),
    );
  }
}
