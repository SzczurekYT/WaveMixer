// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../../src/graph/node.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Node {
  String get name => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;
  IMap<String, Port> get ports => throw _privateConstructorUsedError;
  Offset get position => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NodeCopyWith<Node> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NodeCopyWith<$Res> {
  factory $NodeCopyWith(Node value, $Res Function(Node) then) =
      _$NodeCopyWithImpl<$Res, Node>;
  @useResult
  $Res call(
      {String name, String id, IMap<String, Port> ports, Offset position});
}

/// @nodoc
class _$NodeCopyWithImpl<$Res, $Val extends Node>
    implements $NodeCopyWith<$Res> {
  _$NodeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? id = null,
    Object? ports = null,
    Object? position = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      ports: null == ports
          ? _value.ports
          : ports // ignore: cast_nullable_to_non_nullable
              as IMap<String, Port>,
      position: null == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as Offset,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_NodeCopyWith<$Res> implements $NodeCopyWith<$Res> {
  factory _$$_NodeCopyWith(_$_Node value, $Res Function(_$_Node) then) =
      __$$_NodeCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name, String id, IMap<String, Port> ports, Offset position});
}

/// @nodoc
class __$$_NodeCopyWithImpl<$Res> extends _$NodeCopyWithImpl<$Res, _$_Node>
    implements _$$_NodeCopyWith<$Res> {
  __$$_NodeCopyWithImpl(_$_Node _value, $Res Function(_$_Node) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? id = null,
    Object? ports = null,
    Object? position = null,
  }) {
    return _then(_$_Node(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      ports: null == ports
          ? _value.ports
          : ports // ignore: cast_nullable_to_non_nullable
              as IMap<String, Port>,
      position: null == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as Offset,
    ));
  }
}

/// @nodoc

class _$_Node extends _Node {
  const _$_Node(
      {required this.name,
      required this.id,
      required this.ports,
      required this.position})
      : super._();

  @override
  final String name;
  @override
  final String id;
  @override
  final IMap<String, Port> ports;
  @override
  final Offset position;

  @override
  String toString() {
    return 'Node(name: $name, id: $id, ports: $ports, position: $position)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Node &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.ports, ports) || other.ports == ports) &&
            (identical(other.position, position) ||
                other.position == position));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name, id, ports, position);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_NodeCopyWith<_$_Node> get copyWith =>
      __$$_NodeCopyWithImpl<_$_Node>(this, _$identity);
}

abstract class _Node extends Node {
  const factory _Node(
      {required final String name,
      required final String id,
      required final IMap<String, Port> ports,
      required final Offset position}) = _$_Node;
  const _Node._() : super._();

  @override
  String get name;
  @override
  String get id;
  @override
  IMap<String, Port> get ports;
  @override
  Offset get position;
  @override
  @JsonKey(ignore: true)
  _$$_NodeCopyWith<_$_Node> get copyWith => throw _privateConstructorUsedError;
}
