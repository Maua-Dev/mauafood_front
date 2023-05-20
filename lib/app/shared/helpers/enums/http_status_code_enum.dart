// ignore_for_file: constant_identifier_names

enum HttpStatusCodeEnum {
  OK,
  CREATED,
  NO_CONTENT,
  REDIRECT,
  BAD_REQUEST,
  UNAUTHORIZED,
  FORBIDDEN,
  NOT_FOUND,
  METHOD_NOT_ALLOWED,
  CONFLICT,
  INTERNAL_SERVER_ERROR,
  BAD_GATEWAY,
  SERVICE_UNAVAILABLE,
  GATEWAY_TIMEOUT,
  UNKNOWN,
}

extension HttpErrorTypeEnumExtension on HttpStatusCodeEnum {
  int get statusCode {
    switch (this) {
      case HttpStatusCodeEnum.OK:
        return 200;
      case HttpStatusCodeEnum.CREATED:
        return 201;
      case HttpStatusCodeEnum.NO_CONTENT:
        return 204;
      case HttpStatusCodeEnum.REDIRECT:
        return 303;
      case HttpStatusCodeEnum.BAD_REQUEST:
        return 400;
      case HttpStatusCodeEnum.UNAUTHORIZED:
        return 401;
      case HttpStatusCodeEnum.FORBIDDEN:
        return 403;
      case HttpStatusCodeEnum.NOT_FOUND:
        return 404;
      case HttpStatusCodeEnum.METHOD_NOT_ALLOWED:
        return 405;
      case HttpStatusCodeEnum.CONFLICT:
        return 409;
      case HttpStatusCodeEnum.INTERNAL_SERVER_ERROR:
        return 500;
      case HttpStatusCodeEnum.BAD_GATEWAY:
        return 502;
      case HttpStatusCodeEnum.SERVICE_UNAVAILABLE:
        return 503;
      case HttpStatusCodeEnum.GATEWAY_TIMEOUT:
        return 504;
      case HttpStatusCodeEnum.UNKNOWN:
        return 0;
    }
  }

  String get errorMessage {
    // COLOCAR NO INTERNATIONALIZATION
    switch (this) {
      case HttpStatusCodeEnum.OK:
        return 'A requisição foi concluída com sucesso.';
      case HttpStatusCodeEnum.CREATED:
        return 'A requisição foi concluída com sucesso e um novo recurso foi criado.';
      case HttpStatusCodeEnum.NO_CONTENT:
        return 'A requisição foi concluída com sucesso, mas não há conteúdo para ser exibido.';
      case HttpStatusCodeEnum.REDIRECT:
        return 'A requisição foi redirecionada com sucesso.';
      case HttpStatusCodeEnum.BAD_REQUEST:
        return 'A requisição não pôde ser processada devido a um erro de sintaxe.';
      case HttpStatusCodeEnum.UNAUTHORIZED:
        return 'A requisição não foi autorizada, por favor faça login novamente.';
      case HttpStatusCodeEnum.FORBIDDEN:
        return 'A requisição foi recusada pelo servidor.';
      case HttpStatusCodeEnum.NOT_FOUND:
        return 'O recurso requisitado não foi encontrado no servidor.';
      case HttpStatusCodeEnum.METHOD_NOT_ALLOWED:
        return 'O método utilizado na requisição não é permitido para o recurso requisitado.';
      case HttpStatusCodeEnum.CONFLICT:
        return 'A requisição conflitou com um recurso já existente no servidor.';
      case HttpStatusCodeEnum.INTERNAL_SERVER_ERROR:
        return 'Houve um erro interno no servidor.';
      case HttpStatusCodeEnum.BAD_GATEWAY:
        return 'Houve um erro ao processar a requisição.';
      case HttpStatusCodeEnum.SERVICE_UNAVAILABLE:
        return 'O servidor não está disponível no momento.';
      case HttpStatusCodeEnum.GATEWAY_TIMEOUT:
        return 'A requisição atingiu o tempo limite.';
      case HttpStatusCodeEnum.UNKNOWN:
        return 'Ocorreu um erro desconhecido.';
    }
  }
}
