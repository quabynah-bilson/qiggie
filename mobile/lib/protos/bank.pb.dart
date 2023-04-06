///
//  Generated code. Do not modify.
//  source: bank.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'package:protobuf_google/protobuf_google.dart' as $3;

class PiggyBankList extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'PiggyBankList', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'bank'), createEmptyInstance: create)
    ..pc<PiggyBank>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'banks', $pb.PbFieldType.PM, subBuilder: PiggyBank.create)
    ..hasRequiredFields = false
  ;

  PiggyBankList._() : super();
  factory PiggyBankList({
    $core.Iterable<PiggyBank>? banks,
  }) {
    final _result = create();
    if (banks != null) {
      _result.banks.addAll(banks);
    }
    return _result;
  }
  factory PiggyBankList.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PiggyBankList.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PiggyBankList clone() => PiggyBankList()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PiggyBankList copyWith(void Function(PiggyBankList) updates) => super.copyWith((message) => updates(message as PiggyBankList)) as PiggyBankList; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PiggyBankList create() => PiggyBankList._();
  PiggyBankList createEmptyInstance() => create();
  static $pb.PbList<PiggyBankList> createRepeated() => $pb.PbList<PiggyBankList>();
  @$core.pragma('dart2js:noInline')
  static PiggyBankList getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PiggyBankList>(create);
  static PiggyBankList? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<PiggyBank> get banks => $_getList(0);
}

class PiggyBank extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'PiggyBank', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'bank'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'customerId')
    ..a<$core.double>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'goalAmount', $pb.PbFieldType.OD)
    ..a<$core.double>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'currentAmount', $pb.PbFieldType.OD)
    ..aOS(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'description')
    ..aOM<$3.Timestamp>(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'createdAt', subBuilder: $3.Timestamp.create)
    ..aOM<$3.Timestamp>(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'updatedAt', subBuilder: $3.Timestamp.create)
    ..hasRequiredFields = false
  ;

  PiggyBank._() : super();
  factory PiggyBank({
    $core.String? id,
    $core.String? customerId,
    $core.double? goalAmount,
    $core.double? currentAmount,
    $core.String? description,
    $3.Timestamp? createdAt,
    $3.Timestamp? updatedAt,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (customerId != null) {
      _result.customerId = customerId;
    }
    if (goalAmount != null) {
      _result.goalAmount = goalAmount;
    }
    if (currentAmount != null) {
      _result.currentAmount = currentAmount;
    }
    if (description != null) {
      _result.description = description;
    }
    if (createdAt != null) {
      _result.createdAt = createdAt;
    }
    if (updatedAt != null) {
      _result.updatedAt = updatedAt;
    }
    return _result;
  }
  factory PiggyBank.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PiggyBank.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PiggyBank clone() => PiggyBank()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PiggyBank copyWith(void Function(PiggyBank) updates) => super.copyWith((message) => updates(message as PiggyBank)) as PiggyBank; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PiggyBank create() => PiggyBank._();
  PiggyBank createEmptyInstance() => create();
  static $pb.PbList<PiggyBank> createRepeated() => $pb.PbList<PiggyBank>();
  @$core.pragma('dart2js:noInline')
  static PiggyBank getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PiggyBank>(create);
  static PiggyBank? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get customerId => $_getSZ(1);
  @$pb.TagNumber(2)
  set customerId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasCustomerId() => $_has(1);
  @$pb.TagNumber(2)
  void clearCustomerId() => clearField(2);

  @$pb.TagNumber(3)
  $core.double get goalAmount => $_getN(2);
  @$pb.TagNumber(3)
  set goalAmount($core.double v) { $_setDouble(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasGoalAmount() => $_has(2);
  @$pb.TagNumber(3)
  void clearGoalAmount() => clearField(3);

  @$pb.TagNumber(4)
  $core.double get currentAmount => $_getN(3);
  @$pb.TagNumber(4)
  set currentAmount($core.double v) { $_setDouble(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasCurrentAmount() => $_has(3);
  @$pb.TagNumber(4)
  void clearCurrentAmount() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get description => $_getSZ(4);
  @$pb.TagNumber(5)
  set description($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasDescription() => $_has(4);
  @$pb.TagNumber(5)
  void clearDescription() => clearField(5);

  @$pb.TagNumber(6)
  $3.Timestamp get createdAt => $_getN(5);
  @$pb.TagNumber(6)
  set createdAt($3.Timestamp v) { setField(6, v); }
  @$pb.TagNumber(6)
  $core.bool hasCreatedAt() => $_has(5);
  @$pb.TagNumber(6)
  void clearCreatedAt() => clearField(6);
  @$pb.TagNumber(6)
  $3.Timestamp ensureCreatedAt() => $_ensure(5);

  @$pb.TagNumber(7)
  $3.Timestamp get updatedAt => $_getN(6);
  @$pb.TagNumber(7)
  set updatedAt($3.Timestamp v) { setField(7, v); }
  @$pb.TagNumber(7)
  $core.bool hasUpdatedAt() => $_has(6);
  @$pb.TagNumber(7)
  void clearUpdatedAt() => clearField(7);
  @$pb.TagNumber(7)
  $3.Timestamp ensureUpdatedAt() => $_ensure(6);
}

