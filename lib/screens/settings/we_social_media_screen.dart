import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medcall/util/color.dart';
import 'package:medcall/widgets/custom_banner.dart';
import 'package:url_launcher/url_launcher.dart';


class WeSocialMedia extends StatefulWidget {
  @override
  _WeSocialMediaState createState() => _WeSocialMediaState();
}

class _WeSocialMediaState extends State<WeSocialMedia> {
  final List<SocialMedia> socialMediaList = [
    SocialMedia(
      name: 'Apple',
      url: 'https://www.apple.com',
      svgPath: 'assets/svg/apple.svg',
    ),
    SocialMedia(
      name: 'Whats App',
      url: 'https://www.whatsapp.com',
      svgPath: 'assets/svg/whatsapp.svg',
    ),
    SocialMedia(
      name: 'Telegram',
      url: 'https://www.telegram.com',
      svgPath: 'assets/svg/telegram.svg',
    ),
    SocialMedia(
      name: 'Google',
      url: 'https://www.google.com',
      svgPath: 'assets/svg/google.svg',
    ),
  ];

  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _simulateLoading();
  }

  Future<void> _simulateLoading() async {
    await Future.delayed(Duration(seconds: 2));
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _isLoading
          ? Center(child: CircularProgressIndicator(color: ScreenColor.color6,))
          : Column(
            children: [
              CustomBannerOur(title: 'Мы в социальных \nсетях', subTitle: 'Вы можете нас найти тут'),
              Expanded(
                child: ListView.builder(
                        itemCount: socialMediaList.length,
                        itemBuilder: (context, index) {
                final socialMedia = socialMediaList[index];
                return Container(
                  margin: EdgeInsets.all(10.0),
                  padding: EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    gradient: const LinearGradient(
                      colors: [ScreenColor.background, Colors.white70],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  child: ListTile(
                    splashColor: Colors.transparent,
                    leading: SvgPicture.asset(
                      socialMedia.svgPath,
                      width: 40,
                      height: 40,
                    ),
                    title: Text(socialMedia.name, style: TextStyle(fontSize: 18.0)),
                    trailing: Icon(Icons.arrow_forward_ios_sharp, color: Colors.grey, size: 14,),
                    onTap: () => _launchURL(socialMedia.url),
                  ),
                );
                        },
                      ),
              ),
            ],
          ),
    );
  }

  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}

class SocialMedia {
  final String name;
  final String url;
  final String svgPath;

  SocialMedia({required this.name, required this.url, required this.svgPath});
}
