///
//  Generated code. Do not modify.
//  source: proto/zsh_demo.proto
//
// @dart = 2.3
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

// ignore_for_file: UNDEFINED_SHOWN_NAME
import 'dart:core' as $core;
import 'package:protobuf/protobuf.dart' as $pb;

class NIMLoginStep_State extends $pb.ProtobufEnum {
  static const NIMLoginStep_State UN_KNOW = NIMLoginStep_State._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'UN_KNOW');
  static const NIMLoginStep_State UN_LOGIN = NIMLoginStep_State._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'UN_LOGIN');
  static const NIMLoginStep_State FORBIDDEN = NIMLoginStep_State._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'FORBIDDEN');
  static const NIMLoginStep_State VER_ERROR = NIMLoginStep_State._(3, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'VER_ERROR');

  static const $core.List<NIMLoginStep_State> values = <NIMLoginStep_State> [
    UN_KNOW,
    UN_LOGIN,
    FORBIDDEN,
    VER_ERROR,
  ];

  static final $core.Map<$core.int, NIMLoginStep_State> _byValue = $pb.ProtobufEnum.initByValue(values);
  static NIMLoginStep_State valueOf($core.int value) => _byValue[value];

  const NIMLoginStep_State._($core.int v, $core.String n) : super(v, n);
}

