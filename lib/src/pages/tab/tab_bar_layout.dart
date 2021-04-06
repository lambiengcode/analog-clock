import 'package:analog_clock/src/pages/bedtime/bed_time_page.dart';
import 'package:analog_clock/src/pages/home/home_screen.dart';
import 'package:analog_clock/src/public/constants.dart';
import 'package:flutter/material.dart';

class TabBarLayout extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _TabBarLayoutState();
}

class _TabBarLayoutState extends State<TabBarLayout>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  var _pages = [
    HomePage(),
    HomePage(),
    BedTimePage(),
    HomePage(),
    HomePage(),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(
      vsync: this,
      length: _pages.length,
      initialIndex: 0,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            SizedBox(height: height / 25.0),
            _buildTopBar(context),
            SizedBox(height: 16.0),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: _pages.map((Widget tab) {
                  return tab;
                }).toList(),
              ),
            ),
          ],
        ),
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
            size: width / 14.0,
          ),
        ),
        Tab(
          icon: Icon(
            Icons.watch_later_outlined,
            size: width / 14.0,
          ),
        ),
        Tab(
          icon: Icon(
            Icons.king_bed,
            size: width / 14.0,
          ),
        ),
        Tab(
          icon: Icon(
            Icons.today,
            size: width / 14.0,
          ),
        ),
        Tab(
          icon: Icon(
            Icons.alarm_add,
            size: width / 14.0,
          ),
        ),
      ],
    );
  }
}
