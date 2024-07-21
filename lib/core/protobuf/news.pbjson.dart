//
//  Generated code. Do not modify.
//  source: news.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use newsRequestDescriptor instead')
const NewsRequest$json = {
  '1': 'NewsRequest',
  '2': [
    {'1': 'category', '3': 1, '4': 1, '5': 9, '10': 'category'},
    {'1': 'page', '3': 2, '4': 1, '5': 5, '10': 'page'},
  ],
};

/// Descriptor for `NewsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List newsRequestDescriptor = $convert.base64Decode(
    'CgtOZXdzUmVxdWVzdBIaCghjYXRlZ29yeRgBIAEoCVIIY2F0ZWdvcnkSEgoEcGFnZRgCIAEoBV'
    'IEcGFnZQ==');

