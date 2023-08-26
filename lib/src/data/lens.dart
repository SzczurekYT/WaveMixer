// class LensNotifier<V, S> extends FamilyNotifier<V, S> {
//   final V Function(S store) _view;
//   final S Function(S store, V value) _set;

//   LensNotifier({
//     required V Function(S store) view,
//     required S Function(S store, V value) set,
//   })  : _view = view,
//         _set = set;

//   V view(S store) => _view(store);
//   S set(S store, V value) => _set(store, value);

//   @override
//   V build(S arg) {
//     return _view(arg);
//   }

//   LensNotifier<V2, S> chain<V2>(LensNotifier<V2, V> lens) {
//     return LensNotifier(
//         view: (store) => lens.view(view(store)),
//         set: (store, value) {
//           lens.set(view(store), value);
//           return store;
//         });
//   }
// }

// final lensNotifierProvider = NotifierProviderFamily<LensNotifier, , >(LensNotifier.new);

class Lens<V, S> {
  final V Function(S store) _view;
  final S Function(S store, V value) _set;

  Lens({
    required V Function(S store) view,
    required S Function(S store, V value) set,
  })  : _view = view,
        _set = set;

  V view(S store) => _view(store);
  S set(S store, V value) => _set(store, value);

  Lens<V2, S> chain<V2>(Lens<V2, V> lens) {
    return Lens(
        view: (store) => lens.view(view(store)),
        set: (store, value) {
          set(store, lens.set(view(store), value));
          return store;
        });
  }
}


// class Lens<V, S> {
//   Lens({
//     required V Function(S store) view,
//     required S Function(S store, V value) set,
//   })  : _view = view,
//         _set = set;

//   final V Function(S store) _view;
//   final S Function(S store, V value) _set;

//   V view(S store) => _view(store);
//   S set(S store, V value) => _set(store, value);
// }
