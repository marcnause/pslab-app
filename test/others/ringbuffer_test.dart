import 'package:flutter_test/flutter_test.dart';
import 'package:pslab/others/ringbuffer.dart';

void main() {
  group('create ringbuffer and fill it', () {
    late Ringbuffer ringbuffer;

    test('create ringbuffer', () {
      ringbuffer = Ringbuffer(3);
      expect(ringbuffer.length, 0);
    });

    test('add first element', () {
      ringbuffer.add('first');
      expect(ringbuffer.length, 1);
      expect(ringbuffer[0], 'first');
    });

    test('add second element', () {
      ringbuffer.add('second');
      expect(ringbuffer.length, 2);
      expect(ringbuffer[0], 'first');
      expect(ringbuffer[1], 'second');
    });

    test('add third element', () {
      ringbuffer.add('third');
      expect(ringbuffer.length, 3);
      expect(ringbuffer[0], 'first');
      expect(ringbuffer[1], 'second');
      expect(ringbuffer[2], 'third');
    });

    test('add fourth element', () {
      ringbuffer.add('fourth');
      expect(ringbuffer.length, 3);
      expect(ringbuffer[0], 'fourth');
      expect(ringbuffer[1], 'second');
      expect(ringbuffer[2], 'third');
    });
  });

  test('create ringbuffer with illegal index', () {
    expect(() => Ringbuffer(0), throwsArgumentError);
  });

  test('access nonexistant field', () {
    Ringbuffer ringbuffer = Ringbuffer(2);
    expect(ringbuffer.length, 0);
    expect(() => ringbuffer[-1], throwsRangeError);
    expect(() => ringbuffer[0], throwsRangeError);
    ringbuffer.add("first");
    expect(ringbuffer.length, 1);
    expect(() => ringbuffer[1], throwsRangeError);
  });

  test('fill and clear', () {
    Ringbuffer ringbuffer = Ringbuffer(2);
    expect(ringbuffer.length, 0);
    ringbuffer.add("first");
    expect(ringbuffer.length, 1);
    ringbuffer.add("second");
    expect(ringbuffer.length, 2);
    ringbuffer.clear();
    expect(ringbuffer.length, 0);
  });

  test('write with index', () {
    Ringbuffer ringbuffer = Ringbuffer(2);
    expect(() => ringbuffer[0] = "first", throwsUnsupportedError);
    expect(ringbuffer.length, 0);
    expect(() => ringbuffer[0], throwsRangeError);
  });
}
