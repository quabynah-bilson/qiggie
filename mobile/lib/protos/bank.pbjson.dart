///
//  Generated code. Do not modify.
//  source: bank.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,deprecated_member_use_from_same_package,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use piggyBankListDescriptor instead')
const PiggyBankList$json = const {
  '1': 'PiggyBankList',
  '2': const [
    const {'1': 'banks', '3': 1, '4': 3, '5': 11, '6': '.bank.PiggyBank', '10': 'banks'},
  ],
};

/// Descriptor for `PiggyBankList`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List piggyBankListDescriptor = $convert.base64Decode('Cg1QaWdneUJhbmtMaXN0EiUKBWJhbmtzGAEgAygLMg8uYmFuay5QaWdneUJhbmtSBWJhbmtz');
@$core.Deprecated('Use piggyBankDescriptor instead')
const PiggyBank$json = const {
  '1': 'PiggyBank',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    const {'1': 'customer_id', '3': 2, '4': 1, '5': 9, '10': 'customerId'},
    const {'1': 'goal_amount', '3': 3, '4': 1, '5': 1, '10': 'goalAmount'},
    const {'1': 'current_amount', '3': 4, '4': 1, '5': 1, '10': 'currentAmount'},
    const {'1': 'description', '3': 5, '4': 1, '5': 9, '10': 'description'},
    const {'1': 'created_at', '3': 6, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'createdAt'},
    const {'1': 'updated_at', '3': 7, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'updatedAt'},
  ],
};

/// Descriptor for `PiggyBank`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List piggyBankDescriptor = $convert.base64Decode('CglQaWdneUJhbmsSDgoCaWQYASABKAlSAmlkEh8KC2N1c3RvbWVyX2lkGAIgASgJUgpjdXN0b21lcklkEh8KC2dvYWxfYW1vdW50GAMgASgBUgpnb2FsQW1vdW50EiUKDmN1cnJlbnRfYW1vdW50GAQgASgBUg1jdXJyZW50QW1vdW50EiAKC2Rlc2NyaXB0aW9uGAUgASgJUgtkZXNjcmlwdGlvbhI5CgpjcmVhdGVkX2F0GAYgASgLMhouZ29vZ2xlLnByb3RvYnVmLlRpbWVzdGFtcFIJY3JlYXRlZEF0EjkKCnVwZGF0ZWRfYXQYByABKAsyGi5nb29nbGUucHJvdG9idWYuVGltZXN0YW1wUgl1cGRhdGVkQXQ=');
