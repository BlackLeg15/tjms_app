import 'package:flutter/material.dart';

class TjmsThemeExtension extends ThemeExtension<TjmsThemeExtension> {
  final Color? brandColor;
  final Color? danger;

  const TjmsThemeExtension({
    this.brandColor = Colors.purple,
    this.danger = Colors.redAccent,
  });

  @override
  ThemeExtension<TjmsThemeExtension> lerp(ThemeExtension<TjmsThemeExtension>? other, double t) {
    if (other is! TjmsThemeExtension) {
      return this;
    }
    return TjmsThemeExtension(
      brandColor: Color.lerp(brandColor, other.brandColor, t),
      danger: Color.lerp(danger, other.danger, t),
    );
  }

  @override
  TjmsThemeExtension copyWith({
    Color? brandColor,
    Color? danger,
  }) {
    return TjmsThemeExtension(
      brandColor: brandColor ?? this.brandColor,
      danger: danger ?? this.danger,
    );
  }
}
