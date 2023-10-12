// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:analog_clock/src/pages/alarm/alarm_page.dart';
import 'package:analog_clock/src/pages/bedtime/bed_time_page.dart';
import 'package:analog_clock/src/pages/countdown/count_down_page.dart';
import 'package:analog_clock/src/pages/global/global_page.dart';
import 'package:analog_clock/src/pages/stopwatch/stop_watch_page.dart';
import 'package:analog_clock/src/public/constants.dart';
import 'package:analog_clock/src/public/size_config.dart';

class TabBarLayout extends StatefulWidget {
  const TabBarLayout({super.key});

  @override
  State<StatefulWidget> createState() => _TabBarLayoutState();
}

class _TabBarLayoutState extends State<TabBarLayout>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final _pages = [
    const AlarmPage(),
    const GlobalPage(),
    const BedTimePage(),
    const StopWatchPage(),
    const CountDownPage(),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      vsync: this,
      length: _pages.length,
    );
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: height / 20.0),
          _buildTopBar(context),
          const SizedBox(height: 16.0),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: _pages.map((tab) {
                return tab;
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTopBar(context) {
    return TabBar(
      controller: _tabController,
      labelColor: Theme.of(context).primaryColor,
      indicatorColor: Colors.transparent,
      unselectedLabelColor: Theme.of(context).iconTheme.color,
      indicatorSize: TabBarIndicatorSize.tab,
      indicatorWeight: .1,
      labelStyle: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: width / 14.0,
        fontFamily: 'Raleway-Bold',
      ),
      unselectedLabelStyle: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: width / 14.0,
        fontFamily: 'Raleway-Bold',
      ),
      tabs: [
        Tab(
          icon: Icon(
            Icons.alarm,
            size: width / 15.0,
          ),
        ),
        Tab(
          icon: Icon(
            Icons.watch_later_outlined,
            size: width / 15.0,
          ),
        ),
        Tab(
          icon: Icon(
            Icons.king_bed_outlined,
            size: width / 15.0,
          ),
        ),
        Tab(
          icon: Icon(
            Icons.alarm_on_outlined,
            size: width / 15.0,
          ),
        ),
        Tab(
          icon: Icon(
            Icons.hourglass_empty_sharp,
            size: width / 15.0,
          ),
        ),
      ],
    );
  }
}
