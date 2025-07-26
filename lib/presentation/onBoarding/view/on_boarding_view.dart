import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:mvvm/domain/models/models.dart';
import 'package:mvvm/presentation/onBoarding/view_model/on_boardin_view_model.dart';
import 'package:mvvm/presentation/resources/assets_manager.dart';
import 'package:mvvm/presentation/resources/color_manager.dart';
import 'package:mvvm/presentation/resources/constant_manager.dart';
import 'package:mvvm/presentation/resources/routes.dart';
import 'package:mvvm/presentation/resources/strings_manager.dart';
import 'package:mvvm/presentation/resources/values_manager.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  final PageController _pageController = PageController();
  final OnBoardinViewModel _viewModel = OnBoardinViewModel();
  _bind() {
    _viewModel.start();
  }

  @override
  void initState() {
    _bind();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<SliderViewObject>(
      stream: _viewModel.outputSliderViewObject,
      builder: (context, snapshot) {
        return _getContentWidget(snapshot.data);
      },
    );
  }

  Widget _getContentWidget(SliderViewObject? data) {
    if (data == null) {
      return Container();
    } else {
      return Scaffold(
        backgroundColor: ColorManager.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: ColorManager.white,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: ColorManager.white,
            statusBarBrightness: Brightness.dark,
          ),
        ),
        body: PageView.builder(
          controller: _pageController,
          itemCount: data.numOfSlides,
          onPageChanged: (value) {
            _viewModel.onPageChanged(value);
          },
          itemBuilder: (context, index) {
            return OnBoardingPage(sliderObject: data.sliderObject);
          },
        ),
        bottomSheet: Container(
          color: ColorManager.white,

          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    context.go(Routes.loginRoute);
                  },
                  child: Text(
                    AppStrings.skip,
                    textAlign: TextAlign.end,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
              ),
              _getBottomSheetWidget(data),
            ],
          ),
        ),
      );
    }
  }

  Widget _getBottomSheetWidget(SliderViewObject sliderObject) {
    return Container(
      color: ColorManager.primary,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(AppPaddings.p14),
            child: GestureDetector(
              onTap: () {
                _pageController.animateToPage(
                  _viewModel.goPrevious(),
                  duration: Duration(
                    milliseconds: AppConstants.sliderOnboardingDelay,
                  ),
                  curve: Curves.decelerate,
                );
              },
              child: SizedBox(
                width: AppSize.s20,
                height: AppSize.s20,
                child: SvgPicture.asset(AssetsManager.leftArrow),
              ),
            ),
          ),
          Row(
            children: [
              for (int i = 0; i < sliderObject.numOfSlides; i++)
                Padding(
                  padding: const EdgeInsets.all(AppPaddings.p8),
                  child:
                      sliderObject.currentIndex == i
                          ? SvgPicture.asset(AssetsManager.hollowCircle)
                          : SvgPicture.asset(AssetsManager.solidCircle),
                ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(AppPaddings.p14),
            child: GestureDetector(
              onTap: () {
                _pageController.animateToPage(
                  _viewModel.goNext(),
                  duration: Duration(
                    milliseconds: AppConstants.sliderOnboardingDelay,
                  ),
                  curve: Curves.decelerate,
                );
              },
              child: SizedBox(
                width: AppSize.s20,
                height: AppSize.s20,
                child: SvgPicture.asset(AssetsManager.rightArrow),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }
}

class OnBoardingViewModel {}

class OnBoardingPage extends StatelessWidget {
  final SliderObject sliderObject;
  const OnBoardingPage({super.key, required this.sliderObject});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(height: AppSize.s40),
        Padding(
          padding: const EdgeInsets.all(AppPaddings.p8),
          child: Text(
            sliderObject.title,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.displayLarge,
          ),
        ),

        Padding(
          padding: const EdgeInsets.all(AppPaddings.p8),
          child: Text(
            sliderObject.subTitle,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ),
        SizedBox(height: AppSize.s50),
        SvgPicture.asset(sliderObject.image),
      ],
    );
  }
}
