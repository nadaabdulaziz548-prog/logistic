import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({super.key});

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  final list = [
    NotificationModle(
      title: "New Trip Assigned",
      body: "You have been assigned a new trip\nTR-2060.",
      time: "10:30 AM",
      type: NotificationType.newTrip,
      isReaded: false,
    ),
    NotificationModle(
      title: "Trip Cancelled",
      body:
          "Trip TR-2050 has been cancelled.\nPlease check your assigned trips.",
      time: "09:15 AM",
      type: NotificationType.tripCancelled,
      isReaded: false,
    ),
    NotificationModle(
      title: "Trip Update",
      body: "Trip TR-2050 status updated to In\nTransit.",
      time: "07:00 AM",
      type: NotificationType.tripUpdate,
      isReaded: false,
    ),
    NotificationModle(
      title: "Location Sharing",
      body: "Your location is being shared\nsuccessfully.",
      time: "Yesterday",
      type: NotificationType.location,
      isReaded: true,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.light,
        ),
        toolbarHeight: 84,
        title: Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: Text(
            "Notifications",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            color: Color(0xff1c3877),
            gradient: LinearGradient(
              colors: [Color(0xff1c3877), Color(0x991c3877)],
              begin: AlignmentDirectional.topCenter,
              end: AlignmentDirectional.bottomCenter,
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: DefaultTabController(
          length: 3,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                    vertical: 4.5,
                    horizontal: 15.5,
                  ),
                  height: 45,
                  decoration: BoxDecoration(
                    color: Color(0xff0A4AEB).withValues(alpha: .08),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: TabBar(
                    tabs: [Text("All"), Text("Unread"), Text("read")],
                    labelColor: Colors.white,
                    unselectedLabelColor: Color(0xff1c3877),
                    dividerHeight: 0,
                    indicatorSize: TabBarIndicatorSize.tab,
                    indicator: BoxDecoration(
                      color: Color(0xff1c3877),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                Expanded(
                  child: TabBarView(
                    children: [
                      Container(
                        child: ListView.separated(
                          padding: EdgeInsetsDirectional.only(
                            bottom: 16,
                            top: 24,
                          ),
                          separatorBuilder: (context, index) =>
                              SizedBox(height: 16),
                          itemBuilder: (context, index) =>
                              _Item(model: list[index]),
                          itemCount: list.length,
                        ),
                      ),
                      Container(color: Colors.blue),
                      Container(color: Colors.red),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Item extends StatefulWidget {
  final NotificationModle model;
  const _Item({super.key, required this.model});

  @override
  State<_Item> createState() => _ItemState();
}

class _ItemState extends State<_Item> {
  String get iconName {
    switch (widget.model.type) {
      case NotificationType.newTrip:
        return "assets/icons/new trip assigned.svg";
      case NotificationType.tripCancelled:
        return "assets/icons/trip cancelled.svg";
      case NotificationType.tripUpdate:
        return "assets/icons/trip update.svg";
      case NotificationType.location:
        return "assets/icons/location sharing.svg";
    }
  }

  int get iconBGColor {
    switch (widget.model.type) {
      case NotificationType.newTrip:
        return 0xffEFF6FF;
      case NotificationType.tripCancelled:
        return 0xffF8FDF4;
      case NotificationType.tripUpdate:
        return 0xffFFF7ED;
      case NotificationType.location:
        return 0xffFAF5FF;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.all(16),
      tileColor: Colors.white,
      onTap: () {
        widget.model.isReaded = true;
        setState(() {});
      },
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      leading: CircleAvatar(
        radius: 24,
        backgroundColor: Color(iconBGColor),
        child: SvgPicture.asset(
          iconName,
          height: 18,
          width: 22.5,
          fit: BoxFit.scaleDown,
        ),
      ),
      title: Row(
        children: [
          Text(
            widget.model.title,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: Color(0xff1c3877),
            ),
          ),
          Spacer(),
          Text(
            widget.model.time,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: Color(0xff718096),
            ),
          ),
          SizedBox(width: 8),
          if (!widget.model.isReaded)
            CircleAvatar(radius: 4, backgroundColor: Color(0xff2b6cb0)),
        ],
      ),
      subtitle: Text(
        widget.model.body,
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: Color(0xff718096),
        ),
      ),
    );
  }
}

class NotificationModle {
  final String title, body, time;
  final NotificationType type;
  bool isReaded;

  NotificationModle({
    required this.title,
    required this.body,
    required this.time,
    required this.type,
    this.isReaded = true,
  });
}

enum NotificationType { newTrip, tripCancelled, tripUpdate, location }
