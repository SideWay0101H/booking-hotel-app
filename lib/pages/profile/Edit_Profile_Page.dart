import 'package:booking_hotel_ui/core/constants/color_constrants.dart';
import 'package:booking_hotel_ui/core/utils/UserPrefenrences.dart';
import 'package:booking_hotel_ui/gen/assets.gen.dart';
import 'package:booking_hotel_ui/gen/fonts.gen.dart';
import 'package:booking_hotel_ui/model/user.dart';
import 'package:booking_hotel_ui/pages/Home/HomePage.dart';
import 'package:booking_hotel_ui/pages/profile/widgets/profile_page_widget.dart';
import 'package:booking_hotel_ui/pages/profile/widgets/textfield_widget.dart';
import 'package:booking_hotel_ui/widgets/appbar_widget.dart';
import 'package:flutter/material.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  @override
  Widget build(BuildContext context) {
    var isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    String tProfile;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(
                  builder: (context) => const HomePage(),
                ),
                (Route<dynamic> route) => false,
              );
            },
            icon: const Icon(Icons.arrow_back_ios)),
        title: Text(
          'Profile',
          style: Theme.of(context).textTheme.headline5,
          textAlign: TextAlign.center,
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(isDark ? Icons.dark_mode : Icons.sunny),
            onPressed: () {},
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                    width: 120,
                    height: 120,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Assets.image.photo.image())),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'Người đẹp và con cặc lỏ',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      fontFamily: FontFamily.roboto),
                ),
                const Text(
                  'zzzzzin841@gmail.com',
                  style: TextStyle(color: Colors.black, fontSize: 21),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: ColorPalette.primaryColor,
                      side: BorderSide.none,
                      shape: const StadiumBorder()),
                  onPressed: () {},
                  child: const Text(
                    'Edit Profile',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                const Divider(color: Colors.black12),
                const SizedBox(
                  height: 10,
                ),
                ProfileWidget(
                  title: 'Settings',
                  icon: Icons.settings,
                  onPressed: () {},
                ),
                ProfileWidget(
                  title: 'Hóa đơn chi tiết',
                  icon: Icons.wallet,
                  onPressed: () {},
                ),
                ProfileWidget(
                  title: 'Quản lý tài khoản',
                  icon: Icons.manage_accounts,
                  onPressed: () {},
                ),
                ProfileWidget(
                  title: 'Thông tin',
                  icon: Icons.info,
                  onPressed: () {},
                ),
                ProfileWidget(
                  title: 'Đăng xuất',
                  icon: Icons.logout,
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ProfileWidget extends StatelessWidget {
  const ProfileWidget({
    super.key,
    required this.title,
    required this.icon,
    required this.onPressed,
    this.endIcon = true,
    this.textColor,
  });

  final String title;
  final IconData icon;
  final VoidCallback onPressed;
  final bool endIcon;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onPressed,
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: ColorPalette.secondColor.withOpacity(0.1),
        ),
        child: Icon(icon, color: ColorPalette.secondColor),
      ),
      title: Text(title, style: Theme.of(context).textTheme.bodyText1),
      trailing:endIcon ? Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: Colors.grey.withOpacity(0.1),
        ),
        child: const Icon(
          Icons.keyboard_arrow_right,
          size: 20,
          color: Colors.grey,
        ),
      ): null,
    );
  }
}
