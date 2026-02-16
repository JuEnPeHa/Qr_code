import 'package:flutter/material.dart';

class DesignTokens {
  const DesignTokens._();

  static const Color electricBlue = Color(0xFF246BFD);
  static const Color neonPurple = Color(0xFF7A3EFF);
  static const Color aquaMint = Color(0xFF05D2C6);
  static const Color accentOrange = Color(0xFFFF8A00);

  static const LinearGradient primaryGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [electricBlue, neonPurple],
  );

  static const LinearGradient cardGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Color(0xFF1F2937), Color(0xFF111827)],
  );

  static List<BoxShadow> softShadow(Color color) => [
        BoxShadow(
          color: color.withOpacity(0.16),
          blurRadius: 22,
          offset: const Offset(0, 10),
        ),
      ];
}
