import 'package:dartz/dartz.dart';
import 'package:nyt/core/error/failure.dart';
import 'package:nyt/core/utilities/base_usecase.dart';
import 'package:nyt/features/authentication/domain/entities/register_request.dart';
import 'package:nyt/features/authentication/domain/entities/register_response.dart';
import 'package:nyt/features/authentication/domain/repositories/base_authentication_repository.dart';





class RegisterUseCase extends BaseUseCase<RegisterResponse, RegisterRequest> {

  RegisterUseCase(this.authenticationRepository);
  final BaseAuthenticationRepository authenticationRepository;

  @override
  Future<Either<Failure, RegisterResponse>> execute(RegisterRequest params) async {
    return await authenticationRepository.register(params);
  }
}