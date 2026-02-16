import '../../domain/entities/scan_record.dart';
import '../../domain/repositories/scanner_repository.dart';
import '../datasources/scanner_local_datasource.dart';
import '../models/scan_record_model.dart';

class ScannerRepositoryImpl implements ScannerRepository {
  ScannerRepositoryImpl({required ScannerLocalDataSource localDataSource}) : _localDataSource = localDataSource;

  final ScannerLocalDataSource _localDataSource;

  @override
  Future<List<ScanRecord>> getHistory() async {
    final data = await _localDataSource.getHistory();
    return data.map((item) => item.toEntity()).toList();
  }

  @override
  Future<void> saveScan(ScanRecord record) {
    return _localDataSource.saveScan(ScanRecordModel.fromEntity(record));
  }

  @override
  Future<void> toggleFavorite(String id) {
    return _localDataSource.toggleFavorite(id);
  }
}
