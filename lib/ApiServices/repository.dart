


import 'package:nr_japan/ApiServices/operator_auth_service.dart';
import 'package:nr_japan/ApiServices/response_object.dart';

class Repository{

  final OperatorAuthService _operatorAuthService = OperatorAuthService();


  Future<ResponseObject> commonSyncRequest(Map <String, dynamic> parameters) => _operatorAuthService.commonSyncRequest(parameters);
  Future<ResponseObject> profileDetailsRequest(Map<String, dynamic> parameters) => _operatorAuthService.profileDetailsRequest(parameters);
  Future<ResponseObject> logoutRequest() => _operatorAuthService.logoutRequest();

}

final repository = Repository();