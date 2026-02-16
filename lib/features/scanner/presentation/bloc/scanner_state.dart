part of 'scanner_bloc.dart';

class ScannerState extends Equatable {
  const ScannerState({
    this.isLoading = false,
    this.history = const <ScanRecord>[],
    this.lastScan,
    this.continuousMode = false,
  });

  final bool isLoading;
  final List<ScanRecord> history;
  final ScanRecord? lastScan;
  final bool continuousMode;

  ScannerState copyWith({
    bool? isLoading,
    List<ScanRecord>? history,
    ScanRecord? lastScan,
    bool? continuousMode,
  }) {
    return ScannerState(
      isLoading: isLoading ?? this.isLoading,
      history: history ?? this.history,
      lastScan: lastScan ?? this.lastScan,
      continuousMode: continuousMode ?? this.continuousMode,
    );
  }

  @override
  List<Object?> get props => [isLoading, history, lastScan, continuousMode];
}
