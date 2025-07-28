enum LangaugeType { ENGLISH, ARABIC }

extension LangaugeTypeExtension on LangaugeType {
  String getValue() {
    switch (this) {
      case LangaugeType.ENGLISH:
        return 'en';
      case LangaugeType.ARABIC:
        return 'ar';
    }
  }
}
