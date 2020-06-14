/// Useful methods for [Map]
extension MapExtensions<K, V> on Map<K, V> {
  /// Try to get the value, return null if not present
  V get(K key) {
    if (containsKey(key)) return this[key];
    return null;
  }
}
