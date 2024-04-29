import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:voice_verse/common/app_colors/colors.dart';
import 'package:voice_verse/common/app_component/custom_button.dart';
import 'package:voice_verse/create_screen.dart';
import 'package:voice_verse/home_screen/screen/home_screen.dart';
import 'package:voice_verse/user_profile/screen/user_profile_screen.dart';

class BottomNavigationBarWidget extends StatefulWidget {
  BottomNavigationBarWidget({
    Key? key,
    this.screenIndex = 1,
    this.dataUpdated = false,
  }) : super(key: key);

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
      const CreateScreen(),
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
                      return Container(
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height * 0.65, // Adjust the height as needed
                        decoration: const BoxDecoration(
                          color: backGroundColorDark,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(25),
                            topRight: Radius.circular(25),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(15),
                          child: Column(
                            children: [
                              Container(
                                width: 60,
                                height: 4,
                                decoration: BoxDecoration(
                                  color: secondColorDark,
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              const Text(
                                "Hi Abanob Naeem!",
                                style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              const Text(
                                "What are you up to today?",
                                style: TextStyle(
                                  color: Colors.white60,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                ),
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              TextFormField(
                                decoration: const InputDecoration(
                                  disabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(
                                        15,
                                      ), // Adjust the radius as needed
                                    ),
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(
                                        15,
                                      ), // Adjust the radius as needed
                                    ),
                                  ),
                                  hintText:
                                  " upload the song link to change voice",
                                  hintStyle: TextStyle(
                                    color: Colors.white60,
                                    fontSize: 15,
                                  ),
                                  suffixIcon: Icon(Icons.upload_rounded),
                                  suffixIconColor: Colors.white60,
                                ),
                                style: const TextStyle(
                                  color: Colors.white60,
                                  fontSize: 15,
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius:
                                        BorderRadius.circular(25),
                                        color: Colors.transparent,
                                        border: Border.all(
                                          color: secondColorDark,
                                        ),
                                      ),
                                      height: 200,
                                      child: const Padding(
                                        padding:
                                        EdgeInsets.only(top: 15),
                                        child: Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                          children: [
                                            Icon(
                                              Icons.male_rounded,
                                              color: Colors.white60,
                                              size: 120,
                                            ),
                                            Text(
                                              "male",
                                              style: TextStyle(
                                                color: Colors.white60,
                                                fontSize: 25,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Expanded(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius:
                                        BorderRadius.circular(25),
                                        color: Colors.transparent,
                                        border: Border.all(
                                          color: secondColorDark,
                                        ),
                                      ),
                                      height: 200,
                                      child: const Padding(
                                        padding:
                                        EdgeInsets.only(top: 15),
                                        child: Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                          children: [
                                            Icon(
                                              Icons.female_rounded,
                                              color: Colors.white60,
                                              size: 120,
                                            ),
                                            Text(
                                              "female",
                                              style: TextStyle(
                                                color: Colors.white60,
                                                fontSize: 25,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      );
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
