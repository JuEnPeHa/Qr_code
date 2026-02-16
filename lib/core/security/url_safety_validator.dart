class UrlSafetyValidator {
  const UrlSafetyValidator();

  bool isPotentiallyMalicious(String value) {
    final lower = value.toLowerCase();

    const suspiciousKeywords = <String>[
      'free-money',
      'verify-account',
      'crypto-giveaway',
      'bit.ly/',
      'tinyurl.com/',
    ];

    return suspiciousKeywords.any(lower.contains);
  }
}
