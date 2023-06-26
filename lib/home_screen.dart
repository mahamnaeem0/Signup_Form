import 'package:flutter/material.dart';
class HomeScreen extends StatelessWidget {
  HomeScreen({super.key,
    required this.name});
  String name;
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Scaffold(
        body: Container(
          height: size.height,
          width: size.width,
          color: const Color.fromARGB(255, 60, 28, 202),
          padding: const EdgeInsets.only(left:10,right: 10) ,
          child: Column(
            children: [
             const SizedBox(height:15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Login App",
                    style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  CircleAvatar(
                      radius: 18.0,
                      child: GestureDetector(
                          onTap: (){
                            Navigator.pop(context);
                          },
                          child: const Icon(Icons.logout)
                      )
                  ),
                ],
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Welcome $name"),
                    const Text("Flutter",
                      style: TextStyle(
                        fontSize: 40,
                      ),),
                  ],
                ),
              ),

            ],
          ),
        )
    );
  }
}