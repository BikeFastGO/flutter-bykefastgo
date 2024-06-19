import 'package:bykefastgo/domain/domain.dart';
import 'package:bykefastgo/presentation/providers/providers.dart';
import 'package:bykefastgo/shared/util/util.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:formz/formz.dart';

final bicycleFormProvider = StateNotifierProvider.autoDispose
    .family<BicycleNotifier, BicycleFormState, BicycleDto>((ref, bicycle) {
      final updateCallback = ref.watch(bicyclesRepositoryProvider).updateOrCreateBicycle;
      return BicycleNotifier(bicycle: bicycle, onSubmitCallback: updateCallback);
});

class BicycleNotifier extends StateNotifier<BicycleFormState> {
  final Future<Bicycle> Function(Map<String, dynamic> bicycleLike)?
      onSubmitCallback;

  BicycleNotifier({this.onSubmitCallback, required BicycleDto bicycle})
      : super(BicycleFormState(
            id: bicycle.bicycleId,
            title: Title.dirty(bicycle.bicycleName),
            price: Price.dirty(bicycle.bicyclePrice),
            description: bicycle.bicycleDescription,
            size: bicycle.bicycleSize,
            model: Model.dirty(bicycle.bicycleModel),
            imageData: bicycle.imageData,
            latitude: bicycle.latitudeData,
            longitude: bicycle.longitudeData));
  Future<bool> onFormSubmit() async {
    _touchedEverything();
    if (!state.isFormValid) {
      return false;
    }
    if (onSubmitCallback == null) {
      return false;
    }

    final productLike = {
      'id': (state.id == -1) ? null : state.id,
      'bicycleName': state.title.value,
      'bicycleDescription': state.description,
      'bicyclePrice': state.price.value,
      'bicycleSize': state.size,
      'bicycleModel': state.model.value,
      'imageData': state.imageData,
      'latitudeData': state.latitude,
      'longitudeData': state.longitude,
    };

    try {
      await onSubmitCallback!(productLike);
      return true;
    } catch (e) {
      return false;
    }
  }



  void _touchedEverything() {
    state = state.copyWith(
        isFormValid: Formz.validate([
      Title.dirty(state.title.value),
      Price.dirty(state.price.value),
      Model.dirty(state.model.value)
    ]));
  }

  void onImageChanged(String path) {
    state = state.copyWith(imageData: path);
  }

  void onTitleChanged(String value) {
    state = state.copyWith(
        title: Title.dirty(value),
        isFormValid: Formz.validate([
          Title.dirty(value),
          Price.dirty(state.price.value),
          Model.dirty(state.model.value)
        ]));
  }

  void onPriceChanged(double value) {
    state = state.copyWith(
        price: Price.dirty(value),
        isFormValid: Formz.validate([
          Price.dirty(value),
          Title.dirty(state.title.value),
          Model.dirty(state.model.value),         
        ]));
  }

  void onSizeChanged(String value) {
    state = state.copyWith(size: value);
  }

  void onModelChanged(String value) {
    state = state.copyWith(
        model: Model.dirty(value),
        isFormValid: Formz.validate([
          Model.dirty(value),
          Title.dirty(state.title.value),
          Price.dirty(state.price.value),       
        ]));
  }

  void onDescriptionChanged(String value) {
    state = state.copyWith(description: value);
  }
}

class BicycleFormState {
  final bool isFormValid;
  final int? id;
  final Title title;
  final Price price;
  final String description;
  final String size;
  final Model model;
  final String imageData;
  final double latitude;
  final double longitude;

  BicycleFormState(
      {this.isFormValid = false,
      this.id,
      this.title = const Title.dirty(''),
      this.price = const Price.dirty(0),
      this.description = '',
      this.size = '',
      this.model = const Model.dirty(''),
      this.imageData = '',
      this.latitude = 0.0,
      this.longitude = 0.0});

  BicycleFormState copyWith({
    bool? isFormValid,
    int? id,
    Title? title,
    Price? price,
    String? description,
    String? size,
    Model? model,
    String? imageData,
    double? latitude,
    double? longitude,
  }) {
    return BicycleFormState(
      isFormValid: isFormValid ?? this.isFormValid,
      id: id ?? this.id,
      title: title ?? this.title,
      price: price ?? this.price,
      description: description ?? this.description,
      size: size ?? this.size,
      model: model ?? this.model,
      imageData: imageData ?? this.imageData,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
    );
  }
}
