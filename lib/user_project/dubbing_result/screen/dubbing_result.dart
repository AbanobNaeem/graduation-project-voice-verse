import 'package:flutter/material.dart';
import 'package:flutter_animated_loadingkit/flutter_animated_loadingkit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:voice_verse/common/app_colors/colors.dart';
import 'package:voice_verse/common/app_component/audio_item.dart';
import 'package:voice_verse/common/app_component/empty_state_message.dart';
import 'package:voice_verse/models/dubbing_model.dart';
import 'package:voice_verse/shared/snack_bar.dart';
import 'package:voice_verse/user_project/dubbing_result/cubit/dubbing_cubit.dart';

class DubbingResult extends StatefulWidget {
  const DubbingResult({super.key});

  @override
  State<DubbingResult> createState() => _DubbingResultState();
}

class _DubbingResultState extends State<DubbingResult> {
  DubbingModel? dubbingModel;
  final cubit = DubbingCubit();
  double? _progress;

  @override
  void initState() {
    super.initState();
    cubit.getDubbingOutPut(); // Make sure to call the cubit's method to fetch data
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => cubit,
      child: BlocConsumer<DubbingCubit, DubbingStates>(
        listener: (context, state) {
          if (state is GetDubbingOutPutSuccessState) {
            setState(() {
              dubbingModel = state.dubbingModel;
            });
          }
          if (state is GetDubbingOutPutFailureState) {
            CustomSnackBar.showError(context,
                message: state.errorMessage,
                title: "An error!!");
          }
        },
        builder: (context, state) {
          if (state is GetDubbingOutPutLoadingState || _progress != null) {
            return const Scaffold(
              backgroundColor: Colors.transparent,
              body: Center(
                child: AnimatedLoadingWavingLine(color: primaryColorDark),
              ),
            );
          } else if (state is GetDubbingOutPutSuccessState) {
            return Scaffold(
              backgroundColor: Colors.transparent,
              body: dubbingModel?.dubbedAudio != null &&
                  dubbingModel!.dubbedAudio!.isNotEmpty
                  ? SafeArea(
                child: ListView.builder(
                    itemCount: dubbingModel!.dubbedAudio!.length,
                    itemBuilder: (BuildContext context, int index) {
                      final audio = dubbingModel!.dubbedAudio![index];
                      return AudioItem(
                        title: audio.title!,
                        description: audio.description!,
                        audioUrl: audio.audioUrl!,
                      );
                    }),
              )
                  : Padding(
                padding: EdgeInsets.only(bottom: 20.h),
                child: const EmptyStateMessage(
                  imagePath: "images/icons/audio.png",
                  mainText: "No dubbing audio yet!",
                  subText:
                  "Hit the button below to add your first projects and see some magic",
                  scale: 3,
                  color: Colors.white30,
                ),
              ),
            );
          } else if (state is GetDubbingOutPutFailureState) {
            return Scaffold(
              backgroundColor: Colors.transparent,
              body: Padding(
                padding: EdgeInsets.only(bottom: 20.h),
                child: const EmptyStateMessage(
                  imagePath: "images/icons/audio.png",
                  mainText: "No dubbing audio yet!",
                  subText: "Hit the button below to add your first projects and see some magic",
                  scale: 3,
                  color: Colors.white30,
                ),
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
