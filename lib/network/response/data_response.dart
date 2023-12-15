abstract class DataResponse<T> {
  String? errorMessage;
  T? dataModel;
  DataResponse({this.dataModel, this.errorMessage});
}

class ResponseSuccess<T> extends DataResponse<T> {
  T data;
  ResponseSuccess(this.data) : super(dataModel: data);
}

class ResponseFaild<T> extends DataResponse<T> {
  String? message;
  ResponseFaild(this.message) : super(errorMessage: message);
}
