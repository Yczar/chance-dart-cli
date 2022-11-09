// Copyright (c) 2022, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:args/command_runner.dart';
import 'package:chance_dart/chance_dart.dart';
import 'package:chance_dart_cli/src/constants/constants.dart';
import 'package:mason_logger/mason_logger.dart';

/// {@template generate_command}
///
/// `chance_dart_cli generate`
/// A [Command] to exemplify a sub command
/// {@endtemplate}
class GenerateCommand extends Command<int> {
  /// {@macro generate_command}
  GenerateCommand({
    required Logger logger,
  }) : _logger = logger {
    argParser
      ..addFlag(
        boolean1,
        help: 'Prints the same joke, but in cyan',
        negatable: false,
      )
      ..addFlag('cyan')
      ..addFlag(character1)
      ..addFlag(falsy1)
      ..addFlag(floating1)
      ..addFlag(integer1)
      ..addFlag(letter1)
      ..addFlag(natural1)
      ..addFlag(prime1)
      ..addFlag(string1)
      ..addFlag(template1);
  }

  /// required flags
  /// boolean
  /// character
  /// falsy
  /// floating
  /// integer
  /// letter
  /// natural
  /// prime
  /// string
  /// template

  @override
  String get description => 'A generate sub command that just prints one joke';

  @override
  String get name => 'generate';

  final Logger _logger;

  @override
  Future<int> run() async {
    var output = 'Which unicorn has a cold? The Achoo-nicorn!';
    if (argResults?['cyan'] == true) {
      output = lightCyan.wrap(output)!;
    } else if (argResults?[boolean1] == true) {
      output = boolean().toString();
    } else if (argResults?[character1] == true) {
      output = character();
    } else if (argResults?[falsy1] == true) {
      output = falsy().toString();
    } else if (argResults?[floating1] == true) {
      output = floating().toString();
    } else if (argResults?[integer1] == true) {
      output = integer(max: 9999999).toString();
    } else if (argResults?[letter1] == true) {
      output = letter();
    } else if (argResults?[natural1] == true) {
      output = 0.toString();
    } else if (argResults?[prime1] == true) {
      output = prime(max: 30).toString();
    } else if (argResults?[string1] == true) {
      output = string();
    } else if (argResults?[template1] == true) {
      output = template('###-aA-AA');
    }
    _logger
        // ..info(argResults?.toString())
        .info(output);
    return ExitCode.success.code;
  }
}
