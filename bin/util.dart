import 'package:ansi_styles/ansi_styles.dart';

import 'constants.dart';

void printSuccess(String message) {
  print(AnsiStyles.green('$kSuccess $message'));
}

void printError(String message) {
  print(AnsiStyles.red('$kError $message'));
}

void printWarning(String message) {
  print(AnsiStyles.yellow('$kWarning $message'));
}

void printHelp(String message) {
  print(AnsiStyles.green(message));
}
