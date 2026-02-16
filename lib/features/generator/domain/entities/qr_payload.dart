import 'package:equatable/equatable.dart';

enum QrPayloadType {
  url,
  text,
  wifi,
  whatsapp,
  phone,
  email,
  location,
  calendar,
  vcard,
  instagram,
  facebook,
  youtube,
  tiktok,
  linkedin,
  payment,
}

class QrPayload extends Equatable {
  const QrPayload({
    required this.type,
    required this.raw,
    this.foregroundColorHex = '#111827',
    this.backgroundColorHex = '#FFFFFF',
    this.withRoundedEdges = true,
    this.withCenterLogo = false,
  });

  final QrPayloadType type;
  final String raw;
  final String foregroundColorHex;
  final String backgroundColorHex;
  final bool withRoundedEdges;
  final bool withCenterLogo;

  @override
  List<Object?> get props => [
        type,
        raw,
        foregroundColorHex,
        backgroundColorHex,
        withRoundedEdges,
        withCenterLogo,
      ];
}
