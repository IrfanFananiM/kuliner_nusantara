// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:kuliner_nusantara/screen/homepage.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  final int _numbPages = 3;
  final PageController _pageController = PageController(initialPage: 0);
  late int _currentPage = 0;

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      height: 10.0,
      width: isActive ? 24.0 : 14.0,
      decoration: BoxDecoration(
        color: isActive ? Colors.green : Colors.green[900],
        borderRadius: const BorderRadius.all(Radius.circular(12))
      ),
    );
  }

  List<Widget> _builPageIndicator() {
    List<Widget> list = [];
    for (int i =0; i< _numbPages; i++) {
      list.add(i == _currentPage ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.only(top: 10.0),
                alignment: Alignment.centerRight,
                child: FlatButton(
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const Homepage()));
                    // Get.off(Homepage());
                  },
                  child: const Text(
                    'Lewati',
                    style: TextStyle(
                      color: Colors.green,
                      fontSize: 18
                    ),
                  )
                ),
              ),
              SizedBox(
                height: 600.0,
                child: PageView(
                  physics: const ClampingScrollPhysics(),
                  controller: _pageController,
                  onPageChanged: (int page) {
                    setState(() {
                      _currentPage = page;
                    });
                  },
                  children: <Widget>[
                    Padding(
                      padding : const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:  const<Widget>[
                          Center(
                            child: Image(
                              height: 300.0,
                              width: 300.0,
                              image: AssetImage('assets/images/onboarding-1.png'),
                            ),
                          ),
                          SizedBox(height: 30.0,),
                          Center(
                            child: Text(
                              'Jelajah Dengan Jari Anda',
                              style:  TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 30.0
                              ),
                            ),
                          ),
                          SizedBox(height: 10.0,),
                          Center(
                            child: Text(
                              'Cari informasi dengan mudah dengan genggaman jari anda. Cocok untuk menambah referensi kuliner nusantara.',
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                fontSize: 16.0
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const <Widget>[
                          Center(
                            child: Image(
                              height: 300.0,
                              width: 300.0,
                              image: AssetImage('assets/images/onboarding-2.png'),
                            )
                          ),
                          SizedBox(height: 20.0,),
                          Center(
                            child: Text(
                              'Menikmati Hidangan Otentik',
                              style:  TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 26.0
                              ),
                            ),
                          ),
                          SizedBox(height: 10.0,),
                          Center(
                            child: Text(
                              'Nikmati keberagaman resep Nusantara dengan ciri khas daerah Indonesia. Mulai dari Sabang hingga Merauke.',
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                fontSize: 16.0
                              )
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const <Widget>[
                          Center(
                            child: Image(
                              height: 300.0,
                              width: 300.0,
                              image: AssetImage('assets/images/onboarding-3.png'),
                            )
                          ),
                          SizedBox(height: 20.0,),
                          Center(
                            child: Text(
                              'Bahan Resep Pilihan',
                              style:  TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 30.0
                              ),
                            ),
                          ),
                          SizedBox(height: 10.0,),
                          Center(
                            child: Text(
                              'Bahana Bahan pilihan dengan kualitas otentik demi menjaga kualitas masakan nusantara.',
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                fontSize: 16.0
                              )
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: _builPageIndicator(),
              ),
              _currentPage != _numbPages - 1
                ? Expanded(
                  child: Align(
                    alignment: FractionalOffset.bottomRight,
                    child: FlatButton(
                      onPressed: () {
                        _pageController.nextPage(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.ease
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: const <Widget>[
                            Text(
                              'Selanjutnya',
                              style: TextStyle(
                                color: Colors.green,
                                fontSize: 18.0
                              ),
                            ),
                            SizedBox(height: 10.0),
                            // Icon(
                            //   Icons.arrow_forward,
                            //   color: Colors.blue,
                            //   size: 30.0,
                            // )
                          ],
                        ),
                      ),
                    ),
                  )
                )
              : const Text(''),
            ]
          ),
        ),
      ),
      bottomSheet: _currentPage == _numbPages -1
        ? Container(
          color: Colors.white,
          width: double.infinity,
          padding: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
          child: RaisedButton(
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => const Homepage()));
              // Get.off(Homepage());
            },
            padding: const EdgeInsets.all(12.0),
            color: Colors.green,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
            child: const Text(
          'MULAI SEKARANG',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 16.0
          ),
          ),
          ),
        )
      : const Text('')
    );
  }
}