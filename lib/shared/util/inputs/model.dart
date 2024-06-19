import 'package:formz/formz.dart';

enum ModelError { empty }

class Model extends FormzInput<String, ModelError> {
  const Model.pure() : super.pure('');
  const Model.dirty(String value) : super.dirty(value);

  @override
  ModelError? validator(String value) {
    if (value.isEmpty) return ModelError.empty;
    return null;
  }

  String? get errorMessage {
    if (isValid || isPure) return null;
    if (displayError == ModelError.empty) return 'El modelo es requerido';
    return null;
  }
}