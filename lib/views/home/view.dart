import 'package:flutter/material.dart';
import 'package:flutter_application_2/views/home/pages/home.dart';
import 'package:flutter_application_2/views/home/pages/notifications.dart';
import 'package:flutter_application_2/views/home/pages/profile.dart';
import 'package:flutter_application_2/views/home/pages/trips.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int currentPage = 0;

  final titles = ["Home", "Trips", "Notifications", "Profile"];
  final Pages = [HomePage(), TripsPage(), NotificationsPage(), ProfilePage()];
  final icons = [
    "assets/icons/home.svg",
    "assets/icons/trips.svg",
    "assets/icons/notifications.svg",
    "assets/icons/profile.svg",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Pages[currentPage],
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(75),
          child: GNav(
            selectedIndex: currentPage,
            tabMargin: EdgeInsets.symmetric(vertical: 16),
            backgroundColor: Color(0x0D0A4AEB),
            activeColor: Colors.white,
            gap: 6,
            iconSize: 24,
            textSize: 12,

            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            tabBackgroundColor: Color(0xff1C3877),
            onTabChange: (value) {
              currentPage = value;
              setState(() {});
            },
            tabs: List.generate(
              Pages.length,
              (index) => GButton(
                icon: Icons.home,
                leading: Badge(
                  isLabelVisible: false,
                  alignment: Alignment(.4, -.9),
                  child: SvgPicture.asset(
                    index == 2 && currentPage != 2
                        ? "assets/icons/notification-dot.svg"
                        : icons[index],
                    color: currentPage == index ? Colors.white : null,
                    width: 24,
                    height: 24,
                  ),
                ),
                text: titles[index],
                margin: currentPage == 0 && index == 0
                    ? EdgeInsetsDirectional.only(start: 5)
                    : currentPage == 3 && index == 3
                    ? EdgeInsetsDirectional.only(end: 5)
                    : null,
              ),
            ),
          ),
        ),
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

/* bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 14,
        unselectedFontSize: 14,
        currentIndex: currentPage,
        onTap: (value) {
          print("nada $value");
          currentPage = value;
          setState(() {});
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: "Notifications",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
          BottomNavigationBarItem(icon: Icon(Icons.turn_right), label: "Trips"),
        ],
      ),
    );
  }
}*/
