import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:voice_verse/common/app_colors/colors.dart';
import 'package:voice_verse/common/app_component/custom_button.dart';
import 'package:voice_verse/home_screen/screen/home_screen.dart';
import 'package:voice_verse/user_profile/screen/user_profile_screen.dart';
import 'package:voice_verse/user_project/result_first_screen/user_projects.dart';
import 'package:voice_verse/voice_verse_ai_feature/ai_options.dart';

class BottomNavigationBarWidget extends StatefulWidget {
  const BottomNavigationBarWidget({
    super.key,
    this.screenIndex = 1,
    this.dataUpdated = false,
  });

  final bool? dataUpdated;
  final int? screenIndex;

  @override
  State<BottomNavigationBarWidget> createState() =>
      _BottomNavigationBarWidgetState();
}

class _BottomNavigationBarWidgetState extends State<BottomNavigationBarWidget> {
  int selectedIndex = 1;
  late bool dataIsUpdated ;
  late List<Widget> screens  ;



  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    dataIsUpdated = widget.dataUpdated ?? false ;
    screens = [
      const HomeScreen(),
      const UserProjects(),
      UserProfileScreen(dataUpdated:dataIsUpdated ), // Assuming you have imported and provided correct parameters
    ];
    if (widget.screenIndex != null) {
      selectedIndex = widget.screenIndex!;
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: backGroundColorDark,
        type: BottomNavigationBarType.fixed,
        currentIndex: selectedIndex,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white38,
        onTap: _onItemTapped,
        iconSize: 27.sp,
        selectedFontSize: 14.sp,
        unselectedFontSize: 14.sp,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: selectedIndex == 0 ?
                const Icon(Icons.home_rounded,):
                const Icon(Icons.home_outlined),
            label: 'Home',

          ),
          BottomNavigationBarItem(
            icon: selectedIndex == 1
                ? CustomButton(
                buttonRadius: 20,
                buttonHeight: 45,
                onPressed: () {
                  showModalBottomSheet<dynamic>(
                    isScrollControlled: true,
                    context: context,
                    builder: (BuildContext context) {
                      return const AiOptions();
                    },
                  );
                },
                text: "Create")
                : const Icon(Icons.add_rounded, ),
            label: selectedIndex == 1 ? "" : "Create",
          ),
          BottomNavigationBarItem(
            icon: selectedIndex == 2 ?
                const Icon(Icons.person_rounded, ):
                const Icon(Icons.person_outline_rounded),
            label: 'Profile',
          ),
        ],
      ),
      body: screens[selectedIndex],
    );
  }
}
