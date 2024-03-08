import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:voice_verse/common/app_colors/colors.dart';
import 'package:voice_verse/common/app_component/custom_button.dart';
import 'package:voice_verse/create_screen.dart';
import 'package:voice_verse/home_screen.dart';
import 'package:voice_verse/user_profile_screen.dart';

class BottomNavigationBarWidget extends StatefulWidget {
  const BottomNavigationBarWidget({Key? key,
    required String token
  }) : super(key: key);

  @override
  State<BottomNavigationBarWidget> createState() =>
      _BottomNavigationBarWidgetState();
}

class _BottomNavigationBarWidgetState extends State<BottomNavigationBarWidget> {
  int _selectedIndex = 1;

  List<Widget> screens = [
    const HomeScreen(),
    const CreateScreen(),
    const SettingsScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: backGroundColorDark,
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        unselectedItemColor: secondColorDark,
        onTap: _onItemTapped,
        iconSize: 30,
        selectedFontSize: 15,
        unselectedFontSize: 15,
        items: <BottomNavigationBarItem>[
          const BottomNavigationBarItem(
            icon: Icon(Icons.home_rounded),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: _selectedIndex == 1
                ? CustomButton(
                    onPressed: () {
                      showModalBottomSheet<dynamic>(
                        isScrollControlled: true,
                        context: context,
                        builder: (BuildContext context) {
                          return Container(
                            width: double.infinity,
                            height: MediaQuery.of(context).size.height *
                                0.65, // Adjust the height as needed
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
                                                15)), // Adjust the radius as needed
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(
                                                15)), // Adjust the radius as needed
                                      ),
                                      hintText: " upload the song link to change voice",
                                      hintStyle: TextStyle(
                                        color: Colors.white60,
                                        fontSize: 15
                                      ),
                                      suffixIcon: Icon(Icons.upload_rounded),
                                      suffixIconColor: Colors.white60
                                    ),
                                    style: const TextStyle(
                                      color: Colors.white60,
                                      fontSize: 15
                                    ),
                                  ),
                                  const SizedBox(height: 20,) ,
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(25),
                                            color: Colors.transparent,
                                            border: Border.all(
                                              color: secondColorDark
                                            )
                                          ),
                                          height: 200,
                                          child:const Padding(
                                            padding:  EdgeInsets.only(top:15),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: [
                                                Icon(Icons.male_rounded,
                                                  color: Colors.white60,
                                                  size: 120,
                                                ),
                                                Text("male",
                                                style: TextStyle(
                                                  color: Colors.white60,
                                                  fontSize: 25
                                                ),)

                                              ],
                                            ),
                                          )
                                        ),
                                      ),
                                      const SizedBox(width:20,) ,
                                      Expanded(
                                        child: Container(
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(25),
                                                color: Colors.transparent,
                                                border: Border.all(
                                                    color: secondColorDark
                                                )
                                            ),
                                            height: 200,
                                            child:const Padding(
                                              padding:  EdgeInsets.only(top:15),
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                children: [
                                                  Icon(Icons.female_rounded,
                                                    color: Colors.white60,
                                                    size: 120,
                                                  ),
                                                  Text("female",
                                                    style: TextStyle(
                                                        color: Colors.white60,
                                                        fontSize: 25
                                                    ),)

                                                ],
                                              ),
                                            )
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
                : const Icon(Icons.add_rounded),
            label: _selectedIndex == 1 ? "" : "Create",
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.person_rounded),
            label: 'Profile',
          ),
        ],
      ),
      body: screens[_selectedIndex],
    );
  }
}
