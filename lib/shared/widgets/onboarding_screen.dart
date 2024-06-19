import 'package:bykefastgo/presentation/screens/auth/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'intro_screens/intro_page_1.dart';
import 'intro_screens/intro_page_2.dart';
import 'intro_screens/intro_page_3.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  //Controller
  PageController _controller = PageController();

  //Last page indicator
  bool onLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        PageView(
          controller: _controller,
          onPageChanged: (index) {
            setState(() {
              onLastPage = (index == 2);
            });
          },
          children: [
            IntroPage1(),
            IntroPage2(),
            IntroPage3(),
          ],
        ),

        //dot
        Container(
          alignment: Alignment(0, 0.8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              //skip button
              GestureDetector(
                onTap: (){
                  _controller.jumpToPage(2);
                },
                child: Text('Saltar')),

              //Dot indicator
              SmoothPageIndicator(controller: _controller, count: 3),

              //next or done button
              onLastPage ?
              GestureDetector(
                  onTap: () {
                   Navigator.push(context,
                   MaterialPageRoute(builder: (context){
                    return LoginScreen();
                   }));
                  },
                  child: Text('Terminado')):
                  GestureDetector(
                  onTap: () {
                    _controller.nextPage(
                        duration: Duration(milliseconds: 500),
                        curve: Curves.easeIn);
                  },
                  child: Text('Siguiente')),
            ],
          ),
        )
      ],
    ));
  }
}
