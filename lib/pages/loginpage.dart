import 'package:flutter/material.dart';
import 'package:test_project/pages/otppage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController mobilecontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  late String phone;
  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset : false,
      body: Column(
        children: [
        SizedBox(height: h/4,),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Row(
              children: [
                Text("Welcome,",style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Row(
              children: [
                Text("Login to continue",style: TextStyle(color: Colors.grey,fontSize: 18,fontWeight: FontWeight.bold),),
              ],
            ),
          ),
          Padding(padding: const EdgeInsets.only(left: 20,top: 20,right: 20),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Container(
                  width: w,
                  height: h/14,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.blueGrey,
                  ),
                  child: Center(
                    child: TextFormField(
                      controller: mobilecontroller,
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty ||value.length!=10) {
                          return 'Please enter mobile number';
                        }else{
                          phone = value;
                        }
                        return null;
                      },
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        fillColor: Color.fromRGBO(20,52,68,0.09),

                        hintText: "Mobile number",
                        // labelText: "Name",
                        border: InputBorder.none,
                      ),

                    ),
                  ),
                ),
                SizedBox(height: 10,),
                Container(
                  width: w,
                  height: h/14,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.blueGrey,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        width: w/1.5,
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter password';
                            }
                            return null;
                          },
                          obscureText: true,
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            fillColor: Color.fromRGBO(20,52,68,0.09),
                            border: InputBorder.none,
                            hintText: "Password",

                          ),

                        ),
                      ),
                      IconButton(onPressed: (){}, icon: Icon(Icons.remove_red_eye_outlined,size: 24,))
                    ],
                  ),
                ),
                SizedBox(height: 10,),
                Row(
                  children: [
                    SizedBox(width: w/1.8,),
                    Text("Forgot password?",style: TextStyle(color: Colors.blue),)
                  ],
                ),
                SizedBox(height: h/4,),
                MaterialButton(onPressed: (){
                  if (_formKey.currentState!.validate()) {

                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                             OtpPage(number: phone),
                        ));
                  }
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
                        Text("Login",style: TextStyle(color: Colors.white,fontSize: 24),),
                        SizedBox(width: 10,)
                      ],
                    ),
                    SizedBox(height: 10,)
                  ],
                ),
                )
              ],
            ),

          ),)
        ],
      ),
    );
  }
}
