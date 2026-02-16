import '../../domain/entities/scan_record.dart';

class ScanRecordModel {
  const ScanRecordModel({
    required this.id,
    required this.raw,
    required this.type,
    required this.createdAt,
    required this.isFavorite,
    required this.isMalicious,
  });

  final String id;
  final String raw;
  final String type;
  final String createdAt;
  final bool isFavorite;
  final bool isMalicious;

  factory ScanRecordModel.fromEntity(ScanRecord entity) => ScanRecordModel(
        id: entity.id,
        raw: entity.raw,
        type: entity.type.name,
        createdAt: entity.createdAt.toIso8601String(),
        isFavorite: entity.isFavorite,
        isMalicious: entity.isMalicious,
      );

  ScanRecord toEntity() => ScanRecord(
        id: id,
        raw: raw,
        type: ScanType.values.byName(type),
        createdAt: DateTime.parse(createdAt),
        isFavorite: isFavorite,
        isMalicious: isMalicious,
      );
}
