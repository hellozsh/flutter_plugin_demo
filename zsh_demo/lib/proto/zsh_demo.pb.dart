///
//  Generated code. Do not modify.
//  source: proto/zsh_demo.proto
//
// @dart = 2.3
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'zsh_demo.pbenum.dart';

export 'zsh_demo.pbenum.dart';

class NIMAutoLoginData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'NIMAutoLoginData', createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'account')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'token')
    ..aOB(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'forcedMode', protoName: 'forcedMode')
    ..aOM<NIMLoginStep>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'step', subBuilder: NIMLoginStep.create)
    ..hasRequiredFields = false
  ;

  NIMAutoLoginData._() : super();
  factory NIMAutoLoginData() => create();
  factory NIMAutoLoginData.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory NIMAutoLoginData.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  NIMAutoLoginData clone() => NIMAutoLoginData()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  NIMAutoLoginData copyWith(void Function(NIMAutoLoginData) updates) => super.copyWith((message) => updates(message as NIMAutoLoginData)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static NIMAutoLoginData create() => NIMAutoLoginData._();
  NIMAutoLoginData createEmptyInstance() => create();
  static $pb.PbList<NIMAutoLoginData> createRepeated() => $pb.PbList<NIMAutoLoginData>();
  @$core.pragma('dart2js:noInline')
  static NIMAutoLoginData getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<NIMAutoLoginData>(create);
  static NIMAutoLoginData _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get account => $_getSZ(0);
  @$pb.TagNumber(1)
  set account($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasAccount() => $_has(0);
  @$pb.TagNumber(1)
  void clearAccount() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get token => $_getSZ(1);
  @$pb.TagNumber(2)
  set token($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasToken() => $_has(1);
  @$pb.TagNumber(2)
  void clearToken() => clearField(2);

  @$pb.TagNumber(3)
  $core.bool get forcedMode => $_getBF(2);
  @$pb.TagNumber(3)
  set forcedMode($core.bool v) { $_setBool(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasForcedMode() => $_has(2);
  @$pb.TagNumber(3)
  void clearForcedMode() => clearField(3);

  @$pb.TagNumber(4)
  NIMLoginStep get step => $_getN(3);
  @$pb.TagNumber(4)
  set step(NIMLoginStep v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasStep() => $_has(3);
  @$pb.TagNumber(4)
  void clearStep() => clearField(4);
  @$pb.TagNumber(4)
  NIMLoginStep ensureStep() => $_ensure(3);
}

class NIMLoginStep extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'NIMLoginStep', createEmptyInstance: create)
    ..e<NIMLoginStep_State>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'state', $pb.PbFieldType.OE, defaultOrMaker: NIMLoginStep_State.UN_KNOW, valueOf: NIMLoginStep_State.valueOf, enumValues: NIMLoginStep_State.values)
    ..hasRequiredFields = false
  ;

  NIMLoginStep._() : super();
  factory NIMLoginStep() => create();
  factory NIMLoginStep.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory NIMLoginStep.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  NIMLoginStep clone() => NIMLoginStep()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  NIMLoginStep copyWith(void Function(NIMLoginStep) updates) => super.copyWith((message) => updates(message as NIMLoginStep)); // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static NIMLoginStep create() => NIMLoginStep._();
  NIMLoginStep createEmptyInstance() => create();
  static $pb.PbList<NIMLoginStep> createRepeated() => $pb.PbList<NIMLoginStep>();
  @$core.pragma('dart2js:noInline')
  static NIMLoginStep getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<NIMLoginStep>(create);
  static NIMLoginStep _defaultInstance;

  @$pb.TagNumber(1)
  NIMLoginStep_State get state => $_getN(0);
  @$pb.TagNumber(1)
  set state(NIMLoginStep_State v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasState() => $_has(0);
  @$pb.TagNumber(1)
  void clearState() => clearField(1);
}

