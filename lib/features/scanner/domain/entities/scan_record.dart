import 'package:equatable/equatable.dart';

enum ScanType { url, wifi, whatsapp, email, phone, sms, location, vcard, text }

class ScanRecord extends Equatable {
  const ScanRecord({
    required this.id,
    required this.raw,
    required this.type,
    required this.createdAt,
    this.isFavorite = false,
    this.isMalicious = false,
  });

  final String id;
  final String raw;
  final ScanType type;
  final DateTime createdAt;
  final bool isFavorite;
  final bool isMalicious;

  @override
  List<Object?> get props => [id, raw, type, createdAt, isFavorite, isMalicious];
}
