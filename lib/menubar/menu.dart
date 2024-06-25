import 'package:flutter/material.dart';
import 'package:osm/screen/menu_screen/booking.dart';
import 'package:osm/screen/menu_screen/emergency_page.dart';
import 'package:osm/screen/menu_screen/help.dart';
import 'package:osm/screen/menu_screen/information_page.dart';
import 'package:osm/screen/menu_screen/invite_page.dart';
import 'package:osm/screen/menu_screen/notification_page.dart';
import 'package:osm/screen/menu_screen/rule.dart';
import 'package:osm/screen/menu_screen/travel.dart';
import 'package:osm/screen/menu_screen/wallet.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  final int index = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 30,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
        decoration: const BoxDecoration(color: Colors.white),
        child: Column(
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                  color:
                      const Color.fromARGB(255, 218, 214, 214).withOpacity(0.5),
                  offset: const Offset(-2, -2),
                  blurRadius: 1,
                  spreadRadius: 2,
                ),
              ], borderRadius: const BorderRadius.all(Radius.circular(50))),
              child: const Icon(
                Icons.person,
                size: 60,
              ),
            ),
            const SizedBox(height: 10),
            const Text("94911068",
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.w700)),
            const SizedBox(height: 20),
            _buildMenuRow(Icons.person_outline, 'Хувийн мэдээлэл', 1),
            const SizedBox(height: 15),
            _buildMenuRow(Icons.notifications_none_outlined, 'Мэдэгдэл', 2),
            const SizedBox(height: 15),
            _buildMenuRow(Icons.account_balance_wallet_outlined, 'Хэтэвч', 3),
            const SizedBox(height: 15),
            _buildMenuRow(Icons.credit_card_rounded, 'Карт', 4),
            const SizedBox(height: 15),
            _buildMenuRow(Icons.person_add_alt_outlined, 'Найзаа урих', 5),
            const SizedBox(height: 15),
            _buildMenuRow(
                Icons.phone_outlined, 'Яаралтай үед холбоо барих утас', 6),
            const SizedBox(height: 15),
            _buildMenuRow(Icons.travel_explore_rounded, 'Миний аялалууд', 7),
            const SizedBox(height: 15),
            _buildMenuRow(Icons.bookmark, 'Урьдчилсан захиалга, ', 8),
            const SizedBox(height: 15),
            _buildMenuRow(Icons.rule, 'Үйлчилгээний нөхцөл', 9),
            const SizedBox(height: 15),
            _buildMenuRow(Icons.help_outline, 'Тусламж', 10),
            const SizedBox(height: 15),
            const SizedBox(height: 90),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(
                  Icons.exit_to_app_rounded,
                  color: Colors.red,
                ),
                SizedBox(width: 5),
                Text(
                  "Гарах",
                  style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.w600,
                      fontSize: 16),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildMenuRow(IconData icon, String text, int index) {
    return GestureDetector(
      onTap: () {
        List<Widget> pages = [
          InformationPage(),
          NotificationPage(),
          Wallet(),
          Card(),
          InvitePage(),
          EmergencyPage(),
          Travel(),
          Booking(),
          Rule(),
          Help()
        ];

        if (index >= 1 && index <= 10) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => pages[index - 1]));
        }
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(icon, size: 24),
              const SizedBox(width: 10),
              Text(
                text,
                style: const TextStyle(fontSize: 12, color: Colors.black),
              ),
            ],
          ),
          const Icon(Icons.arrow_forward_ios, size: 13),
        ],
      ),
    );
  }
}
