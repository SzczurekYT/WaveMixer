// class KeyedList<K, V> implements Map<K, V> {
//   final K Function(V value) _ketGetter;
//   final Map<K, V> _map;

//   // UnmodifiableMapView<K, V> get map => UnmodifiableMapView(_map);

//   KeyedList(final K Function(V value) keyGetter, {Map<K, V>? initialData})
//       : _ketGetter = keyGetter,
//         _map = initialData ?? {};

//   void add(V value) {
//     _map[_ketGetter(value)] = value;
//   }

//   void rm(V value) {
//     _map.remove(_ketGetter(value));
//   }

//   @override
//   V? operator [](Object? key) {
//     return _map[key];
//   }

//   @override
//   void operator []=(K key, V value) {
//     _map[key] = value;
//   }

//   @override
//   void addAll(Map<K, V> other) {
//     _map.addAll(other);
//   }

//   @override
//   void addEntries(Iterable<MapEntry<K, V>> newEntries) {
//     _map.addEntries(newEntries);
//   }

//   @override
//   Map<RK, RV> cast<RK, RV>() {
//     return _map.cast<RK, RV>();
//   }

//   @override
//   void clear() {
//     _map.clear();
//   }

//   @override
//   bool containsKey(Object? key) {
//     return _map.containsKey(key);
//   }

//   @override
//   bool containsValue(Object? value) {
//     return _map.containsValue(value);
//   }

//   @override
//   Iterable<MapEntry<K, V>> get entries => _map.entries;

//   @override
//   void forEach(void Function(K key, V value) action) {
//     _map.forEach(action);
//   }

//   @override
//   bool get isEmpty => _map.isEmpty;

//   @override
//   bool get isNotEmpty => _map.isNotEmpty;

//   @override
//   Iterable<K> get keys => _map.keys;

//   @override
//   int get length => _map.length;

//   @override
//   Map<K2, V2> map<K2, V2>(MapEntry<K2, V2> Function(K key, V value) convert) {
//     return _map.map(convert);
//   }

//   @override
//   V putIfAbsent(K key, V Function() ifAbsent) {
//     return _map.putIfAbsent(key, ifAbsent);
//   }

//   @override
//   V? remove(Object? key) {
//     return _map.remove(key);
//   }

//   @override
//   void removeWhere(bool Function(K key, V value) test) {
//     _map.removeWhere(test);
//   }

//   @override
//   V update(K key, V Function(V value) update, {V Function()? ifAbsent}) {
//     return _map.update(key, update, ifAbsent: ifAbsent);
//   }

//   @override
//   void updateAll(V Function(K key, V value) update) {
//     _map.updateAll(update);
//   }

//   @override
//   Iterable<V> get values => _map.values;
// }
