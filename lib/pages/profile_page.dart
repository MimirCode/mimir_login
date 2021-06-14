import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfilePage extends StatelessWidget {
  // const ProfilePage({Key? key}) : super(key: key);

  final Color _primaryColor = Color(0xff5E5D8D);
  final Color _secondaryColor = Color(0xff47456D);
  final Color _borderColor = Color(0xffB2E0DA);

  late double _deviceHeight;
  late double _devicewidth;

  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _devicewidth = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: _primaryColor,
        body: Align(
          alignment: Alignment.center,
          child: Container(
            height: _deviceHeight * 0.75,
            width: _devicewidth,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _avatarWidget(),
                // SizedBox(height: _deviceHeight * 0.03),
                _userNameWidget(),
                SizedBox(height: _deviceHeight * 0.2),
                _logoutButtonWidget(context),
              ],
            ),
          ),
        ));
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

  Widget _userNameWidget() {
    return Container(
      child: Text(
        'Amir Honarmand',
        style: GoogleFonts.ubuntu(
          fontSize: 25,
          color: Colors.white60,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _logoutButtonWidget(BuildContext context) {
    return MaterialButton(
      minWidth: _devicewidth * 0.4,
      height: _deviceHeight * 0.055,
      color: Colors.white70,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      child: Text(
        'LOGOUT',
        style: GoogleFonts.ubuntu(
          color: _primaryColor,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }
}
