import '../models/scan_record_model.dart';

class ScannerLocalDataSource {
  final List<ScanRecordModel> _history = <ScanRecordModel>[];

  Future<void> saveScan(ScanRecordModel model) async {
    _history.insert(0, model);
  }

  Future<List<ScanRecordModel>> getHistory() async => _history;

  Future<void> toggleFavorite(String id) async {
    final index = _history.indexWhere((item) => item.id == id);
    if (index == -1) return;

    final current = _history[index];
    _history[index] = ScanRecordModel(
      id: current.id,
      raw: current.raw,
      type: current.type,
      createdAt: current.createdAt,
      isFavorite: !current.isFavorite,
      isMalicious: current.isMalicious,
    );
  }
}
