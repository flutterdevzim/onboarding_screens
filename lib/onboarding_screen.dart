import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'constants.dart';

class OnBoardingScreen extends StatefulWidget {
  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final kTitleStyle = TextStyle(
      color: Colors.white, fontSize: 20.0, height: 1.3, fontFamily: 'Brandon');

  final kSubtitleStyle = TextStyle(
      color: Colors.white60, fontSize: 15.0, height: 1.0, fontFamily: 'Gotham');

  final int _numPages = 3;
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < _numPages; i++) {
      list.add(i == _currentPage ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: Duration(microseconds: 150),
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      height: 3.0,
      width: isActive ? 24.0 : 16.0,
      decoration: BoxDecoration(
        color: isActive ? Colors.white : Color(0xFF707070),
        borderRadius: BorderRadius.all(Radius.circular(6)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [
                  0.3,
                  0.6,
                  0.9
                ],
                colors: [
                  Color(0xFF240B36),
                  Color(0xFF730F34),
                  Color(0xFFC31432)
                ]),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 40.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                  height: 500.0,
                  child: PageView(
                    physics: ClampingScrollPhysics(),
                    controller: _pageController,
                    onPageChanged: (int page) {
                      setState(() {
                        _currentPage = page;
                      });
                    },
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              child: Text(
                                Constants.ONBOARDING_TITLE_1,
                                style: kTitleStyle,
                              ),
                            ),
                            SizedBox(height: 30.0),
                            Text(
                              Constants.ONBOARDING_SUBTITLE_1,
                              style: kSubtitleStyle,
                            ),
                            SizedBox(height: 30.0),
                            Center(
                              child: Image(
                                image: AssetImage('images/AR-AI-1.png'),
                                height: 300.0,
                                width: 300.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              child: Text(
                                Constants.ONBOARDING_TITLE_2,
                                style: kTitleStyle,
                              ),
                            ),
                            SizedBox(height: 30.0),
                            Text(
                              Constants.ONBOARDING_SUBTITLE_2,
                              style: kSubtitleStyle,
                            ),
                            SizedBox(height: 30.0),
                            Center(
                              child: Image(
                                image: AssetImage('images/AR-AI-2.png'),
                                height: 300.0,
                                width: 300.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              child: Text(
                                Constants.ONBOARDING_TITLE_3,
                                style: kTitleStyle,
                              ),
                            ),
                            SizedBox(height: 30.0),
                            Text(
                              Constants.ONBOARDING_SUBTITLE_3,
                              style: kSubtitleStyle,
                            ),
                            SizedBox(height: 30.0),
                            Center(
                              child: Image(
                                image: AssetImage('images/AR-AI-3.png'),
                                height: 300.0,
                                width: 300.0,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: _buildPageIndicator(),
                ),
                _currentPage != _numPages - 1
                    ? Expanded(
                        child: Align(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                FlatButton(
                                  onPressed: () {
                                    _pageController.nextPage(
                                        duration: Duration(microseconds: 300),
                                        curve: Curves.easeIn);
                                  },
                                  child: Text(
                                    'Next',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18.0,
                                        fontFamily: 'Gotham'),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    : Text(''),
              ],
            ),
          ),
        ),
      ),
      bottomSheet: _currentPage == _numPages - 1
          ? SizedBox(
              height: 40.0,
              width: 50,
              child: OutlineButton(
                onPressed: () => print('get started'),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Get Started',
                        style: TextStyle(
                            color: Color(0xFFFFFFFF),
                            fontSize: 18.0,
                            fontFamily: 'Brandon'),
                      ),
                      SizedBox(width: 10.0),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: Color(0xFFFFFFFF),
                        size: 25.0,
                      )
                    ],
                  ),
                ),
              ),
            )
          : Text(''),
    );
  }
}
