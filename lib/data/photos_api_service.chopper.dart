// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'photos_api_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations, unnecessary_brace_in_string_interps
class _$PhotosApiService extends PhotosApiService {
  _$PhotosApiService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = PhotosApiService;

  @override
  Future<Response<dynamic>> getPhotos() {
    final Uri $url = Uri.parse('/photos/?_page=1&_limit=10');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> getPhoto(int id) {
    final Uri $url = Uri.parse('/photos/${id}');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<dynamic, dynamic>($request);
  }
}
