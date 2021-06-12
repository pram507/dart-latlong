//@TestOn("content-shell")
import 'package:test/test.dart';

import 'package:latlong/latlong.dart';
// import 'package:logging/logging.dart';

// Browser
// import "package:console_log_handler/console_log_handler.dart";

// Commandline
// import "package:console_log_handler/print_log_handler.dart";

void main() async {
  // final Logger _logger = new Logger("test.Sexagesimal");
  // configLogging();

  //await saveDefaultCredentials();

  group('Sexagesimal', () {
    setUp(() {});

    test('> decimal2sexagesimal', () {
      final sexa1 = decimal2sexagesimal(51.519475);
      final sexa2 = decimal2sexagesimal(-19.37555556);
      final sexa3 = decimal2sexagesimal(50.0);

      expect(sexa1, '51° 31\' 10.11"');
      expect(sexa2, '19° 23\' 32.00"');
      expect(sexa3, '50° 00\' 00.00"');

      final p1 = LatLng(51.519475, -19.37555556);
      expect(p1.toSexagesimal(), '51° 31\' 10.11" N, 19° 23\' 32.00" W');
    }); // end of 'decimal2sexagesimal' test
  });
  // End of 'Sexagesimal' group
}

// - Helper --------------------------------------------------------------------------------------
