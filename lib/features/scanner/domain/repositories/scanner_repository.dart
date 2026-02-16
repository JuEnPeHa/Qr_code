import '../entities/scan_record.dart';

abstract class ScannerRepository {
  Future<void> saveScan(ScanRecord record);
  Future<List<ScanRecord>> getHistory();
  Future<void> toggleFavorite(String id);
}
