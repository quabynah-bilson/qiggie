///
//  Generated code. Do not modify.
//  source: auth.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,deprecated_member_use_from_same_package,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use phoneVerificationStatusDescriptor instead')
const PhoneVerificationStatus$json = const {
  '1': 'PhoneVerificationStatus',
  '2': const [
    const {'1': 'none', '2': 0},
    const {'1': 'code_sent', '2': 1},
    const {'1': 'verified', '2': 2},
    const {'1': 'error', '2': 3},
  ],
};

/// Descriptor for `PhoneVerificationStatus`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List phoneVerificationStatusDescriptor = $convert.base64Decode('ChdQaG9uZVZlcmlmaWNhdGlvblN0YXR1cxIICgRub25lEAASDQoJY29kZV9zZW50EAESDAoIdmVyaWZpZWQQAhIJCgVlcnJvchAD');
@$core.Deprecated('Use verifyAuthCodeDescriptor instead')
const VerifyAuthCode$json = const {
  '1': 'VerifyAuthCode',
  '2': const [
    const {'1': 'code', '3': 1, '4': 1, '5': 5, '10': 'code'},
    const {'1': 'phone_number', '3': 2, '4': 1, '5': 9, '10': 'phoneNumber'},
  ],
};

/// Descriptor for `VerifyAuthCode`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List verifyAuthCodeDescriptor = $convert.base64Decode('Cg5WZXJpZnlBdXRoQ29kZRISCgRjb2RlGAEgASgFUgRjb2RlEiEKDHBob25lX251bWJlchgCIAEoCVILcGhvbmVOdW1iZXI=');
@$core.Deprecated('Use authCodeResponseDescriptor instead')
const AuthCodeResponse$json = const {
  '1': 'AuthCodeResponse',
  '2': const [
    const {'1': 'status', '3': 1, '4': 1, '5': 14, '6': '.auth.PhoneVerificationStatus', '10': 'status'},
    const {'1': 'successful', '3': 2, '4': 1, '5': 8, '10': 'successful'},
    const {'1': 'message', '3': 3, '4': 1, '5': 9, '10': 'message'},
  ],
};

/// Descriptor for `AuthCodeResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List authCodeResponseDescriptor = $convert.base64Decode('ChBBdXRoQ29kZVJlc3BvbnNlEjUKBnN0YXR1cxgBIAEoDjIdLmF1dGguUGhvbmVWZXJpZmljYXRpb25TdGF0dXNSBnN0YXR1cxIeCgpzdWNjZXNzZnVsGAIgASgIUgpzdWNjZXNzZnVsEhgKB21lc3NhZ2UYAyABKAlSB21lc3NhZ2U=');
@$core.Deprecated('Use authResponseDescriptor instead')
const AuthResponse$json = const {
  '1': 'AuthResponse',
  '2': const [
    const {'1': 'account', '3': 1, '4': 1, '5': 11, '6': '.auth.Account', '10': 'account'},
    const {'1': 'session', '3': 2, '4': 1, '5': 11, '6': '.auth.Session', '10': 'session'},
  ],
};

/// Descriptor for `AuthResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List authResponseDescriptor = $convert.base64Decode('CgxBdXRoUmVzcG9uc2USJwoHYWNjb3VudBgBIAEoCzINLmF1dGguQWNjb3VudFIHYWNjb3VudBInCgdzZXNzaW9uGAIgASgLMg0uYXV0aC5TZXNzaW9uUgdzZXNzaW9u');
@$core.Deprecated('Use loginRequestDescriptor instead')
const LoginRequest$json = const {
  '1': 'LoginRequest',
  '2': const [
    const {'1': 'username', '3': 1, '4': 1, '5': 9, '10': 'username'},
    const {'1': 'password', '3': 2, '4': 1, '5': 9, '10': 'password'},
  ],
};

