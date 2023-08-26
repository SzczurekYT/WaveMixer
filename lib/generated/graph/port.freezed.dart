// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../../src/graph/port.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Port {
  String get id => throw _privateConstructorUsedError;
  String get nodeId => throw _privateConstructorUsedError;
  PortType get type => throw _privateConstructorUsedError;
  PortDirection get direction => throw _privateConstructorUsedError;
  ISet<Link> get links => throw _privateConstructorUsedError;
  GlobalKey<State<StatefulWidget>> get widgetKey =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PortCopyWith<Port> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PortCopyWith<$Res> {
  factory $PortCopyWith(Port value, $Res Function(Port) then) =
      _$PortCopyWithImpl<$Res, Port>;
  @useResult
  $Res call(
      {String id,
      String nodeId,
      PortType type,
      PortDirection direction,
      ISet<Link> links,
      GlobalKey<State<StatefulWidget>> widgetKey});
}

/// @nodoc
class _$PortCopyWithImpl<$Res, $Val extends Port>
    implements $PortCopyWith<$Res> {
  _$PortCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? nodeId = null,
    Object? type = null,
    Object? direction = null,
    Object? links = null,
    Object? widgetKey = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      nodeId: null == nodeId
          ? _value.nodeId
          : nodeId // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as PortType,
      direction: null == direction
          ? _value.direction
          : direction // ignore: cast_nullable_to_non_nullable
              as PortDirection,
      links: null == links
          ? _value.links
          : links // ignore: cast_nullable_to_non_nullable
              as ISet<Link>,
      widgetKey: null == widgetKey
          ? _value.widgetKey
          : widgetKey // ignore: cast_nullable_to_non_nullable
              as GlobalKey<State<StatefulWidget>>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PortCopyWith<$Res> implements $PortCopyWith<$Res> {
  factory _$$_PortCopyWith(_$_Port value, $Res Function(_$_Port) then) =
      __$$_PortCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String nodeId,
      PortType type,
      PortDirection direction,
      ISet<Link> links,
      GlobalKey<State<StatefulWidget>> widgetKey});
}

/// @nodoc
class __$$_PortCopyWithImpl<$Res> extends _$PortCopyWithImpl<$Res, _$_Port>
    implements _$$_PortCopyWith<$Res> {
  __$$_PortCopyWithImpl(_$_Port _value, $Res Function(_$_Port) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? nodeId = null,
    Object? type = null,
    Object? direction = null,
    Object? links = null,
    Object? widgetKey = null,
  }) {
    return _then(_$_Port(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      nodeId: null == nodeId
          ? _value.nodeId
          : nodeId // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as PortType,
      direction: null == direction
          ? _value.direction
          : direction // ignore: cast_nullable_to_non_nullable
              as PortDirection,
      links: null == links
          ? _value.links
          : links // ignore: cast_nullable_to_non_nullable
              as ISet<Link>,
      widgetKey: null == widgetKey
          ? _value.widgetKey
          : widgetKey // ignore: cast_nullable_to_non_nullable
              as GlobalKey<State<StatefulWidget>>,
    ));
  }
}

/// @nodoc

class _$_Port extends _Port {
  const _$_Port(
      {required this.id,
      required this.nodeId,
      required this.type,
      required this.direction,
      required this.links,
      required this.widgetKey})
      : super._();

  @override
  final String id;
  @override
  final String nodeId;
  @override
  final PortType type;
  @override
  final PortDirection direction;
  @override
  final ISet<Link> links;
  @override
  final GlobalKey<State<StatefulWidget>> widgetKey;

  @override
  String toString() {
    return 'Port(id: $id, nodeId: $nodeId, type: $type, direction: $direction, links: $links, widgetKey: $widgetKey)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Port &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.nodeId, nodeId) || other.nodeId == nodeId) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.direction, direction) ||
                other.direction == direction) &&
            const DeepCollectionEquality().equals(other.links, links) &&
            (identical(other.widgetKey, widgetKey) ||
                other.widgetKey == widgetKey));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, nodeId, type, direction,
      const DeepCollectionEquality().hash(links), widgetKey);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PortCopyWith<_$_Port> get copyWith =>
      __$$_PortCopyWithImpl<_$_Port>(this, _$identity);
}

abstract class _Port extends Port {
  const factory _Port(
      {required final String id,
      required final String nodeId,
      required final PortType type,
      required final PortDirection direction,
      required final ISet<Link> links,
      required final GlobalKey<State<StatefulWidget>> widgetKey}) = _$_Port;
  const _Port._() : super._();

  @override
  String get id;
  @override
  String get nodeId;
  @override
  PortType get type;
  @override
  PortDirection get direction;
  @override
  ISet<Link> get links;
  @override
  GlobalKey<State<StatefulWidget>> get widgetKey;
  @override
  @JsonKey(ignore: true)
  _$$_PortCopyWith<_$_Port> get copyWith => throw _privateConstructorUsedError;
}
