import 'package:cached_network_image/cached_network_image.dart';
import 'package:elections/core/theming/styles.dart';
import 'package:elections/core/widgets/app_loading.dart';
import 'package:elections/core/widgets/app_snack_bar.dart';
import 'package:elections/core/widgets/app_text_button.dart';
import 'package:elections/features/voter_home/data/models/all_candate_response.dart';
import 'package:elections/features/voter_home/logic/cubit/voter_home_cubit.dart';
import 'package:elections/features/voter_home/logic/cubit/voter_home_state.dart';
import 'package:elections/features/voter_sign_up/logic/cubit/voter_sign_up_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

class BlocBuilderAllCandidate extends StatefulWidget {
  const BlocBuilderAllCandidate({super.key});

  @override
  State<BlocBuilderAllCandidate> createState() =>
      _BlocBuilderAllCandidateState();
}

class _BlocBuilderAllCandidateState extends State<BlocBuilderAllCandidate> {
  final ImagePicker _imagePicker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    debugPrint('000000000000000');
    return BlocBuilder<VoterHomeCubit, VoterHomeState>(
      buildWhen: (previous, current) =>
          current is AllCandidateLoading ||
          current is AllCandidateLoaded ||
          current is AllCandidateFailure,
      builder: (context, state) {
        return state.maybeWhen(
            orElse: () => Container(),
            allCandidateLoading: () {
              return const AppLoading();
            },
            allCandidateLoaded: (data) {
              return _allCandidateListView(data);
            },
            allCandidateFailure: (failure) {
              return Container();
            });
      },
    );
  }

  Widget _allCandidateListView(List<AllCandidateResponse> data) {
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 5.w,
          mainAxisExtent: 250.h,
        ),
        itemCount: data.length,
        itemBuilder: (context, index) {
          return _allCandidateView(data, index);
        });
  }

  Widget _allCandidateView(List<AllCandidateResponse> data, int index) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: 5.h),
          decoration: BoxDecoration(
            color: Colors.amber,
            borderRadius: BorderRadius.circular(15),
            image: DecorationImage(
              image: CachedNetworkImageProvider(
                'http://election.somee.com/${data[index].personalImagePath}',
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          bottom: 5.w,
          left: 0,
          right: 0,
          child: Container(
            width: double.maxFinite,
            height: 50.h,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.5),
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(15),
                bottomRight: Radius.circular(15),
              ),
            ),
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          'Name: ${data[index].name}',
                          style: TextStyles.font15DarkBlueMedium
                              .copyWith(color: Colors.white, fontSize: 13.sp),
                        ),
                      ),
                      Text(
                        'Gender: ${data[index].gender}',
                        style: TextStyles.font15DarkBlueMedium
                            .copyWith(color: Colors.white, fontSize: 13.sp),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                AppTextButton(
                  onPressed: () => actionThenTapButton(),
                  text: 'vote',
                  verticalSize: 10,
                  horizontalSize: 10,
                  border: 10,
                  textStyle: TextStyles.font15DarkBlueMedium.copyWith(
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  Future<void> actionThenTapButton() async {
    try {
      XFile? pickedImage = await _imagePicker.pickImage(
        source: ImageSource.camera,
      );
      if (pickedImage != null) {
        setState(() {
          messageAfterVote();
          context.read<VoterSignUpCubit>().image = pickedImage;
        });
      } else {
        setState(() {
          context.read<VoterSignUpCubit>().image = pickedImage;
        });
      }
    } catch (failure) {
      debugPrint('failure choose image picker=>${failure.toString()}');
    }
  }

  messageAfterVote() {
    appSnackBar(
      text: 'Vote Successfully',
      backGroundColor: Colors.green,
      context: context,
    );
  }
}
