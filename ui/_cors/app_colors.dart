import 'package:flutter/material.dart';

/// `AppColors` é uma classe abstrata que define as paletas de cores usadas na aplicação.
abstract class AppColors {
  /// `backgroundColor` é a cor de fundo padrão da aplicação.
  /// Ela é definida como um tom de cinza escuro.
  static const Color backgroundColor = Color(0xFF202123);
  /// `mainColor` é a cor principal usada para destacar elementos, botões e ações primárias.
  static const Color mainColor = Color(0xFFffa559);
  /// `lightBackgroundColor` é uma variação mais clara da cor de fundo, utilizada para alguns elementos da UI.
  static const Color lightBackgroundColor = Color(0xFF343541);
  /// `destacColor` é uma cor de destaque, com um tom mais claro que a cor principal.
  static const Color destacColor = Color(0xFFffe6c7);
}
