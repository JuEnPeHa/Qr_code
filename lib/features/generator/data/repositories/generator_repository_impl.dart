import '../../domain/entities/qr_payload.dart';
import '../../domain/repositories/generator_repository.dart';
import '../datasources/generator_local_datasource.dart';
import '../models/qr_payload_model.dart';

class GeneratorRepositoryImpl implements GeneratorRepository {
  GeneratorRepositoryImpl({required GeneratorLocalDataSource localDataSource}) : _localDataSource = localDataSource;

  final GeneratorLocalDataSource _localDataSource;

  @override
  Future<List<QrPayload>> getPresets() async {
    final data = await _localDataSource.getPresets();
    return data.map((item) => item.toEntity()).toList();
  }

  @override
  Future<void> savePreset(QrPayload payload) {
    return _localDataSource.savePreset(QrPayloadModel.fromEntity(payload));
  }
}
