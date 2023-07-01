import 'package:chopper/chopper.dart';

class CustomJsonConverter extends JsonConverter {
  T _convertToType<T>(dynamic json) => _$TFromJson(json);

  @override
  Response<ResultType> convertResponse<ResultType, Item>(Response response) {
    final typedBody = _convertToType<ResultType>(response.body);
    return response.copyWith<ResultType>(body: typedBody);
  }
}
