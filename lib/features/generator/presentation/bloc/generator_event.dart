part of 'generator_bloc.dart';

sealed class GeneratorEvent {
  const GeneratorEvent();
}

class GeneratorTypeChanged extends GeneratorEvent {
  const GeneratorTypeChanged(this.type);

  final QrPayloadType type;
}

class GeneratorValueChanged extends GeneratorEvent {
  const GeneratorValueChanged(this.value);

  final String value;
}

class GeneratorSavePresetPressed extends GeneratorEvent {
  const GeneratorSavePresetPressed();
}
