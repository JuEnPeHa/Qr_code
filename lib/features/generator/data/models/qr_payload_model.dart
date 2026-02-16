import '../../domain/entities/qr_payload.dart';

class QrPayloadModel {
  const QrPayloadModel({required this.type, required this.raw});

  final String type;
  final String raw;

  factory QrPayloadModel.fromEntity(QrPayload payload) {
    return QrPayloadModel(type: payload.type.name, raw: payload.raw);
  }

  QrPayload toEntity() {
    return QrPayload(type: QrPayloadType.values.byName(type), raw: raw);
  }
}
