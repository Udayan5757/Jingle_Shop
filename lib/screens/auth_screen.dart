import 'package:flutter/material.dart';
import '../services/auth_service.dart';
import '../common/widgets/custom_textfield.dart';

enum Auth {
  signin,
  signup,
}


class AuthScreen extends StatefulWidget {
  static const String routeName = '/auth-screen';
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  Auth _auth = Auth.signin;
  bool signInLoader = false;
  final _signUpFormKey = GlobalKey<FormState>();
  final _signInFormKey = GlobalKey<FormState>();
  final AuthService authService = AuthService();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _nameController.dispose();
    _passwordController.dispose();
  }

  void signUpUser() async {
    authService.signUpUser(
        context: context,
        email: _emailController.value.text,
        name: _nameController.value.text,
        password: _passwordController.value.text);
  }

  void signInUser() async {
    authService.signInUser(
        context: context,
        email: _emailController.value.text,
        password: _passwordController.value.text);
    setState(() {
      signInLoader = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;
    return Scaffold(
    
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        reverse: true,
        child: Container(
          child: Column(children: <Widget>[
            Container(
              height: 300,
              //child: Image.asset('assets/images/background.png', fit: BoxFit.cover,),
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/background.png'),
                    fit: BoxFit.fill),
              ),
              child: Stack(
                children: [
                  Positioned(
                    left: 30,
                    width: 80,
                    height: 200,
                    child: Container(
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/images/light-1.png')),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 140,
                    width: 80,
                    height: 150,
                    child: Container(
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/images/light-2.png')),
                      ),
                    ),
                  ),
                  Positioned(
                    right: 40,
                    top: 40,
                    width: 80,
                    height: 150,
                    child: Container(
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/images/clock.png')),
                      ),
                    ),
                  ),
                  Positioned(
                    child: Container(
                      margin: const EdgeInsets.only(top: 90),
                      child:  Center(
                          child: _auth == Auth.signin ? const Text(
                        "Login",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 40,
                            fontWeight: FontWeight.bold),
                      ): const Text(
                        "Signup",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 40,
                            fontWeight: FontWeight.bold),
                      )),
                    ),
                  )
                ],
              ),
            ),
            if (_auth == Auth.signin)
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Column(children: [
                  Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: const [
                        BoxShadow(
                          color: Color.fromRGBO(143, 148, 251, .2),
                          blurRadius: 20.0,
                          offset: Offset(0, 10),
                        ),
                      ],
                    ),
                    child: Form(
                      key: _signInFormKey,
                      child: Column(children: [
                        // Container(
                        //   padding: const EdgeInsets.all(8),
                        //   decoration: BoxDecoration(
                        //       border: Border(
                        //           bottom: BorderSide(color: Colors.grey[100]!))),
                        //   child: TextField(
                        //     decoration: InputDecoration(
                        //         border: InputBorder.none,
                        //         hintText: "Email or Phone number",
                        //         hintStyle: TextStyle(color: Colors.grey[400])),
                        //   ),
                        // ),
                    
                        CustomTextField(
                            controller: _emailController, hintText: 'Email'),
                        const Divider(
                          height: 10,
                        ),
                        CustomTextField(
                            controller: _passwordController, hintText: 'Password')
                      ]),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  signInLoader == false
                      ? InkWell(
                          child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              gradient: const LinearGradient(
                                colors: [
                                  Color.fromRGBO(143, 148, 251, 1),
                                  Color.fromRGBO(143, 148, 251, .6),
                                ],
                              ),
                            ),
                            child: const Center(
                                child: Text(
                              "Login",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            )),
                          ),
                          onTap: () {
                            if (_signInFormKey.currentState!.validate()) {
                              signInUser();
                            }
                          })
                      : Image.asset(
                          'assets/images/loading.jpg',
                          height: 45,
                          width: 45,
                        ),
                  const SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    child: const Text(
                      "Create Account",
                      style: TextStyle(
                        color: Color.fromRGBO(143, 148, 251, 1),
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        _auth = Auth.signup;
                      });
                    },
                  ),
                ]),
              ),
            if (_auth == Auth.signup)
              Padding(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom + 10,
                    left: 30,
                    right: 30,
                    top: 30),
                child: Column(children: [
                  Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: const [
                        BoxShadow(
                          color: Color.fromRGBO(143, 148, 251, .2),
                          blurRadius: 20.0,
                          offset: Offset(0, 10),
                        ),
                      ],
                    ),
                    child: Form(
                      key: _signUpFormKey,
                      child: Column(children: [
                        // Container(
                        //   padding: const EdgeInsets.all(8),
                        //   decoration: BoxDecoration(
                        //       border: Border(
                        //           bottom: BorderSide(color: Colors.grey[100]!))),
                        //   child: TextField(
                        //     decoration: InputDecoration(
                        //         border: InputBorder.none,
                        //         hintText: "Email or Phone number",
                        //         hintStyle: TextStyle(color: Colors.grey[400])),
                        //   ),
                        // ),
                        CustomTextField(
                            controller: _nameController, hintText: 'Name'),
                        const Divider(
                          height: 10,
                        ),
                        CustomTextField(
                            controller: _emailController, hintText: 'Email'),
                        const Divider(
                          height: 10,
                        ),
                        CustomTextField(
                            controller: _passwordController, hintText: 'Password')
                      ]),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: const LinearGradient(
                        colors: [
                          Color.fromRGBO(143, 148, 251, 1),
                          Color.fromRGBO(143, 148, 251, .6),
                        ],
                      ),
                    ),
                    child: InkWell(
                      child: const Center(
                          child: Text(
                        "SignUp",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      )),
                      onTap: () {
                        FocusScope.of(context).unfocus();
                        final myFuture = Future(() {
                          if (_signUpFormKey.currentState!.validate()) {
                            signUpUser();
                          }
                          return true;
                        });
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  InkWell(
                    child: const Text(
                      "Login",
                      style: TextStyle(
                        color: Color.fromRGBO(143, 148, 251, 1),
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        _auth = Auth.signin;
                      });
                    },
                  ),
                  // InkWell(
                  //   child: const Text(
                  //     "Create Account",
                  //     style: TextStyle(
                  //       color: Color.fromRGBO(143, 148, 251, 1),
                  //     ),
                  //   ),
                  //   onTap: () {},
                  // ),
                ]),
              ),
          ]),
        ),
      ),
    );
  }
}
// class AuthScreen extends StatefulWidget {
//   static const String routeName = '/auth-screen';
//   const AuthScreen({Key? key}) : super(key: key);

