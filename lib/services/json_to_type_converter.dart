import 'dart:convert';

import 'package:chopper/chopper.dart';

class JsonToTypeConverter extends JsonConverter {
  final Map<Type, Function> typeToJsonFactoryMap;

  const JsonToTypeConverter(this.typeToJsonFactoryMap);

  @override
  Response<BodyType> convertResponse<BodyType, InnerType>(Response response) {
    final body = response.copyWith<BodyType>(
      body: fromJsonData<BodyType, InnerType>(
          response.body, typeToJsonFactoryMap[InnerType] as Function),
    );

    return body;
  }

  BodyType fromJsonData<BodyType, InnerType>(
      String jsonData, Function jsonParser) {
    var jsonMap = json.decode(jsonData);

    if (jsonMap is List) {
      return jsonMap
          .map((item) => jsonParser(item as Map<String, dynamic>) as InnerType)
          .toList() as BodyType;
    }
    // jsonParser(jsonMap,'String');
    return jsonParser(jsonMap) as BodyType;
  }
}
