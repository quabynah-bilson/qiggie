///
//  Generated code. Do not modify.
//  source: savings.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'package:protobuf_google/protobuf_google.dart' as $2;

class ListSavingsRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ListSavingsRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'savings'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'customerId')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'piggybankId')
    ..hasRequiredFields = false
  ;

  ListSavingsRequest._() : super();
  factory ListSavingsRequest({
    $core.String? customerId,
    $core.String? piggybankId,
  }) {
    final _result = create();
    if (customerId != null) {
      _result.customerId = customerId;
    }
    if (piggybankId != null) {
      _result.piggybankId = piggybankId;
    }
    return _result;
  }
  factory ListSavingsRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListSavingsRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListSavingsRequest clone() => ListSavingsRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListSavingsRequest copyWith(void Function(ListSavingsRequest) updates) => super.copyWith((message) => updates(message as ListSavingsRequest)) as ListSavingsRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ListSavingsRequest create() => ListSavingsRequest._();
  ListSavingsRequest createEmptyInstance() => create();
  static $pb.PbList<ListSavingsRequest> createRepeated() => $pb.PbList<ListSavingsRequest>();
  @$core.pragma('dart2js:noInline')
  static ListSavingsRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListSavingsRequest>(create);
  static ListSavingsRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get customerId => $_getSZ(0);
  @$pb.TagNumber(1)
  set customerId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCustomerId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCustomerId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get piggybankId => $_getSZ(1);
  @$pb.TagNumber(2)
  set piggybankId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPiggybankId() => $_has(1);
  @$pb.TagNumber(2)
  void clearPiggybankId() => clearField(2);
}

class SavingsResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'SavingsResponse', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'savings'), createEmptyInstance: create)
    ..pc<Savings>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'savings', $pb.PbFieldType.PM, subBuilder: Savings.create)
    ..hasRequiredFields = false
  ;

  SavingsResponse._() : super();
  factory SavingsResponse({
    $core.Iterable<Savings>? savings,
  }) {
    final _result = create();
    if (savings != null) {
      _result.savings.addAll(savings);
    }
    return _result;
  }
  factory SavingsResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SavingsResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SavingsResponse clone() => SavingsResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SavingsResponse copyWith(void Function(SavingsResponse) updates) => super.copyWith((message) => updates(message as SavingsResponse)) as SavingsResponse; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SavingsResponse create() => SavingsResponse._();
  SavingsResponse createEmptyInstance() => create();
  static $pb.PbList<SavingsResponse> createRepeated() => $pb.PbList<SavingsResponse>();
  @$core.pragma('dart2js:noInline')
  static SavingsResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SavingsResponse>(create);
  static SavingsResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<Savings> get savings => $_getList(0);
}

class Savings extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Savings', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'savings'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'piggybankId')
    ..a<$core.double>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'amount', $pb.PbFieldType.OD)
    ..aOM<$2.Timestamp>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'transactionDate', subBuilder: $2.Timestamp.create)
    ..hasRequiredFields = false
  ;

  Savings._() : super();
  factory Savings({
    $core.String? id,
    $core.String? piggybankId,
    $core.double? amount,
    $2.Timestamp? transactionDate,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (piggybankId != null) {
      _result.piggybankId = piggybankId;
    }
    if (amount != null) {
      _result.amount = amount;
    }
    if (transactionDate != null) {
      _result.transactionDate = transactionDate;
    }
    return _result;
  }
  factory Savings.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Savings.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Savings clone() => Savings()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Savings copyWith(void Function(Savings) updates) => super.copyWith((message) => updates(message as Savings)) as Savings; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Savings create() => Savings._();
  Savings createEmptyInstance() => create();
  static $pb.PbList<Savings> createRepeated() => $pb.PbList<Savings>();
  @$core.pragma('dart2js:noInline')
  static Savings getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Savings>(create);
  static Savings? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get piggybankId => $_getSZ(1);
  @$pb.TagNumber(2)
  set piggybankId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPiggybankId() => $_has(1);
  @$pb.TagNumber(2)
  void clearPiggybankId() => clearField(2);

  @$pb.TagNumber(3)
  $core.double get amount => $_getN(2);
  @$pb.TagNumber(3)
  set amount($core.double v) { $_setDouble(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasAmount() => $_has(2);
  @$pb.TagNumber(3)
  void clearAmount() => clearField(3);

  @$pb.TagNumber(4)
  $2.Timestamp get transactionDate => $_getN(3);
  @$pb.TagNumber(4)
  set transactionDate($2.Timestamp v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasTransactionDate() => $_has(3);
  @$pb.TagNumber(4)
  void clearTransactionDate() => clearField(4);
  @$pb.TagNumber(4)
  $2.Timestamp ensureTransactionDate() => $_ensure(3);
}

