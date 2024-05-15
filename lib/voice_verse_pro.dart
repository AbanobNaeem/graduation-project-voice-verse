import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:voice_verse/common/app_colors/colors.dart';
import 'package:voice_verse/common/app_component/custom_button.dart';
import 'package:voice_verse/common/app_component/plan_iteam.dart';

class VoiceVersePro extends StatelessWidget {
  const VoiceVersePro({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: backGroundColorDark,
      child: Column(
        children: [
          Stack(
            alignment: Alignment.topCenter,
            children: [
              Container(
                foregroundDecoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [
                          backGroundColorDark.withOpacity(0.9),
                          backGroundColorDark.withOpacity(0.7),
                          Colors.transparent
                        ],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter
                    )
                ),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height*0.45,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                      image:AssetImage(
                        "images/graient_background.jpg",
                      ),
                      fit: BoxFit.cover,
                    )
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top:50.h ,left: 10.w , right: 10.w),
                child: Column(
                  children: [
                    Row(
                      children: [
                        IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Icon(
                              Icons.close_rounded,
                              color: Colors.white,
                              size: 30.sp,
                            )),
                        const Spacer(),
                        TextButton(
                            onPressed: () {},
                            child: Text(
                              "Already Pro?",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16.sp),
                            ))
                      ],
                    ),
                    SizedBox(height: 3.h,),
                    Image.asset(
                      'images/logo.png',
                      width: 250.w,
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Padding(
                      padding:  EdgeInsets.only(left: 35.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Voice Verse",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 30.sp),
                          ),
                          Container(
                            margin: EdgeInsets.only(bottom: 30.h,left: 5.w),
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(0.3),
                                borderRadius: BorderRadius.circular(10)
                            ),
                            child: Text(
                              "PRO",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 17.sp,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 10.h,),
                    const  PlanItem(
                      outlineColor: primaryColorDark,
                      check: true,
                      planName: "Monthly Plan",
                      planPrice: "EGP 189.99 Per month",
                      totalPrice: "EGP 189.99",
                    ),
                    SizedBox(height: 15.h,),
                    const PlanItem(
                        outlineColor: secondColorDark,
                        check: false,
                        planName: "Annual Plan",
                        planPrice: "EGP 191.67 Per month",
                        totalPrice: "EGP 2,299.99"
                    ),
                    SizedBox(height: 15.h,),
                  ],
                ),
              )

            ],
          ),
          Padding(
            padding:  EdgeInsets.only(left: 10.w,right: 10.w),
            child: Column(
              children: [
                const PlanItem(
                    outlineColor: secondColorDark,
                    check: false,
                    planName: "Weekly Plan",
                    planPrice: "EGP 99.99 Per week",
                    totalPrice: "EGP 99.99"
                ),
                SizedBox(height: 15.h,),
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 3.w),
                  child: Row(
                    children: [
                      Text(
                        "Enable 3-day free trial",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 16.sp,
                        ),
                      ),
                      Spacer(),
                      Switch(
                        value: true, // Set the initial value of the toggle button
                        onChanged: (bool value) {
                          // Handle toggle button value change
                        },


                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20.h,),
                CustomButton(
                    onPressed: (){},
                    text: "Get Started"
                ),

              ],
            ),
          )



        ],
      ),
    );
  }
}
