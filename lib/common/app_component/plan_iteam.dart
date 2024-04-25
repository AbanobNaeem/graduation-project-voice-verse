import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:voice_verse/common/app_colors/colors.dart';

class PlanItem extends StatelessWidget {
  const PlanItem({
    Key? key,
    required this.planName,
    required this.planPrice,
    required this.totalPrice,
    required this.check,
    required this.outlineColor
  }) : super(key: key);

  final String planName;
  final String planPrice;
  final String totalPrice;
  final bool  check;
  final Color outlineColor ;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: outlineColor,
          width: 0.2.w,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        width: double.infinity,
        height: 10.h,
        decoration: BoxDecoration(
          color: secondColorDark,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: EdgeInsets.only(right: 3.w),
          child: Row(
            children: [
              Transform.scale(
                scale: 1.1,
                child: Checkbox(
                  checkColor: Colors.white,
                  value: check,
                  shape: const CircleBorder(),
                  onChanged: (bool? value) {},
                ),
              ),
              SizedBox(width: 3.w),
              Padding(
                padding: EdgeInsets.only(top: 2.h, bottom: 2.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      planName,
                      style: TextStyle(
                        color: Colors.white60,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 0.3.h),
                    Text(
                      planPrice,
                      style: TextStyle(
                        color: Colors.white38,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              Text(
                totalPrice,
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
