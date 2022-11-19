import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/utils/colors.dart';
import 'package:news_app/views/Headlines/home_page.dart';
import 'package:news_app/views/articles/discover_page.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late final PageController _controller;

  final List<Widget> pages = [
    const Homepage(),
    const Discoverpage(),
    ColoredBox(color: Colors.red.shade200),
  ];

  @override
  void initState() {
    super.initState();
    _controller = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: PageView.builder(
              controller: _controller,
              itemBuilder: (BuildContext context, int index) {
                return pages[index];
              },
            ),
          ),
          AnimatedBuilder(
            animation: _controller,
            builder: (BuildContext context, Widget? child) {
              return _BottomNav(
                currentTab: _controller.hasClients //
                    ? (_controller.page?.round() ?? 0)
                    : 0,
                onTabTapped: (int index) {
                  setState(() {
                    _controller.animateToPage(
                      index,
                      curve: Curves.ease,
                      duration: const Duration(milliseconds: 300),
                    );
                  });
                },
              );
            },
          ),
        ],
      ),
    );
  }
}

@immutable
class _BottomNav extends StatelessWidget {
  const _BottomNav({
    super.key,
    required this.currentTab,
    required this.onTabTapped,
  });

  final int currentTab;
  final ValueChanged<int> onTabTapped;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black54,
            offset: Offset(0.0, -2.0),
            blurRadius: 4.0,
          )
        ],
      ),
      child: SizedBox(
        height: 64.0,
        child: IconTheme.merge(
          data: const IconThemeData(color: AppColors.darkgrey),
          child: Material(
            color: Colors.white,
            child: Row(
              children: [
                _BottomNavButton(
                  onTap: () => onTabTapped(0),
                  selected: currentTab == 0,
                  icon: CupertinoIcons.home,
                ),
                _BottomNavButton(
                  onTap: () => onTabTapped(1),
                  selected: currentTab == 1,
                  icon: CupertinoIcons.search,
                ),
                _BottomNavButton(
                  onTap: () => onTabTapped(2),
                  selected: currentTab == 2,
                  icon: Icons.person_outline_outlined,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

@immutable
class _BottomNavButton extends StatelessWidget {
  const _BottomNavButton({
    super.key,
    required this.onTap,
    required this.selected,
    required this.icon,
  });

  final GestureTapCallback onTap;
  final bool selected;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Center(
          child: AnimatedScale(
            scale: selected ? 1.5 : 1.0,
            duration: const Duration(milliseconds: 250),
            child: Icon(
              icon,
              color: (selected ? Colors.blue : null),
            ),
          ),
        ),
      ),
    );
  }
}
