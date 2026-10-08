import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff1c3877),
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.light,
        ),
        toolbarHeight: 120,
        title: Padding(
          padding: const EdgeInsets.only(bottom: 0),
          child: ListTile(
            contentPadding: EdgeInsets.zero,
            leading: Badge(
              backgroundColor: Color(0xff16A34A),
              alignment: Alignment(-0.85, 0.45),
              smallSize: 15,
              child: CircleAvatar(
                radius: 26,
                backgroundColor: Colors.white,
                child: ClipOval(
                  child: Image.asset(
                    "assets/images/majed_abdullah.png",
                    fit: BoxFit.cover,
                    width: 46,
                    height: 46,
                  ),
                ),
              ),
            ),
            title: Text(
              "Good morning,",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w200,
                color: Color(0xffE0E0E0),
              ),
            ),
            subtitle: Text(
              "Majed Abdullah",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Current Trip",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xff111827),
              ),
            ),
            Container(
              height: 2,
              width: 56,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xff1C3877), Color(0xffF3F5F9)],
                  stops: [.30, .90],
                ),
              ),
            ),
            SizedBox(height: 6),
            Container(
              width: double.infinity,
              height: 250,
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage("assets/images/current_trip.png"),
                ),
              ),
              child: Stack(
                children: [
                  // ================= CAR =================
                  Positioned(
                    right: -5,
                    top: 46,
                    child: Image.asset(
                      "assets/images/car.png",
                      width: 145,
                      height: 100,
                      fit: BoxFit.contain,
                    ),
                  ),

                  // ================= STATUS =================
                  Positioned(
                    left: 0,
                    top: 10,
                    child: Chip(
                      labelPadding: EdgeInsets.symmetric(
                        horizontal: 3,
                        vertical: 1,
                      ),
                      backgroundColor: Color.fromARGB(174, 203, 201, 201),
                      label: Text(
                        "IN PROGRESS",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: Color(0xff1c3877),
                        ),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(44),
                      ),
                    ),
                  ),

                  // ================= TRIP NUMBER =================
                  Positioned(
                    left: 6,
                    top: 70,
                    child: Text(
                      "TR-2051",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),

                  // ================= ROUTE ICON =================
                  Positioned(
                    left: 0,
                    top: 118,
                    child: Image.asset(
                      "assets/images/from_to_step.png",
                      height: 77,
                      width: 24,
                    ),
                  ),

                  // ================= PICKUP =================
                  Positioned(
                    left: 36,
                    top: 120,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Al Olaya, Riyadh",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 1),
                        Text(
                          "Pickup",
                          style: TextStyle(
                            fontSize: 12,
                            color: Color(0xff7f8590),
                          ),
                        ),
                      ],
                    ),
                  ),

                  // ================= DELIVERY =================
                  Positioned(
                    left: 36,
                    top: 171,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Al Rawdah, Jeddah",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 1),
                        Text(
                          "Delivery",
                          style: TextStyle(
                            fontSize: 12,
                            color: Color(0xff7f8590),
                          ),
                        ),
                      ],
                    ),
                  ),

                  // ================= VIEW DETAILS =================
                  Positioned(
                    right: 0,
                    bottom: 20,
                    child: SizedBox(
                      width: 120,
                      height: 34,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(
                            0xffB8B8B8,
                          ).withValues(alpha: .80),
                          foregroundColor: Colors.white,
                          elevation: 0,
                          padding: EdgeInsets.zero,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "View Details",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(width: 8),
                            Icon(Icons.chevron_right, size: 20),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Upcoming Trip",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff111827),
                  ),
                ),
                Container(
                  height: 2,
                  width: 56,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xff1C3877), Color(0xffF3F5F9)],
                      stops: [.30, .90],
                    ),
                  ),
                ),
                SizedBox(height: 15),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    color: Colors.white,
                    border: BorderDirectional(
                      start: BorderSide(color: Color(0xff1c3877), width: 3),
                    ),
                  ),
                  height: 200,
                  padding: EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Chip(
                            label: Text(
                              "Upcoming".toUpperCase(),
                              style: TextStyle(
                                color: Color(0xff1c3877),
                                fontSize: 10,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            padding: EdgeInsets.zero,
                            backgroundColor: Color(
                              0xff1444ae,
                            ).withValues(alpha: .1),
                            labelPadding: EdgeInsets.symmetric(
                              vertical: 4,
                              horizontal: 8,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(44),
                              side: BorderSide(color: Colors.transparent),
                            ),
                          ),
                          Spacer(),
                          Text(
                            "TR-2051",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff01031a),
                            ),
                          ),
                        ],
                      ),
                      ListTile(
                        contentPadding: EdgeInsets.zero,
                        dense: true,
                        visualDensity: VisualDensity.compact,
                        leading: Image.asset("assets/images/clint_box.jpg"),
                        title: Text("Fahad Salem"),
                        subtitle: Row(
                          children: [
                            Text(
                              "Al Aziziyah, Jeddah",
                              style: TextStyle(
                                fontSize: 12,
                                color: Color(0xff43474f),
                              ),
                            ),
                            Icon(
                              Icons.arrow_forward,
                              size: 7.5,
                              color: Color(0xff6b7280),
                            ),
                            Text(
                              "Al Malaz, Riyadh",
                              style: TextStyle(
                                fontSize: 12,
                                color: Color(0xff43474f),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        "-" * 100,
                        maxLines: 1,
                        style: TextStyle(
                          color: Color(0xff374151).withValues(alpha: .5),
                        ),
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.schedule,
                            color: Color(0xff1c3877),
                            size: 20,
                          ),
                          SizedBox(width: 6),
                          Text(
                            "ETA",
                            style: TextStyle(
                              color: Color(0xff1c3877),
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(width: 6),
                          Text(
                            "12 Aug 2026  12:00 PM",
                            style: TextStyle(
                              color: Color(0xff6f767e),
                              fontSize: 12,
                            ),
                          ),
                          Spacer(),
                          CircleAvatar(
                            backgroundColor: Color(
                              0xff14444ae,
                            ).withValues(alpha: .05),
                            child: Icon(
                              Icons.arrow_forward_ios,
                              color: Color(0xff1c3877),
                              size: 16,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