//   @override
//   State<AuthScreen> createState() => _AuthScreenState();
// }

// class _AuthScreenState extends State<AuthScreen> {
//   Auth _auth = Auth.signup;
//   bool signInLoader = false;
//   final _signUpFormKey = GlobalKey<FormState>();
//   final _signInFormKey = GlobalKey<FormState>();
//   final AuthService authService = AuthService();
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//   final TextEditingController _nameController = TextEditingController();
//   @override
//   void dispose() {
//     super.dispose();
//     _emailController.dispose();
//     _nameController.dispose();
//     _passwordController.dispose();
//   }

//   void signUpUser() async {
//     authService.signUpUser(
//         context: context,
//         email: _emailController.value.text,
//         name: _nameController.value.text,
//         password: _passwordController.value.text);
//   }

//   void signInUser() async {
//     authService.signInUser(
//         context: context,
//         email: _emailController.value.text,
//         password: _passwordController.value.text);
//     setState(() {
//       signInLoader = true;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       backgroundColor: GlobalVariables.greyBackgroundCOlor,
//       body: SafeArea(
//           child: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             const Text(
//               'Welcome',
//               style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
//             ),
//             ListTile(
//               tileColor: _auth == Auth.signup
//                   ? GlobalVariables.backgroundColor
//                   : GlobalVariables.greyBackgroundCOlor,
//               title: const Text(
//                 'Create Account',
//                 style: TextStyle(fontWeight: FontWeight.bold),
//               ),
//               leading: Radio(
//                   activeColor: GlobalVariables.secondaryColor,
//                   value: Auth.signup,
//                   groupValue: _auth,
//                   onChanged: (Auth? val) {
//                     setState(() {
//                       _auth = val!;
//                     });
//                   }),
//             ),
//             if (_auth == Auth.signup)
//               Container(
//                 padding: const EdgeInsets.all(4.0),
//                 color: GlobalVariables.backgroundColor,
//                 child: Form(
//                   key: _signUpFormKey,
//                   child: Column(
//                     children: <Widget>[
//                       CustomTextField(
//                         controller: _nameController,
//                         hintText: 'Name',
//                       ),
//                       const SizedBox(
//                         height: 10,
//                       ),
//                       CustomTextField(
//                         controller: _emailController,
//                         hintText: 'Email',
//                       ),
//                       const SizedBox(
//                         height: 10,
//                       ),
//                       CustomTextField(
//                         controller: _passwordController,
//                         hintText: 'password',
//                       ),
//                       const SizedBox(
//                         height: 10,
//                       ),
//                       CustomButton(
//                           text: 'Sign Up',
//                           onTap: () {
//                             FocusScope.of(context).unfocus();
//                             final myFuture = Future(() {
//                               if (_signUpFormKey.currentState!.validate()) {
//                                 signUpUser();
//                               }
//                               return true;
//                             });
//                           }),
//                     ],
//                   ),
//                 ),
//               ),
//             ListTile(
//               tileColor: _auth == Auth.signin
//                   ? GlobalVariables.backgroundColor
//                   : GlobalVariables.greyBackgroundCOlor,
//               title: const Text(
//                 'Sign-In.',
//                 style: TextStyle(fontWeight: FontWeight.bold),
//               ),
//               leading: Radio(
//                   activeColor: GlobalVariables.secondaryColor,
//                   value: Auth.signin,
//                   groupValue: _auth,
//                   onChanged: (Auth? val) {
//                     setState(() {
//                       _auth = val!;
//                     });
//                   }),
//             ),
//             if (_auth == Auth.signin)
//               Container(
//                 padding: const EdgeInsets.all(4.0),
//                 color: GlobalVariables.backgroundColor,
//                 child: Form(
//                   key: _signInFormKey,
//                   child: Column(
//                     children: <Widget>[
//                       CustomTextField(
//                         controller: _emailController,
//                         hintText: 'Email',
//                       ),
//                       const SizedBox(
//                         height: 10,
//                       ),
//                       CustomTextField(
//                         controller: _passwordController,
//                         hintText: 'password',
//                       ),
//                       const SizedBox(
//                         height: 10,
//                       ),
// signInLoader == false
//     ? CustomButton(
//         text: 'Sign In',
// onTap: () {
//   if (_signInFormKey.currentState!.validate()) {
//     signInUser();
//   }
// })
//     : Image.asset(
//         'assets/images/loading.jpg',
//         height: 45,
//         width: 45,
//       ),
//                     ],
//                   ),
//                 ),
//               ),
//           ],
//         ),
//       )),
//     );
//   }
// }