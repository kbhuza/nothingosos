import 'dart:io';


import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:grotree/screens/provider/google_sign_in.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> with TickerProviderStateMixin{


  late AnimationController _animationController;
  late Animation<double>  _animation;
  late TextEditingController _fullNameController = TextEditingController(text: '');
  late TextEditingController _emailTextController = TextEditingController(text: '');
  late TextEditingController _passTextController = TextEditingController(text: '');
  late TextEditingController _phoneNumberController = TextEditingController(text: '');

  FocusNode _emailFocusNode = FocusNode();
  FocusNode _passFocusNode = FocusNode();
  FocusNode _positionCPFocusNode = FocusNode();
  FocusNode _phoneNumberFocusNode = FocusNode();
  bool _obscureText = true;
  final _signUpFormKey = GlobalKey<FormState>();
  File? imageFile;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool _isLoading = false;
  String? imageUrl;


  @override
  void dispose() {
    _fullNameController.dispose();
    _emailTextController.dispose();
    _passTextController.dispose();
    _phoneNumberController.dispose();
    _emailFocusNode.dispose();
    _passFocusNode.dispose();
    _positionCPFocusNode.dispose();
    _phoneNumberFocusNode.dispose();

    super.dispose();
  }


@override
  void initState() {
  _animationController = AnimationController(vsync: this, duration: const Duration(seconds: 80));
  _animation = CurvedAnimation(parent: _animationController, curve: Curves.linear)
  ..addListener(() {
    setState(() {});
  }).. addStatusListener((animationStatus) {
    if(animationStatus == AnimationStatus.completed){
      _animationController.reset();
      _animationController.forward();
    }
    });
    super.initState();
  }





  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [

          Container(
            color: Colors.black54,
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 2),
            child: ListView(
              children: [
                GestureDetector(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40, vertical :1),
                    child: Container(
                      width: size.width * 0.2,
                      height: size.height * 0.2,
                      decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Colors.white),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(4),
                        child: imageFile == null
                             ? Icon(Icons.camera_enhance, color: Colors.blueAccent, size: 60)
                            : Image.file(imageFile!, fit: BoxFit.fill)
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                TextFormField(
                  textInputAction: TextInputAction.next,
                  onEditingComplete: () => FocusScope.of(context).requestFocus(_emailFocusNode),
                  keyboardType: TextInputType.name,
                  controller: _fullNameController,
                  validator: (value){
                    if(value!.isEmpty){
                      return "This field is incomplete!";
                    }else {
                      return null;
                    }
                  },
                  style: TextStyle(color: Colors.white),
                    decoration: const InputDecoration(
                      hintText: 'Full name/ Company name',
                      hintStyle: TextStyle(color: Colors.white54),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)
                      ),
                      errorBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.red)
                      )
                    )
                ),
                SizedBox(
                  height: 5,
                ),
                TextFormField(
                    textInputAction: TextInputAction.next,
                    onEditingComplete: () => FocusScope.of(context).requestFocus(_passFocusNode),
                    keyboardType: TextInputType.emailAddress,
                    controller: _emailTextController,
                    validator: (value){
                      if(value!.isEmpty || !value.contains("@")){
                        return "Please enter a valid email address!";
                      }else {
                        return null;
                      }
                    },
                    style: TextStyle(color: Colors.white),
                    decoration: const InputDecoration(
                        hintText: 'Email',
                        hintStyle: TextStyle(color: Colors.white54),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white)
                        ),
                        errorBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.red)
                        )
                    )
                ),
                SizedBox(
                  height: 5,
                ),
                TextFormField(
                    textInputAction: TextInputAction.next,
                    onEditingComplete: () => FocusScope.of(context).requestFocus(_phoneNumberFocusNode),
                    keyboardType: TextInputType.visiblePassword,
                    controller: _passTextController,
                    validator: (value){
                      if(value!.isEmpty || value.length < 7){
                        return "Please enter a valid Password";
                      }else {
                        return null;
                      }
                    },
                    style: TextStyle(color: Colors.white),
                    decoration:  InputDecoration(
                      suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            _obscureText = !_obscureText;
                          });
                        },
                        child: Icon(
                          _obscureText
                          ?Icons.visibility
                          : Icons.visibility_off,
                          color: Colors.white,
                        ),
                      ),
                        hintText: 'Password',
                        hintStyle: TextStyle(color: Colors.white54),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white)
                        ),
                        errorBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.red)
                        )
                    )
                ),
                SizedBox(
                  height: 5,
                ),
                TextFormField(
                    textInputAction: TextInputAction.next,
                    onEditingComplete: () => FocusScope.of(context).requestFocus(_positionCPFocusNode),
                    keyboardType: TextInputType.phone,
                    controller: _phoneNumberController,
                    validator: (value){
                      if(value!.isEmpty){
                        return "This Field is empty";
                      }else {
                        return null;
                      }
                    },
                    style: TextStyle(color: Colors.white),
                    decoration: const InputDecoration(
                        hintText: 'Phone Number',
                        hintStyle: TextStyle(color: Colors.white54),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white)
                        ),
                        errorBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.red)
                        )
                    )
                ),
                SizedBox(
                  height: 5,
                ),
                TextFormField(
                    textInputAction: TextInputAction.next,
                    onEditingComplete: () => FocusScope.of(context).requestFocus(_positionCPFocusNode),
                    keyboardType: TextInputType.text,
                    validator: (value){
                      if(value!.isEmpty){
                        return "This Field is empty";
                      }else {
                        return null;
                      }
                    },
                    style: TextStyle(color: Colors.white),
                    decoration: const InputDecoration(
                        hintText: 'Home address/Company address',
                        hintStyle: TextStyle(color: Colors.white54),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white)
                        ),
                        errorBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.red)
                        )
                    )
                ),
                SizedBox(
                  height: 15,
                ),
                _isLoading
                ? Center(
                  child: Container(
                    width: 70,
                    height: 70,
                    child: CircularProgressIndicator(),
                  ),
                ) :MaterialButton(
                  onPressed: (){},
                  color: Colors.deepPurpleAccent,
                  elevation: 6,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(13)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Sign Up with Details",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Spacer(),
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    onPrimary: Colors.black,
                    minimumSize: Size(double.infinity, 50),
                  ),
                  icon: FaIcon(FontAwesomeIcons.google, color: Colors.redAccent,),
                  label: Text('Sign Up with Google'),
                  onPressed: () {
                    final provider =
                        Provider.of<GoogleSignInProvider>(context, listen: false);
                    provider.googleLogin();
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Already have an account?',
                          style: TextStyle(color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 14)
                        ),
                        TextSpan(text: '  '),
                      TextSpan(
                           recognizer: TapGestureRecognizer()
                          ..onTap = () => Navigator.canPop(context)
                          ? Navigator.pop(context)
                          : null,
                            text: 'login here',
                            style: TextStyle(color: Colors.deepPurpleAccent,
                                fontWeight: FontWeight.bold,
                                fontSize: 14)
                        ),
                      ]
                    ),
                  ),
                )
              ],
            ),
            ),
          )
        ],
      ),
    );
  }


}
