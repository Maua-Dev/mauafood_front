import '../enums/http_status_code_enum.dart';

HttpStatusCodeEnum getHttpStatusFunction(int? statusCode) {
  switch (statusCode) {
    case 204:
      return HttpStatusCodeEnum.NO_CONTENT;
    case 303:
      return HttpStatusCodeEnum.REDIRECT;
    case 400:
      return HttpStatusCodeEnum.BAD_REQUEST;
    case 401:
      return HttpStatusCodeEnum.UNAUTHORIZED;
    case 403:
      return HttpStatusCodeEnum.FORBIDDEN;
    case 404:
      return HttpStatusCodeEnum.NOT_FOUND;
    case 405:
      return HttpStatusCodeEnum.METHOD_NOT_ALLOWED;
    case 409:
      return HttpStatusCodeEnum.CONFLICT;
    case 500:
      return HttpStatusCodeEnum.INTERNAL_SERVER_ERROR;
    case 502:
      return HttpStatusCodeEnum.BAD_GATEWAY;
    case 503:
      return HttpStatusCodeEnum.SERVICE_UNAVAILABLE;
    case 504:
      return HttpStatusCodeEnum.GATEWAY_TIMEOUT;
    default:
      return HttpStatusCodeEnum.UNKNOWN;
  }
}
