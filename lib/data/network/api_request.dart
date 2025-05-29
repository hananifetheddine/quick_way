enum HTTPMethod { get, post, delete, put, patch }

extension HTTPMethodString on HTTPMethod {
  String get string {
    switch (this) {
      case HTTPMethod.get:
        return "get";
      case HTTPMethod.post:
        return "post";
      case HTTPMethod.delete:
        return "delete";
      case HTTPMethod.patch:
        return "patch";
      case HTTPMethod.put:
        return "put";
    }
  }
}

class APIRequestRepresentable {
  String url;
  HTTPMethod method;
  Map<String, String>? headers;
  Map<String, String>? query;
  dynamic body;

  APIRequestRepresentable(
      {required this.url,
      required this.method,
      this.headers,
      this.query,
      this.body});
}
