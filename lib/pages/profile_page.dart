import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mimir_login/pages/login_page.dart';
import 'package:mimir_login/utils/page_routes/fade_page_route.dart';
import '../utils/animations/login_page_animations.dart';

class AnimatedProfilePage extends StatefulWidget {
  // AnimatedProfilePage({Key? key}) : super(key: key);

  @override
  _AnimatedProfilePageState createState() => _AnimatedProfilePageState();
}

class _AnimatedProfilePageState extends State<AnimatedProfilePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
      reverseDuration: Duration(milliseconds: 500),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _ProfilePage(_controller);
  }
}

// ignore: must_be_immutable
class _ProfilePage extends StatelessWidget {
  // const ProfilePage({Key? key}) : super(key: key);

  final Color _primaryColor = Color(0xff5E5D8D);
  final Color _secondaryColor = Color(0xff47456D);
  final Color _borderColor = Color(0xffB2E0DA);

  late double _deviceHeight;
  late double _devicewidth;

  AnimationController _controller;
  late EnterAnimation _animation;

  _ProfilePage(this._controller) {
    _animation = EnterAnimation(_controller);
    _controller.forward();
  }

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
    return AnimatedBuilder(
        animation: _animation.controller,
        builder: (context, widget) {
          return Transform(
            alignment: Alignment.center,
            transform: Matrix4.diagonal3Values(
                _animation.circleSize.value, _animation.circleSize.value, 1),
            child: Container(
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
            ),
          );
        });
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
      onPressed: () async {
        await _controller.reverse();
        Navigator.pop(
          context,
          FadePageRoute(AnimatedLoginPage()),
        );
      },
    );
  }
}
