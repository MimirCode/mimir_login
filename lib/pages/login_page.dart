import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatelessWidget {
  //const LoginPage({Key? key}) : super(key: key);
  final Color _primaryColor = Color(0xff47456D);
  final Color _secondaryColor = Color(0xff5E5D8D);
  final Color _borderColor = Color(0xffC88B96);

  late double _deviceHeight;
  late double _deviceWidth;

  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: _primaryColor,
      body: Align(
        alignment: Alignment.center,
        child: Container(
          height: _deviceHeight * 0.75,
          width: _deviceWidth,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _avatarWidget(),
              SizedBox(height: _deviceHeight * 0.05),
              _emailTextField(),
              _pasawordTextField(),
              SizedBox(height: _deviceHeight * 0.05),
              _loginButtonWidget(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _avatarWidget() {
    double circleD = _deviceHeight * 0.25;
    return Container(
      height: circleD,
      width: circleD,
      decoration: BoxDecoration(
        border: Border.all(
          color: _borderColor,
          width: 2.0,
          style: BorderStyle.solid,
        ),
        color: _secondaryColor,
        borderRadius: BorderRadius.circular(100),
        image: DecorationImage(
          fit: BoxFit.fill,
          alignment: Alignment.center,
          image: AssetImage('assets/main_avatar.png'),
        ),
      ),
    );
  }

  Widget _emailTextField() {
    return Container(
      width: _deviceWidth * 0.7,
      child: TextField(
        style: GoogleFonts.ubuntu(color: Colors.white),
        autocorrect: false,
        cursorColor: Colors.white,
        decoration: InputDecoration(
          filled: true,
          fillColor: _secondaryColor,
          hintText: 'Enter your email',
          hintStyle: GoogleFonts.ubuntu(color: Colors.white38),
          prefixIcon: Icon(Icons.email_rounded, color: Color(0xffFFD3A4)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50),
              borderSide: BorderSide(color: Color(0xffB2E0DA))),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50),
              borderSide: BorderSide(color: Color(0xffB2E0DA))),
        ),
      ),
    );
  }

  Widget _pasawordTextField() {
    return Container(
      width: _deviceWidth * 0.7,
      child: TextField(
        style: GoogleFonts.ubuntu(color: Colors.white),
        obscuringCharacter: '*',
        obscureText: true,
        autocorrect: false,
        cursorColor: Colors.white,
        decoration: InputDecoration(
          filled: true,
          fillColor: _secondaryColor,
          hintText: 'Enter your password',
          hintStyle: GoogleFonts.ubuntu(color: Colors.white38),
          prefixIcon: Icon(Icons.password_rounded, color: Color(0xffFFD3A4)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50),
              borderSide: BorderSide(color: Color(0xffB2E0DA))),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50),
              borderSide: BorderSide(color: Color(0xffB2E0DA))),
        ),
      ),
    );
  }

  Widget _loginButtonWidget() {
    return MaterialButton(
      minWidth: _deviceWidth * 0.4,
      height: _deviceHeight * 0.055,
      color: Colors.white70,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      child: Text(
        'LOGIN',
        style: GoogleFonts.ubuntu(
          color: _primaryColor,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
      onPressed: () {},
    );
  }
}
