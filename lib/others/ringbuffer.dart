import 'dart:collection';
import 'dart:math';

class Ringbuffer<T> with ListMixin<T?> {
  late int _capacity;
  late List<T?> _buffer;

  late int _length;
  int _index = -1;

  Ringbuffer(int capacity) {
    if (capacity <= 0) {
      throw ArgumentError("Capacity must be a positive number.");
    }

    _capacity = capacity;
    _buffer = List<T?>.filled(_capacity, null);
    _length = 0;
  }

  @override
  int get length => _length;

  @override
  set length(int newLength) {
    throw UnsupportedError('Setting new length is not supported.');
  }

  @override
  void add(T? element) {
    _index = (_index + 1) % _capacity;
    _buffer[_index] = element;
    _length = min(_length + 1, _capacity);
  }

  @override
  T? operator [](int index) {
    if (_index < 0 || index >= length) {
      throw RangeError.index(index, _buffer);
    }

    return _buffer[index];
  }

  @override
  void clear() {
    _index = 0;
    _length = 0;
  }

  @override
  void operator []=(int index, T? value) {
    throw UnsupportedError(
        'Direct write access with index is not permitted, use add(T element)');
  }
}
