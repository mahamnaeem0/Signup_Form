import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'login_screen.dart';
class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formKey = GlobalKey<FormState>();
    TextEditingController passCtrl=TextEditingController();
    TextEditingController confirm_passCtrl=TextEditingController();
    Size size=MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Register",
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.grey,
                ),),
              const Text("Create your account",
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.grey,
                ),),
              const SizedBox(
                height: 50,
              ),
              Form(
                  key: formKey,
                  child: Column(
                    children: [
                      SizedBox(
                        width: 350,
                        child: TextFormField(
                          validator: RequiredValidator(errorText: "Required"),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(11)
                            ),
                            labelText: "Username",
                            prefixIcon: const Icon(
                              Icons.person,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: 350,
                        child: TextFormField(
                          validator: MultiValidator([
                            RequiredValidator(errorText: "Required*"),
                            EmailValidator(errorText: "Enter a valid email*"),
                          ]),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(11)
                            ),
                            labelText: "Email",
                            prefixIcon: const Icon(
                              Icons.email,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: 350,
                        child: TextFormField(
                          controller: passCtrl,
                          validator: LengthRangeValidator(
                              min:8,max:10, errorText:"Password length should be 8-10"
                          ),
                          obscureText: true,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(11)
                            ),
                            labelText: "Password",
                            suffixIcon: const Icon(
                              Icons.remove_red_eye,
                            ),
                            prefixIcon: const Icon(
                              Icons.password,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: 350,
                        child: TextFormField(
                          controller: confirm_passCtrl,
                          validator: (value){
                            if(value!=passCtrl.value.text){
                              return "Enter same Password";
                            }
                            return null;
                          },
                          obscureText: true,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(11)
                            ),
                            labelText: "Confirm Password",
                            suffixIcon: const Icon(
                              Icons.remove_red_eye,
                            ),
                            prefixIcon: const Icon(
                              Icons.password,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      Container(
                        width: 300,
                        height: 50,
                        margin: const EdgeInsets.symmetric(horizontal: 40),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: const Color.fromARGB(255, 60, 28, 202),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50)
                            ),
                          ),
                          onPressed:(){
                            if (formKey.currentState!.validate()==true){
                              Navigator.pop(context);
                            }
                          },
                          child: const Text("Register",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Already have an account?"),
                          const SizedBox(width: 10,),
                          GestureDetector(
                              onTap: (){
                                Navigator.push(context,
                                  MaterialPageRoute(builder:(context)=>const LoginScreen()),);
                              },
                              child: const Text("Login",style: TextStyle(color: Color.fromARGB(255, 60, 28, 202),),))
                        ],
                      )
                    ],
                  )
              )
            ],
          ),
        ),
      ),
    );
  }
}