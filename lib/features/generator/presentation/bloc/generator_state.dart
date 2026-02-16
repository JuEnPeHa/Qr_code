part of 'generator_bloc.dart';

class GeneratorState extends Equatable {
  const GeneratorState({
    this.selectedType = QrPayloadType.url,
    this.value = '',
    this.previewPayload,
    this.presets = const <QrPayload>[],
  });

  final QrPayloadType selectedType;
  final String value;
  final QrPayload? previewPayload;
  final List<QrPayload> presets;

  GeneratorState copyWith({
    QrPayloadType? selectedType,
    String? value,
    QrPayload? previewPayload,
    List<QrPayload>? presets,
  }) {
    return GeneratorState(
      selectedType: selectedType ?? this.selectedType,
      value: value ?? this.value,
      previewPayload: previewPayload ?? this.previewPayload,
      presets: presets ?? this.presets,
    );
  }

  @override
  List<Object?> get props => [selectedType, value, previewPayload, presets];
}
