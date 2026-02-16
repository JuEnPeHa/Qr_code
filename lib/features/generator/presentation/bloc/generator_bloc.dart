import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/di/injection_container.dart';
import '../../domain/entities/qr_payload.dart';
import '../../domain/usecases/build_qr_payload.dart';

part 'generator_event.dart';
part 'generator_state.dart';

class GeneratorBloc extends Bloc<GeneratorEvent, GeneratorState> {
  GeneratorBloc()
      : _buildQrPayload = const BuildQrPayload(),
        super(const GeneratorState()) {
    on<GeneratorTypeChanged>(_onTypeChanged);
    on<GeneratorValueChanged>(_onValueChanged);
    on<GeneratorSavePresetPressed>(_onSavePreset);
  }

  final BuildQrPayload _buildQrPayload;

  void _onTypeChanged(GeneratorTypeChanged event, Emitter<GeneratorState> emit) {
    emit(state.copyWith(selectedType: event.type));
  }

  void _onValueChanged(GeneratorValueChanged event, Emitter<GeneratorState> emit) {
    final payload = _buildQrPayload.fromForm(type: state.selectedType, value: event.value);
    emit(state.copyWith(value: event.value, previewPayload: payload));
  }

  Future<void> _onSavePreset(
    GeneratorSavePresetPressed event,
    Emitter<GeneratorState> emit,
  ) async {
    if (state.previewPayload == null) return;
    await generatorRepository.savePreset(state.previewPayload!);
    final presets = await generatorRepository.getPresets();
    emit(state.copyWith(presets: presets));
  }
}
