import 'dart:async';

import 'package:mvvm/domain/models.dart';
import 'package:mvvm/presentation/base/base_view_model.dart';
import 'package:mvvm/presentation/resources/assets_manager.dart';
import 'package:mvvm/presentation/resources/strings_manager.dart';

class OnBoardinViewModel
    implements
        BaseViewModel,
        OnBoardingViewModelInputs,
        OnBoardingViewModelOutputs {
  StreamController streamController = StreamController<SliderViewObject>();
  late final List<SliderObject> _list;
  int _currentIndex = 0;
  @override
  void dispose() {
    streamController.close();
  }

  @override
  void start() {
    _list = _getSliderData();
    _postDataToView();
  }

  @override
  int goNext() {
    int nextOffset = _currentIndex + 1;
    if (nextOffset == _list.length) {
      nextOffset = 0;
    }
    return nextOffset;
  }

  @override
  int goPrevious() {
    int previousOffset = _currentIndex - 1;
    if (previousOffset == -1) {
      previousOffset = _list.length - 1;
    }
    return previousOffset;
  }

  @override
  void onPageChanged(int index) {
    _currentIndex = index;
    _postDataToView();
  }

  @override
  Sink get inputSliderViewObject => streamController.sink;

  @override
  Stream<SliderViewObject> get outputSliderViewObject =>
      streamController.stream.map((sliderViewObject) => sliderViewObject);
  void _postDataToView() {
    inputSliderViewObject.add(
      SliderViewObject(_list[_currentIndex], _currentIndex, _list.length),
    );
  }

  List<SliderObject> _getSliderData() {
    return [
      SliderObject(
        AppStrings.onBoardingTitle1,
        AppStrings.onBoardingSubTitle1,
        AssetsManager.onBoardingLogo1, //.,
      ),
      SliderObject(
        AppStrings.onBoardingTitle2,
        AppStrings.onBoardingSubTitle2,
        AssetsManager.onBoardingLogo2,
      ),
      SliderObject(
        AppStrings.onBoardingTitle3,
        AppStrings.onBoardingSubTitle3,
        AssetsManager.onBoardingLogo3,
      ),
      SliderObject(
        AppStrings.onBoardingTitle4,
        AppStrings.onBoardingSubTitle4,
        AssetsManager.onBoardingLogo4,
      ),
    ];
  }
}

abstract class OnBoardingViewModelInputs {
  int goNext();
  int goPrevious();
  void onPageChanged(int index);

  Sink get inputSliderViewObject;
}

abstract class OnBoardingViewModelOutputs {
  Stream<SliderViewObject> get outputSliderViewObject;
}
