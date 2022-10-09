class ApiRouterValidate {
  final List<String> _routers = [];

  ApiRouterValidate add(String route) {
    _routers.add(route);
    return this;
  }

  bool isPublic(String route) {
    return _routers.contains(route);
  }
}
