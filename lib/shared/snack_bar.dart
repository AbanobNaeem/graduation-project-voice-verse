import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
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
          height: 13.h,
          decoration:  BoxDecoration(
            color: Colors.green.shade600,
            borderRadius: const BorderRadius.all(Radius.circular(15)),
          ),
          child: Row(
            children: [
              Icon(
               Icons.check_circle_rounded,
               color: Colors.white,
               size: 25.sp,
             ),
              SizedBox(width: 2.w,),
              Expanded(
                  child:Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style:  TextStyle(
                        fontSize: 18.sp ,
                        color: Colors.white,
                        fontWeight: FontWeight.w600
                    ),

                  ),
                  SizedBox(height: 1.h,),
                  Flexible(
                    child: Text(
                      message ,
                      style:  TextStyle(
                          color: Colors.white ,
                          fontSize:16.sp,
                          fontWeight: FontWeight.w600
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
        backgroundColor: Colors.transparent,

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
          height: 13.h,
          decoration:  BoxDecoration(
            color: Colors.red.shade600,
            borderRadius: const BorderRadius.all(Radius.circular(15)),
          ),
          child: Row(
            children: [
               Icon(
                Icons.error_rounded,
                color: Colors.white,
                size:  25.sp,
              ),
              SizedBox(width: 2.w,),
              Expanded
                (child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style:  TextStyle(
                        fontSize: 18.sp ,
                        color: Colors.white,
                        fontWeight: FontWeight.bold
                    ),

                  ),
                  SizedBox(height: 1.h,),
                  Flexible(
                    child: Text(
                      message ,
                      style:  TextStyle(
                          color: Colors.white ,
                          fontSize:16.sp,
                          fontWeight: FontWeight.w600
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
        backgroundColor: Colors.transparent,

      ),
    );
  }


}