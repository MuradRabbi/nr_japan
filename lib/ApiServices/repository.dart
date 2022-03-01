


import 'package:nr_japan/ApiServices/operator_auth_service.dart';
import 'package:nr_japan/ApiServices/response_object.dart';

class Repository{

  final OperatorAuthService _operatorAuthService = OperatorAuthService();


  Future<ResponseObject> commonSyncRequest(Map <String, dynamic> parameters) => _operatorAuthService.commonSyncRequest(parameters);

}

final repository = Repository();