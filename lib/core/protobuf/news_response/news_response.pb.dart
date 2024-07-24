//
//  Generated code. Do not modify.
//  source: news_response.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class NewsResponse extends $pb.GeneratedMessage {
  factory NewsResponse({
    $core.String? section,
    $core.String? title,
    $core.String? url,
    $core.String? abstract,
    $core.String? byline,
    $core.String? publishedDate,
  }) {
    final $result = create();
    if (section != null) {
      $result.section = section;
    }
    if (title != null) {
      $result.title = title;
    }
    if (url != null) {
      $result.url = url;
    }
    if (abstract != null) {
      $result.abstract = abstract;
    }
    if (byline != null) {
      $result.byline = byline;
    }
    if (publishedDate != null) {
      $result.publishedDate = publishedDate;
    }
    return $result;
  }
  NewsResponse._() : super();
  factory NewsResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory NewsResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'NewsResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'news'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'section')
    ..aOS(2, _omitFieldNames ? '' : 'title')
    ..aOS(3, _omitFieldNames ? '' : 'url')
    ..aOS(4, _omitFieldNames ? '' : 'abstract')
    ..aOS(5, _omitFieldNames ? '' : 'byline')
    ..aOS(6, _omitFieldNames ? '' : 'publishedDate')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  NewsResponse clone() => NewsResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  NewsResponse copyWith(void Function(NewsResponse) updates) => super.copyWith((message) => updates(message as NewsResponse)) as NewsResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static NewsResponse create() => NewsResponse._();
  NewsResponse createEmptyInstance() => create();
  static $pb.PbList<NewsResponse> createRepeated() => $pb.PbList<NewsResponse>();
  @$core.pragma('dart2js:noInline')
  static NewsResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<NewsResponse>(create);
  static NewsResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get section => $_getSZ(0);
  @$pb.TagNumber(1)
  set section($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSection() => $_has(0);
  @$pb.TagNumber(1)
  void clearSection() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get title => $_getSZ(1);
  @$pb.TagNumber(2)
  set title($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasTitle() => $_has(1);
  @$pb.TagNumber(2)
  void clearTitle() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get url => $_getSZ(2);
  @$pb.TagNumber(3)
  set url($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasUrl() => $_has(2);
  @$pb.TagNumber(3)
  void clearUrl() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get abstract => $_getSZ(3);
  @$pb.TagNumber(4)
  set abstract($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasAbstract() => $_has(3);
  @$pb.TagNumber(4)
  void clearAbstract() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get byline => $_getSZ(4);
  @$pb.TagNumber(5)
  set byline($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasByline() => $_has(4);
  @$pb.TagNumber(5)
  void clearByline() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get publishedDate => $_getSZ(5);
  @$pb.TagNumber(6)
  set publishedDate($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasPublishedDate() => $_has(5);
  @$pb.TagNumber(6)
  void clearPublishedDate() => clearField(6);
}

class GetNewsRequest extends $pb.GeneratedMessage {
  factory GetNewsRequest() => create();
  GetNewsRequest._() : super();
  factory GetNewsRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetNewsRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetNewsRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'news'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetNewsRequest clone() => GetNewsRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetNewsRequest copyWith(void Function(GetNewsRequest) updates) => super.copyWith((message) => updates(message as GetNewsRequest)) as GetNewsRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetNewsRequest create() => GetNewsRequest._();
  GetNewsRequest createEmptyInstance() => create();
  static $pb.PbList<GetNewsRequest> createRepeated() => $pb.PbList<GetNewsRequest>();
  @$core.pragma('dart2js:noInline')
  static GetNewsRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetNewsRequest>(create);
  static GetNewsRequest? _defaultInstance;
}

class GetNewsResponse extends $pb.GeneratedMessage {
  factory GetNewsResponse({
    $core.Iterable<NewsResponse>? news,
  }) {
    final $result = create();
    if (news != null) {
      $result.news.addAll(news);
    }
    return $result;
  }
  GetNewsResponse._() : super();
  factory GetNewsResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetNewsResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetNewsResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'news'), createEmptyInstance: create)
    ..pc<NewsResponse>(1, _omitFieldNames ? '' : 'news', $pb.PbFieldType.PM, subBuilder: NewsResponse.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetNewsResponse clone() => GetNewsResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetNewsResponse copyWith(void Function(GetNewsResponse) updates) => super.copyWith((message) => updates(message as GetNewsResponse)) as GetNewsResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetNewsResponse create() => GetNewsResponse._();
  GetNewsResponse createEmptyInstance() => create();
  static $pb.PbList<GetNewsResponse> createRepeated() => $pb.PbList<GetNewsResponse>();
  @$core.pragma('dart2js:noInline')
  static GetNewsResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetNewsResponse>(create);
  static GetNewsResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<NewsResponse> get news => $_getList(0);
}

class NewsServiceApi {
  $pb.RpcClient _client;
  NewsServiceApi(this._client);

  $async.Future<GetNewsResponse> getNews($pb.ClientContext? ctx, GetNewsRequest request) =>
    _client.invoke<GetNewsResponse>(ctx, 'NewsService', 'GetNews', request, GetNewsResponse())
  ;
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
