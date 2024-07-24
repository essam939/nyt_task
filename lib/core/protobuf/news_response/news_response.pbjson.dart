//
//  Generated code. Do not modify.
//  source: news_response.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use newsResponseDescriptor instead')
const NewsResponse$json = {
  '1': 'NewsResponse',
  '2': [
    {'1': 'section', '3': 1, '4': 1, '5': 9, '10': 'section'},
    {'1': 'title', '3': 2, '4': 1, '5': 9, '10': 'title'},
    {'1': 'url', '3': 3, '4': 1, '5': 9, '10': 'url'},
    {'1': 'abstract', '3': 4, '4': 1, '5': 9, '10': 'abstract'},
    {'1': 'byline', '3': 5, '4': 1, '5': 9, '10': 'byline'},
    {'1': 'published_date', '3': 6, '4': 1, '5': 9, '10': 'publishedDate'},
  ],
};

/// Descriptor for `NewsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List newsResponseDescriptor = $convert.base64Decode(
    'CgxOZXdzUmVzcG9uc2USGAoHc2VjdGlvbhgBIAEoCVIHc2VjdGlvbhIUCgV0aXRsZRgCIAEoCV'
    'IFdGl0bGUSEAoDdXJsGAMgASgJUgN1cmwSGgoIYWJzdHJhY3QYBCABKAlSCGFic3RyYWN0EhYK'
    'BmJ5bGluZRgFIAEoCVIGYnlsaW5lEiUKDnB1Ymxpc2hlZF9kYXRlGAYgASgJUg1wdWJsaXNoZW'
    'REYXRl');

@$core.Deprecated('Use getNewsRequestDescriptor instead')
const GetNewsRequest$json = {
  '1': 'GetNewsRequest',
};

/// Descriptor for `GetNewsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getNewsRequestDescriptor = $convert.base64Decode(
    'Cg5HZXROZXdzUmVxdWVzdA==');

@$core.Deprecated('Use getNewsResponseDescriptor instead')
const GetNewsResponse$json = {
  '1': 'GetNewsResponse',
  '2': [
    {'1': 'news', '3': 1, '4': 3, '5': 11, '6': '.news.NewsResponse', '10': 'news'},
  ],
};

/// Descriptor for `GetNewsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getNewsResponseDescriptor = $convert.base64Decode(
    'Cg9HZXROZXdzUmVzcG9uc2USJgoEbmV3cxgBIAMoCzISLm5ld3MuTmV3c1Jlc3BvbnNlUgRuZX'
    'dz');

const $core.Map<$core.String, $core.dynamic> NewsServiceBase$json = {
  '1': 'NewsService',
  '2': [
    {'1': 'GetNews', '2': '.news.GetNewsRequest', '3': '.news.GetNewsResponse'},
  ],
};

@$core.Deprecated('Use newsServiceDescriptor instead')
const $core.Map<$core.String, $core.Map<$core.String, $core.dynamic>> NewsServiceBase$messageJson = {
  '.news.GetNewsRequest': GetNewsRequest$json,
  '.news.GetNewsResponse': GetNewsResponse$json,
  '.news.NewsResponse': NewsResponse$json,
};

/// Descriptor for `NewsService`. Decode as a `google.protobuf.ServiceDescriptorProto`.
final $typed_data.Uint8List newsServiceDescriptor = $convert.base64Decode(
    'CgtOZXdzU2VydmljZRI2CgdHZXROZXdzEhQubmV3cy5HZXROZXdzUmVxdWVzdBoVLm5ld3MuR2'
    'V0TmV3c1Jlc3BvbnNl');

