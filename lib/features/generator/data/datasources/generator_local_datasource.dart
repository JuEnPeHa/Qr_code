import '../models/qr_payload_model.dart';

class GeneratorLocalDataSource {
  final List<QrPayloadModel> _presets = <QrPayloadModel>[];

  Future<void> savePreset(QrPayloadModel model) async {
    _presets.insert(0, model);
  }

  Future<List<QrPayloadModel>> getPresets() async => _presets;
}
