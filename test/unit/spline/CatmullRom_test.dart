import 'package:test/test.dart';

import 'package:latlong/spline.dart';
// import 'package:logging/logging.dart';

// Browser
// import "package:console_log_handler/console_log_handler.dart";

// Commandline
// import "package:console_log_handler/print_log_handler.dart";

void main() async {
  // final Logger _logger = new Logger("test.CatmullRom");
  // configLogging();

  group('CatmullRom 1D', () {
    setUp(() {});

    test('> one dimension', () {
      final spline = CatmullRomSpline(1, 2, 2, 1);

      expect(spline.position(0.25), 2.09375);
      expect(spline.position(0.5), 2.125);
      expect(spline.position(0.75), 2.09375);
    }); // end of 'one dimension' test

    test('> no endpoints', () {
      final spline = CatmullRomSpline.noEndpoints(1, 2);

      expect(spline.position(0.25), 1.203125);
      expect(spline.position(0.5), 1.5);
      expect(spline.percentage(50), 1.5);

      expect(spline.position(0.75), 1.796875);
    }); // end of 'no endpoints' test
  });
  // End of 'CatmullRom 1D' group

  group('CatmullRom 2D', () {
    test('> Simple values', () {
      final spline = CatmullRomSpline2D(Point2D(1, 1), Point2D(2, 2), Point2D(2, 2), Point2D(1, 1));

      expect(spline.position(0.25).x, 2.09375);
      expect(spline.position(0.25).y, 2.09375);

      expect(spline.position(0.5).x, 2.125);
      expect(spline.position(0.5).y, 2.125);
      expect(spline.percentage(50).x, 2.125);
      expect(spline.percentage(50).y, 2.125);

      expect(spline.position(0.75).x, 2.09375);
      expect(spline.position(0.75).y, 2.09375);
    });

    test('> no Endpoints', () {
      final spline = CatmullRomSpline2D.noEndpoints(Point2D(1, 1), Point2D(2, 2));

      expect(spline.position(0.25).x, 1.203125);
      expect(spline.position(0.25).y, 1.203125);
    }); // end of 'no Endpoints' test

    test('> Exception', () {
      final spline = CatmullRomSpline2D.noEndpoints(Point2D(1, 1), Point2D(2, 2));

      expect(() => spline.position(3.0).x, throwsArgumentError);
    }); // end of 'Exception' test
  }); // End of 'CatmullRom 2D' group
}

// - Helper --------------------------------------------------------------------------------------
