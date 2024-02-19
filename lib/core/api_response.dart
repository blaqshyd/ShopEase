class ApiResponse<T> {
  final T? data;
  final bool status;
  final String? err;
  final StackTrace? stackTrace;
  const ApiResponse({
    this.data,
    this.err,
    this.status = false,
    this.stackTrace,
  });
}
