import 'package:flutter/material.dart';
import 'package:medcall/screens/auth/on_boarding/widgets/on_boarding_dot_indicator.dart';
import 'package:medcall/screens/auth/on_boarding/widgets/on_boarding_next_button.dart';
import 'package:medcall/screens/auth/on_boarding/widgets/on_boarding_page.dart';
import '../../../main.dart';
import '../../../util/color.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> onboardingData = [
      {
        "title": 'Добро пожаловать',
        "description": 'Это приложение для медицинских услуг на дому',
        "image": "assets/on_boarding/onboarding1.svg"
      },
      {
        "title": 'Удобный заказ',
        "description": 'Оформляйте заявки всего за несколько кликов.',
        "image": "assets/on_boarding/onboarding2.svg"
      },
      {
        "title": 'Качественный сервис',
        "description": 'Наша команда гарантирует профессиональный подход.',
        "image": "assets/on_boarding/onboarding3.svg"
      },
    ];

    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        backgroundColor: ScreenColor.white,
        appBar: AppBar(
          backgroundColor: ScreenColor.white,
          automaticallyImplyLeading: false,

          actions: [
            TextButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/login');
              },
              child: Text(
                'Пропустить',
                style: TextStyle(fontSize: 16, color: ScreenColor.color2),
              ),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [

              /// Image and Title, SubTitle
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  physics: BouncingScrollPhysics(),
                  onPageChanged: (index) {
                    setState(() {
                      _currentPage = index;
                    });
                  },
                  itemCount: onboardingData.length,
                  itemBuilder: (context, index) => OnboardingPage(
                    title: onboardingData[index]['title']!,
                    description: onboardingData[index]['description']!,
                    image: onboardingData[index]['image']!,
                  ),
                ),
              ),
              SizedBox(height: 20),

              /// Dot Indicator
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  onboardingData.length,
                      (index) => OnBoardingDotIndicator(
                    isActive: index == _currentPage,
                  ),
                ),
              ),
              const SizedBox(height: 20),

              /// Next Button
              NextButton(
                isLastPage: _currentPage == onboardingData.length - 1,
                onNext: () {
                  if (_currentPage == onboardingData.length - 1) {
                    Navigator.pushReplacementNamed(context, '/login');
                  } else {
                    _pageController.nextPage(
                      duration: Duration(milliseconds: 300),
                      curve: Curves.ease,
                    );
                  }
                },
                buttonText: _currentPage == onboardingData.length - 1
                    ? 'Начать'
                    : 'Далее'
              ),
            ],
          ),
        ),
      ),
    );
  }
}