/// Descriptor for `LoginRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List loginRequestDescriptor = $convert.base64Decode('CgxMb2dpblJlcXVlc3QSGgoIdXNlcm5hbWUYASABKAlSCHVzZXJuYW1lEhoKCHBhc3N3b3JkGAIgASgJUghwYXNzd29yZA==');
@$core.Deprecated('Use createAccountRequestDescriptor instead')
const CreateAccountRequest$json = const {
  '1': 'CreateAccountRequest',
  '2': const [
    const {'1': 'username', '3': 1, '4': 1, '5': 9, '10': 'username'},
    const {'1': 'password', '3': 2, '4': 1, '5': 9, '10': 'password'},
    const {'1': 'display_name', '3': 3, '4': 1, '5': 9, '10': 'displayName'},
    const {'1': 'phone_number', '3': 4, '4': 1, '5': 9, '10': 'phoneNumber'},
  ],
};

/// Descriptor for `CreateAccountRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createAccountRequestDescriptor = $convert.base64Decode('ChRDcmVhdGVBY2NvdW50UmVxdWVzdBIaCgh1c2VybmFtZRgBIAEoCVIIdXNlcm5hbWUSGgoIcGFzc3dvcmQYAiABKAlSCHBhc3N3b3JkEiEKDGRpc3BsYXlfbmFtZRgDIAEoCVILZGlzcGxheU5hbWUSIQoMcGhvbmVfbnVtYmVyGAQgASgJUgtwaG9uZU51bWJlcg==');
@$core.Deprecated('Use accountDescriptor instead')
const Account$json = const {
  '1': 'Account',
  '2': const [
    const {'1': 'username', '3': 1, '4': 1, '5': 9, '10': 'username'},
    const {'1': 'password', '3': 2, '4': 1, '5': 9, '10': 'password'},
    const {'1': 'display_name', '3': 3, '4': 1, '5': 9, '10': 'displayName'},
    const {'1': 'phone_number', '3': 4, '4': 1, '5': 9, '10': 'phoneNumber'},
  ],
};

/// Descriptor for `Account`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List accountDescriptor = $convert.base64Decode('CgdBY2NvdW50EhoKCHVzZXJuYW1lGAEgASgJUgh1c2VybmFtZRIaCghwYXNzd29yZBgCIAEoCVIIcGFzc3dvcmQSIQoMZGlzcGxheV9uYW1lGAMgASgJUgtkaXNwbGF5TmFtZRIhCgxwaG9uZV9udW1iZXIYBCABKAlSC3Bob25lTnVtYmVy');
@$core.Deprecated('Use sessionDescriptor instead')
const Session$json = const {
  '1': 'Session',
  '2': const [
    const {'1': 'access_token', '3': 1, '4': 1, '5': 9, '10': 'accessToken'},
    const {'1': 'refresh_token', '3': 2, '4': 1, '5': 9, '10': 'refreshToken'},
    const {'1': 'access_token_expiry', '3': 3, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'accessTokenExpiry'},
    const {'1': 'refresh_token_expiry', '3': 4, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'refreshTokenExpiry'},
    const {'1': 'session_id', '3': 5, '4': 1, '5': 9, '10': 'sessionId'},
    const {
      '1': 'created_at',
      '3': 6,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '8': const {'5': true},
      '10': 'createdAt',
    },
  ],
};

/// Descriptor for `Session`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List sessionDescriptor = $convert.base64Decode('CgdTZXNzaW9uEiEKDGFjY2Vzc190b2tlbhgBIAEoCVILYWNjZXNzVG9rZW4SIwoNcmVmcmVzaF90b2tlbhgCIAEoCVIMcmVmcmVzaFRva2VuEkoKE2FjY2Vzc190b2tlbl9leHBpcnkYAyABKAsyGi5nb29nbGUucHJvdG9idWYuVGltZXN0YW1wUhFhY2Nlc3NUb2tlbkV4cGlyeRJMChRyZWZyZXNoX3Rva2VuX2V4cGlyeRgEIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi5UaW1lc3RhbXBSEnJlZnJlc2hUb2tlbkV4cGlyeRIdCgpzZXNzaW9uX2lkGAUgASgJUglzZXNzaW9uSWQSPQoKY3JlYXRlZF9hdBgGIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi5UaW1lc3RhbXBCAigBUgljcmVhdGVkQXQ=');
