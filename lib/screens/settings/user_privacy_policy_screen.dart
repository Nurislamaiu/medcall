import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:medcall/util/color.dart';
import 'package:medcall/widgets/custom_banner.dart';

class UserPrivacyPolicyScreen extends StatefulWidget {
  @override
  _UserPrivacyPolicyScreenState createState() => _UserPrivacyPolicyScreenState();
}

class _UserPrivacyPolicyScreenState extends State<UserPrivacyPolicyScreen> {
  String userAgreement = "";

  @override
  void initState() {
    super.initState();
    _loadUserAgreement();
  }

  Future<void> _loadUserAgreement() async {
    final String agreementText = await rootBundle.loadString('assets/user_privacy_policy.txt');
    setState(() {
      userAgreement = agreementText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: userAgreement.isEmpty
          ? Center(child: CircularProgressIndicator(color: ScreenColor.color6))
          : Column(
            children: [
              CustomBannerOur(title: 'ПОЛИТИКА \nКонфиденциальности', subTitle: 'Прочитайте'),
              Expanded(
                child: SingleChildScrollView(
                        padding: EdgeInsets.all(16.0),
                        child: Text(userAgreement),
                      ),
              ),
            ],
          ),
    );
  }
}
