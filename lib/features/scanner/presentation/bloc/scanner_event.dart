part of 'scanner_bloc.dart';

sealed class ScannerEvent {
  const ScannerEvent();
}

class ScannerStarted extends ScannerEvent {
  const ScannerStarted();
}

class ScannerCodeDetected extends ScannerEvent {
  const ScannerCodeDetected(this.rawValue);

  final String rawValue;
}

class ScannerToggleFavoritePressed extends ScannerEvent {
  const ScannerToggleFavoritePressed(this.id);

  final String id;
}
