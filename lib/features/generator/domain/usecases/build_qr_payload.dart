import '../entities/qr_payload.dart';

class BuildQrPayload {
  const BuildQrPayload();

  QrPayload fromForm({
    required QrPayloadType type,
    required String value,
  }) {
    final normalized = value.trim();

    return QrPayload(
      type: type,
      raw: normalized,
      withCenterLogo: type == QrPayloadType.payment,
    );
  }
}
