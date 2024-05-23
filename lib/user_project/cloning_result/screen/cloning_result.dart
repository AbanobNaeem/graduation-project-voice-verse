import 'package:flutter/material.dart';
import 'package:flutter_animated_loadingkit/flutter_animated_loadingkit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:voice_verse/common/app_colors/colors.dart';
import 'package:voice_verse/common/app_component/audio_item.dart';
import 'package:voice_verse/common/app_component/empty_state_message.dart';
import 'package:voice_verse/models/cloning_model.dart';
import 'package:voice_verse/user_project/cloning_result/cubit/cloning_cubit.dart';

class CloningResult extends StatefulWidget {
  const CloningResult({super.key});

  @override
  State<CloningResult> createState() => _CloningResultState();
}

class _CloningResultState extends State<CloningResult> {
  final cubit = CloningCubit();
  CloningModel? cloningModel;
  double? _progress;

  @override
  void initState() {
    super.initState();
    cubit.getCloningOutPut(); // Call the cubit's method to fetch data
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => cubit,
      child: BlocConsumer<CloningCubit, CloningStates>(
        listener: (context, state) {
          if (state is GetCloningOutPutSuccessState) {
            setState(() {
              cloningModel = state.cloningModel;
            });
          }
          if (state is GetCloningOutPutFailureState) {
            print('error');
          }
        },
        builder: (context, state) {
          if (state is GetCloningOutPutLoadingState || _progress != null) {
            return const Scaffold(
              backgroundColor: Colors.transparent,
              body: Center(
                child: AnimatedLoadingWavingLine(color: primaryColorDark),
              ),
            );
          } else if (state is GetCloningOutPutSuccessState) {
            return Scaffold(
              backgroundColor: Colors.transparent,
              body: cloningModel?.clonedAudio != null &&
                  cloningModel!.clonedAudio!.isNotEmpty
                  ? SafeArea(
                child: ListView.builder(
                    itemCount: cloningModel!.clonedAudio!.length,
                    itemBuilder: (BuildContext context, int index) {
                      final audio = cloningModel!.clonedAudio![index];
                      return AudioItem(
                        title: audio.title!,
                        description: audio.textToSpeech!,
                        audioUrl: audio.audioUrl!,
                      );
                    }),
              )
                  : Padding(
                padding: EdgeInsets.only(bottom: 20.h),
                child: const EmptyStateMessage(
                  imagePath: "images/icons/audio.png",
                  mainText: "No cloning audio yet!",
                  subText:
                  "Hit the button below to add your first projects and see some magic",
                  scale: 3,
                  color: Colors.white30,
                ),
              ),
            );
          } else if (state is GetCloningOutPutFailureState) {
            return const Scaffold(
              backgroundColor: Colors.transparent,
              body: EmptyStateMessage(
                imagePath: "images/icons/audio.png",
                mainText: "No cloning audio yet!",
                subText: "Hit the button below to add your first projects and see some magic",
                scale: 3,
                color: Colors.white30,
              ),
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
