import '../../../../core/security/url_safety_validator.dart';
import '../entities/scan_record.dart';

class ProcessScanContent {
  ProcessScanContent(this._urlSafetyValidator);

  final UrlSafetyValidator _urlSafetyValidator;

  ScanRecord call(String rawContent) {
    final type = _detectType(rawContent);
    final isMalicious = type == ScanType.url && _urlSafetyValidator.isPotentiallyMalicious(rawContent);

    return ScanRecord(
      id: DateTime.now().microsecondsSinceEpoch.toString(),
      raw: rawContent,
      type: type,
      createdAt: DateTime.now(),
      isMalicious: isMalicious,
    );
  }

  ScanType _detectType(String value) {
    if (value.startsWith('http')) return ScanType.url;
    if (value.startsWith('WIFI:')) return ScanType.wifi;
    if (value.startsWith('BEGIN:VCARD')) return ScanType.vcard;
    if (value.startsWith('mailto:')) return ScanType.email;
    if (value.startsWith('tel:')) return ScanType.phone;
    if (value.startsWith('smsto:')) return ScanType.sms;
    if (value.contains('wa.me/') || value.contains('whatsapp')) return ScanType.whatsapp;
    if (value.startsWith('geo:')) return ScanType.location;
    return ScanType.text;
  }
}
