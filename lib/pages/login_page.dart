import 'package:flutter/material.dart';

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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _avatarWidget(),
          ],
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
}
