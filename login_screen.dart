import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_flutter/loginpage/forgot_password.dart';
import 'signup_screen.dart';
import 'firstpage.dart';
class Loginscreen extends StatefulWidget {
  const Loginscreen({super.key});

  @override
  State<Loginscreen> createState() => _LoginscreenState();
}
class _LoginscreenState extends State<Loginscreen> {
  var formkey = GlobalKey<FormState>();
  var emailcontroller = TextEditingController();
  var passwordcontroller = TextEditingController();
  var isObsecure = true.obs;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: LayoutBuilder(
        builder: (context, cons){
          return ConstrainedBox(
              constraints:BoxConstraints(
                minHeight: cons.maxHeight,
              ),
              child:SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      width:MediaQuery.of(context).size.width,
                      height: 350,
                      child: Image.asset(
                          "images/login.jpg"),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(

                        decoration: BoxDecoration(
                            color: Colors.pink[200],
                            borderRadius: const BorderRadius.all(
                              Radius.circular(60),
                            ),
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 8,
                                color: Colors.lightBlueAccent,
                                offset: Offset(0, -3),
                              ),
                            ]
                        ),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(30,30,30,8 ),
                          child: Column(
                            children: [
                              //Email , Password , Login Button
                              Form(
                                key: formkey,
                                child: Column(
                                  children: [
                                    //Email
                                    TextFormField(
                                      controller: emailcontroller,
                                      validator: (val)=> val == ""? "Please write Email":null,
                                      decoration: InputDecoration(
                                          prefixIcon:const Icon(Icons.email,
                                            color: Colors.black,),
                                          hintText: "Email...",
                                          border: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(30),
                                              borderSide:const BorderSide(
                                                color: Colors.white60,
                                              )
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(30),
                                              borderSide:const BorderSide(
                                                color: Colors.white60,
                                              )
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(30),
                                              borderSide:const BorderSide(
                                                color: Colors.white60,
                                              )
                                          ),
                                          disabledBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(30),
                                              borderSide:const BorderSide(
                                                color: Colors.white60,
                                              )
                                          ),
                                          contentPadding:const EdgeInsets.symmetric(
                                            horizontal: 14,
                                            vertical: 4,
                                          ),
                                          fillColor: Colors.white,
                                          filled: true
                                      ),
                                    ),
                                    const SizedBox(height: 18),
                                    //password
                                    Obx(() => TextFormField(
                                      controller: passwordcontroller,
                                      obscureText: isObsecure.value,
                                      validator: (val)=> val == ""? "Please write Password":null,
                                      decoration: InputDecoration(
                                          prefixIcon:const Icon(Icons.vpn_key_sharp,
                                            color: Colors.black,),
                                          suffixIcon: Obx(
                                                  ()=>GestureDetector(
                                                onTap: (){
                                                  isObsecure.value=!isObsecure.value;
                                                },
                                                child: Icon(
                                                  isObsecure.value? Icons.visibility_off: Icons.visibility,
                                                  color: Colors.black,
                                                ),
                                              )
                                          ),
                                          hintText: "Password...",
                                          border: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(30),
                                              borderSide:const BorderSide(
                                                color: Colors.white60,
                                              )
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(30),
                                              borderSide:const BorderSide(
                                                color: Colors.white60,
                                              )
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(30),
                                              borderSide:const BorderSide(
                                                color: Colors.white60,
                                              )
                                          ),
                                          disabledBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(30),
                                              borderSide:const BorderSide(
                                                color: Colors.white60,
                                              )
                                          ),
                                          contentPadding:const EdgeInsets.symmetric(
                                            horizontal: 14,
                                            vertical: 4,
                                          ),
                                          fillColor: Colors.white,
                                          filled: true
                                      ),
                                    ),),

                                    const SizedBox(height: 18),
                                    //button
                                    Material(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.circular(30),
                                      child: InkWell(
                                        onTap: ()async {
                                          if (formkey.currentState!.validate()) {
                                            try {
                                              UserCredential userCredential =
                                              await FirebaseAuth.instance
                                                  .signInWithEmailAndPassword(
                                                email: emailcontroller.text,
                                                password: passwordcontroller.text,
                                              );
                                              // If login is successful, navigate or perform necessary actions
                                              if (userCredential.user != null) {
                                                emailcontroller.clear();
                                                passwordcontroller.clear();
                                                // Navigate to a new screen or perform an action upon successful login
                                                Get.snackbar('Login Succesfully', "Wow");
                                                Get.to(()=>Homepage());
                                              }
                                            } catch (e) {
                                              // Handle authentication errors here
                                              print(e.toString());
                                              Get.snackbar('Error', "Login Again");
                                            }
                                          }
                                        },
                                        borderRadius: BorderRadius.circular(30),
                                        child: const Padding(
                                          padding: EdgeInsets.symmetric(
                                            vertical: 10,
                                            horizontal: 28,
                                          ),
                                          child: Text(
                                            "Login",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),




                                  ],
                                ),
                              ),
                              SizedBox(height: 16),
                              //Don't have an account- sign up Button
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text("Don't have an Account?"),
                                  TextButton(onPressed: (){
                                    Get.to(()=> SignUpscreen());

                                  },
                                      child: const Text("Register Here",
                                        style: TextStyle(fontSize: 16),))
                                ],
                              ),
                              Text("Or",
                                style: TextStyle(fontSize: 16),),
                              //Are u Admin -Button
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  TextButton(onPressed: (){
                                    Get.to(()=>ForgotPasswordScreen());
                                  },
                                      child: const Text("Forgot Password",
                                        style: TextStyle(fontSize: 16),))
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],

                ),
              )
          );
        },

      ),

    );
  }
}
