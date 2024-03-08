import 'package:flutter/material.dart';
import 'package:voice_verse/common/app_colors/colors.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(2),
          child: Container(
            color: secondColorDark,
            height: 1,
          ),
        ),
        backgroundColor: backGroundColorDark,
        centerTitle: true,
        title: const Text(
          "Edit profile",
          style: TextStyle(color: Colors.white60, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
            onPressed: () {
              navigateBack();
            },
            icon: const Icon(
              Icons.arrow_back_ios_rounded,
              color: Colors.white60,
            )),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 30, left: 15 , right: 15),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Column(
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        const CircleAvatar(
                          backgroundColor: secondColorDark,
                          radius: 60,
                        ),
                        const CircleAvatar(
                          radius: 57,
                          backgroundImage: AssetImage("images/user_imagejpg.jpg"),
                        ),
                        InkWell(
                          onTap: () {},
                          child: CircleAvatar(
                              radius: 60,
                              backgroundColor: Colors.black.withOpacity(0.3),
                              child: const Icon(
                                Icons.camera_alt_rounded,
                                color: Colors.white38,
                                size: 50,
                              )),
                        )
                      ],
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      "Change photo",
                      style: TextStyle(
                          color: Colors.white70,
                          fontWeight: FontWeight.w500,
                          fontSize: 20),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              const Text(
               "About you",
                textAlign: TextAlign.left,
               style: TextStyle(
                   color: Colors.white60,
                   fontWeight: FontWeight.w500,
                   fontSize: 17
               ),
             ),
              const SizedBox(height: 30),
              InkWell(
                onTap: (){},
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Name",
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 20,
                        fontWeight: FontWeight.w800
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          "Abanob naeem",
                           style: TextStyle(
                              color: Colors.white70,
                              fontSize: 18,
                              fontWeight: FontWeight.w500
                          ),
                        ),
                        SizedBox(width: 10,),
                        Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: Colors.white70,
                          size: 20,
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void navigateBack() {
    Navigator.pop(context);
  }
}
