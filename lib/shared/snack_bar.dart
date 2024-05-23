import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:voice_verse/common/app_colors/colors.dart';

class CustomSnackBar {
  static void showSuccess(BuildContext context, {
    required String message ,
    required String title
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Container(
          padding: const   EdgeInsets.all(8),
          height: 90.h,
          decoration:  BoxDecoration(
            color: Colors.green.shade600,
            borderRadius: const BorderRadius.all(Radius.circular(15)),
          ),
          child: Row(
            children: [
              Icon(
               Icons.check_circle_rounded,
               color: Colors.white,
               size: 40.sp,
             ),
              SizedBox(width: 5.w,),
              Expanded(
                  child:Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style:  TextStyle(
                        fontSize: 20.sp ,
                        color: Colors.white,
                        fontWeight: FontWeight.w600
                    ),

                  ),
                  SizedBox(height: 5.h,),
                  Flexible(
                    child: Text(
                      message ,
                      style:  TextStyle(
                          color: Colors.white ,
                          fontSize:15.sp,
                          fontWeight: FontWeight.w500
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,


                    ),
                  )
                ],
              ))
            ],
          ),
        ),
        behavior: SnackBarBehavior.fixed,
        backgroundColor: backGroundColorDark,

      ),
    );
  }


  static void showError(BuildContext context, {
    required String message ,
    required String title
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Container(
          padding:  const EdgeInsets.all(8),
          height: 90.h,
          decoration:  BoxDecoration(
            color: Colors.red.shade600,
            borderRadius: const BorderRadius.all(Radius.circular(15)),
          ),
          child: Row(
            children: [
               Icon(
                Icons.error_rounded,
                color: Colors.white,
                size:  40.sp,
              ),
              SizedBox(width: 5.w,),
              Expanded
                (child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style:  TextStyle(
                        fontSize: 20.sp ,
                        color: Colors.white,
                        fontWeight: FontWeight.w600
                    ),

                  ),
                  SizedBox(height: 5.h,),
                  Flexible(
                    child: Text(
                      message ,
                      style:  TextStyle(
                          color: Colors.white ,
                          fontSize:15.sp,
                          fontWeight: FontWeight.w500
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,


                    ),
                  )
                ],
              ))
            ],
          ),
        ),
        behavior: SnackBarBehavior.fixed,
        backgroundColor: backGroundColorDark,

      ),
    );
  }


}