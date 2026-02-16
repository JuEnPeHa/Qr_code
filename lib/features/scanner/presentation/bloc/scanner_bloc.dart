import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/di/injection_container.dart';
import '../../../../core/security/url_safety_validator.dart';
import '../../domain/entities/scan_record.dart';
import '../../domain/usecases/process_scan_content.dart';

part 'scanner_event.dart';
part 'scanner_state.dart';

class ScannerBloc extends Bloc<ScannerEvent, ScannerState> {
  ScannerBloc()
      : _processScanContent = ProcessScanContent(const UrlSafetyValidator()),
        super(const ScannerState()) {
    on<ScannerStarted>(_onStarted);
    on<ScannerCodeDetected>(_onCodeDetected);
    on<ScannerToggleFavoritePressed>(_onFavoriteToggle);
  }

  final ProcessScanContent _processScanContent;

  Future<void> _onStarted(ScannerStarted event, Emitter<ScannerState> emit) async {
    emit(state.copyWith(isLoading: true));
    final history = await scannerRepository.getHistory();
    emit(state.copyWith(isLoading: false, history: history));
  }

  Future<void> _onCodeDetected(ScannerCodeDetected event, Emitter<ScannerState> emit) async {
    final record = _processScanContent(event.rawValue);
    await scannerRepository.saveScan(record);
    final history = await scannerRepository.getHistory();
    emit(state.copyWith(lastScan: record, history: history));
  }

  Future<void> _onFavoriteToggle(
    ScannerToggleFavoritePressed event,
    Emitter<ScannerState> emit,
  ) async {
    await scannerRepository.toggleFavorite(event.id);
    final history = await scannerRepository.getHistory();
    emit(state.copyWith(history: history));
  }
}
