import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'login_screen.dart';
class SignUpscreen extends StatefulWidget {
  const SignUpscreen({super.key});

  @override
  State<SignUpscreen> createState() => _SignUpscreenState();
}
class _SignUpscreenState extends State<SignUpscreen> {
  var formkey = GlobalKey<FormState>();
  var namecontroller = TextEditingController();
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
                          "images/signup.jpg"),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(

                        decoration: BoxDecoration(
                            color: Colors.red[200],
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
                                    //name
                                    TextFormField(
                                      controller: namecontroller,
                                      validator: (val)=> val == ""? "Please write Name":null,
                                      decoration: InputDecoration(
                                          prefixIcon:const Icon(Icons.person,
                                            color: Colors.black,),
                                          hintText: "Name...",
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
                                        onTap: ()
                                          async{
                                            if(formkey.currentState!.validate()){
                                              try{
                                                UserCredential userCredential = 
                                                    await FirebaseAuth.instance.createUserWithEmailAndPassword(
                                                    email: emailcontroller.text,
                                                    password: passwordcontroller.text);
                                                if(userCredential.user!=null){
                                                  Get.snackbar('Sign In Succesfully',
                                                    'Login In ',
                                                    snackPosition: SnackPosition.TOP,
                                                  );
                                                  namecontroller.clear();
                                                  emailcontroller.clear();
                                                  passwordcontroller.clear();

                                                }
                                              }catch(e){
                                                print(e.toString());
                                                Get.snackbar('Failure Occur',
                                                'Sign In Again',
                                                snackPosition: SnackPosition.TOP,
                                                );
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
                                            "Sign Up",
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
                              const SizedBox(height: 16),
                              //Don't have an account- sign up Button
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text("Alredy have an Account?"),
                                  TextButton(onPressed: (){
                                    Get.to(()=>Loginscreen());
                                  },
                                      child: const Text("Login Here",
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
