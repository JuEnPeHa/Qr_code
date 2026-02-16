import '../entities/qr_payload.dart';

abstract class GeneratorRepository {
  Future<void> savePreset(QrPayload payload);
  Future<List<QrPayload>> getPresets();
}
