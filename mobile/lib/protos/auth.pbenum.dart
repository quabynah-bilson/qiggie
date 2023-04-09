///
//  Generated code. Do not modify.
//  source: auth.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

// ignore_for_file: UNDEFINED_SHOWN_NAME
import 'dart:core' as $core;
import 'package:protobuf/protobuf.dart' as $pb;

class PhoneVerificationStatus extends $pb.ProtobufEnum {
  static const PhoneVerificationStatus none = PhoneVerificationStatus._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'none');
  static const PhoneVerificationStatus code_sent = PhoneVerificationStatus._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'code_sent');
  static const PhoneVerificationStatus verified = PhoneVerificationStatus._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'verified');
  static const PhoneVerificationStatus error = PhoneVerificationStatus._(3, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'error');

  static const $core.List<PhoneVerificationStatus> values = <PhoneVerificationStatus> [
    none,
    code_sent,
    verified,
    error,
  ];

  static final $core.Map<$core.int, PhoneVerificationStatus> _byValue = $pb.ProtobufEnum.initByValue(values);
  static PhoneVerificationStatus? valueOf($core.int value) => _byValue[value];

  const PhoneVerificationStatus._($core.int v, $core.String n) : super(v, n);
}

