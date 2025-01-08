import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:medcall/widgets/custom_banner.dart';
import '../../util/color.dart';


class UserSettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomBannerOur(title: 'Настройка', subTitle: 'Вы можете \nнастроить параметры.'),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              children: [
                _buildCard(
                  context,
                  icon: Icons.work_outline,
                  colorAvatar: Colors.white,
                  colorIcon: const Color(0xFFFFD700),
                  gradient: const LinearGradient(
                    colors: [Color(0xFFFFD700), Colors.white],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  title: "Хочу работать на эту компанию",
                  onTap: () async {},
                ),
                _buildCard(
                  context,
                  icon: Iconsax.edit,
                  gradient: const LinearGradient(
                    colors: [ScreenColor.background, Colors.white70],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  title: "Редактирование профиля",
                  onTap: () {
                    // Логика для открытия страницы редактирования профиля
                    Navigator.pushNamed(context, '/profile-edit');
                  },
                ),
                _buildCard(
                  context,
                  icon: Icons.language,
                  gradient: const LinearGradient(
                    colors: [ScreenColor.background, Colors.white70],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  title: "Язык",
                  onTap: () {
                  },
                ),
                _buildCard(
                  context,
                  icon: Iconsax.people,
                  gradient: const LinearGradient(
                    colors: [ScreenColor.background, Colors.white70],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  title: "Пользовательское соглашение",
                  onTap: () {
                    // Логика для открытия страницы пользовательского соглашения
                    Navigator.pushNamed(context, '/agreement');
                  },
                ),
                _buildCard(
                  context,
                  icon: Iconsax.shield,
                  gradient: const LinearGradient(
                    colors: [ScreenColor.background, Colors.white70],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  title: "Политика конфиденциальности",
                  onTap: () {
                    // Логика для открытия страницы политики конфиденциальности
                    Navigator.pushNamed(context, '/privacy-policy');
                  },
                ),
                _buildCard(
                  context,
                  icon: Iconsax.share,
                  gradient: const LinearGradient(
                    colors: [ScreenColor.background, Colors.white70],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  title: "Мы в социальных сетях",
                  onTap: () {
                    // Логика для открытия страницы социальных сетей
                    Navigator.pushNamed(context, '/we-social-media');
                  },
                ),
                _buildCard(
                  context,
                  icon: Iconsax.info_circle,
                  gradient: const LinearGradient(
                    colors: [ScreenColor.background, Colors.white70],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  title: "О команде",
                  onTap: () {
                    // Логика для открытия страницы "О команде"
                    Navigator.pushNamed(context, '/team');
                  },
                ),
                _buildCard(
                  context,
                  icon: Icons.exit_to_app,
                  gradient: const LinearGradient(
                    colors: [ScreenColor.background, Colors.white70],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  title: "Выйти",
                  onTap: () async {
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCard(BuildContext context,
      {required IconData icon,
      Color? colorAvatar = ScreenColor.color6,
      Color? colorIcon = Colors.white,
      required Gradient? gradient,
      required String title,
      required VoidCallback onTap}) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        gradient: gradient,
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(15),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Row(
            children: [
              CircleAvatar(
                backgroundColor: colorAvatar,
                child: Icon(
                  icon,
                  color: colorIcon,
                ),
              ),
              const SizedBox(width: 15),
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
              ),
              const Icon(Icons.arrow_forward_ios, color: Colors.grey, size: 14),
            ],
          ),
        ),
      ),
    );
  }

}
