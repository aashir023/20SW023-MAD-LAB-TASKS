// import 'package:flutter/material.dart';
// import 'package:registration_page/display_data.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatefulWidget {
//   const MyApp({super.key});

//   @override
//   State<MyApp> createState() => _MyAppState();
// }

// // enum SingingCharacter { lafayette, jefferson }

// int index = 0;

// class _MyAppState extends State<MyApp> {
//   final form_key = GlobalKey<FormState>();

//   var userController = TextEditingController();
//   var emailController = TextEditingController();
//   var passController = TextEditingController();

//   // user data variables
//   String? username, email, password, gender, month, day, year;

//   final List<String> monthList = [
//     "Jan",
//     "Feb",
//     "Mar",
//     "Apr",
//     "May",
//     "Jun",
//     "Jul",
//     "Aug",
//     "Sep",
//     "Oct",
//     "Nov",
//     "Dec"
//   ];

//   List<String> days_of_month = [];

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.orange,
//       ),
//       debugShowCheckedModeBanner: false,
//       home: SafeArea(
//         child: Padding(
//           padding: EdgeInsets.all(30.0),
//           child: Material(
//             child: Form(
//                 key: form_key,
//                 child: Column(
//                   children: [
//                     Text(
//                       "Sign Up",
//                       style: TextStyle(
//                           fontSize: 50,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.orange),
//                     ),
//                     SizedBox(height: 100),
//                     createTextField(
//                         "UserName", "Enter UserName", userController),
//                     SizedBox(height: 50),
//                     createTextField("Email", "Enter Email", emailController),
//                     SizedBox(height: 50),
//                     createTextField(
//                         "Password", "Enter Password", passController),
//                     SizedBox(height: 50),
//                     Row(
//                       children: [
//                         Text("Select Gender"),
//                         SizedBox(width: 50),
//                         Radio(
//                           value: 'Male',
//                           groupValue: gender,
//                           onChanged: (value) {
//                             setState(() {
//                               gender = value.toString();
//                             });
//                           },
//                         ),
//                         Text("Male"),
//                         SizedBox(width: 50),
//                         Radio(
//                           value: 'Female',
//                           groupValue: gender,
//                           onChanged: (value) {
//                             setState(() {
//                               gender = value.toString();
//                             });
//                           },
//                         ),
//                         Text("Female"),
//                       ],
//                     ),
//                     SizedBox(
//                       height: 50,
//                     ),
//                     Row(
//                       children: [
//                         Text("Select DOB"),
//                         SizedBox(
//                           width: 30,
//                         ),
//                         DropdownButton(
//                           value: month,
//                           items: monthList
//                               .map((e) => DropdownMenuItem<String>(
//                                     child: Text(e),
//                                     value: e,
//                                   ))
//                               .toList(),
//                           onChanged: ((value) {
//                             setState(() {
//                               month = value;

//                               if (month == "Jan" ||
//                                   month == "Mar" ||
//                                   month == "May" ||
//                                   month == "Jul" ||
//                                   month == "Aug" ||
//                                   month == "Oct" ||
//                                   month == "Dec") {
//                                 days_of_month = days_in_month(31);
//                               } else if (month == "Feb") {
//                                 days_of_month = days_in_month(28);
//                               } else if (month == "Apr" ||
//                                   month == "Jun" ||
//                                   month == "Sep" ||
//                                   month == "Nov")
//                                 days_of_month = days_in_month(30);
//                             });
//                           }),
//                         ),
//                         SizedBox(
//                           width: 20,
//                         ),
//                         DropdownButton(
//                           value: day,
//                           items: days_of_month
//                               .map((e) => DropdownMenuItem<String>(
//                                     child: Text(e.toString()),
//                                     value: e,
//                                   ))
//                               .toList(),
//                           onChanged: ((value) {
//                             setState(() {
//                               day = value;
//                             });
//                           }),
//                         ),
//                         SizedBox(
//                           width: 20,
//                         ),
//                         DropdownButton(
//                           value: year,
//                           items: years()
//                               .map((e) => DropdownMenuItem<String>(
//                                     child: Text(e.toString()),
//                                     value: e,
//                                   ))
//                               .toList(),
//                           onChanged: ((value) {
//                             setState(() {
//                               year = value.toString();
//                             });
//                           }),
//                         ),
//                       ],
//                     ),
//                     SizedBox(
//                       height: 100,
//                     ),
//                     SizedBox(
//                       width: 250,
//                       height: 50,
//                       child: ElevatedButton(
//                         onPressed: () {
//                           setState(() {
//                             username = userController.text;
//                             email = emailController.text;
//                             Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                     builder: ((context) => DisplayData(
//                                         uname: username,
//                                         email: email,
//                                         day: day,
//                                         gender: gender,
//                                         mon: month,
//                                         year: year))));
//                           });
//                         },
//                         child: Text(
//                           "Submit",
//                           style: TextStyle(
//                               // fontWeight: FontWeight.bold,
//                               color: Colors.white,
//                               fontSize: 30),
//                         ),
//                         style: ElevatedButton.styleFrom(
//                             shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(50))),
//                       ),
//                     ),
//                     // Text(username.toString() + ", " + email.toString())
//                   ],
//                 )),
//           ),
//         ),
//       ),
//     );
//   }
// }

// Widget createTextField(
//     String labelText, String hintText, TextEditingController controller) {
//   return TextFormField(
//     controller: controller,
//     decoration: InputDecoration(
//       labelText: labelText,
//       hintText: hintText,
//       border: OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
//     ),
//     obscureText: (labelText == "Password") ? true : false,
//   );
// }

// List<String> days_in_month(int ndays) {
//   List<String> days_in_m = [];

//   for (int i = 1; i <= ndays; i++) {
//     days_in_m.add(i.toString());
//   }

//   return days_in_m;
// }

// List<String> years() {
//   List<String> y = [];

//   for (int i = 1990; i <= 2005; i++) {
//     y.add(i.toString());
//   }
//   return y;
// }
// // uname,email,pass,gen,dob

import 'package:flutter/material.dart';
import 'package:registration_page/display_data.dart';

void main(List<String> args) {
  runApp(RegistrationPage());
}

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({Key? key}) : super(key: key);
  @override
  State<RegistrationPage> createState() => PageState();
}

class PageState extends State<RegistrationPage> {
  String email = "", dob = "", btn = "Sign_up";

  final formKey = GlobalKey<FormState>();
  final email_controller = TextEditingController();
  final pass_controller = TextEditingController();
  final dob_controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Form(
              key: formKey,
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: "Enter email",
                      labelText: "Email",
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Email cannot be null";
                      }

                      // email = value.toString();
                    },
                    controller: email_controller,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: "Enter Password",
                      labelText: "Password",
                    ),
                    controller: pass_controller,
                    obscureText: true,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: "Enter DOB",
                      labelText: "DOB",
                    ),
                    controller: dob_controller,
                    validator: (value) {
                      // dob = value.toString();
                    },
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          btn = email_controller.text + dob_controller.text;
                          // Navigator.of(context).push(MaterialPageRoute(
                          //     builder: (context) =>
                          //         DisplayData(email: email, dob: dob)));
                        });
                      },
                      child: Text(btn))
                ],
              )),
        ),
      ),
    );
  }
}
