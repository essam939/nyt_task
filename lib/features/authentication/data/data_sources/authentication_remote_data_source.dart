import 'package:dartz/dartz.dart';
import 'package:nyt/core/error/failure.dart';
import 'package:nyt/core/service/remote/dio_consumer.dart';
import 'package:nyt/features/authentication/domain/entities/register_request.dart';
import 'package:nyt/features/authentication/domain/entities/register_response.dart';


part 'endpoints.dart';
abstract class BaseAuthenticationDataSource {
  Future<Either<Failure, RegisterResponse>> register(RegisterRequest request);
}
class AuthenticationDataSource extends BaseAuthenticationDataSource {
  AuthenticationDataSource(this._dio);
  final DioConsumer _dio;
  @override
  Future<Either<Failure, RegisterResponse>> register(
      RegisterRequest request,
      ) async {
    final responseEither = await _dio.post(
      _AuthEndPoints.login,
      data: request.toJson(),
    );
    return responseEither.fold(
          (failure) => Left(failure),
          (response) => Right(
            RegisterResponse.fromJson(
          response!['data'] as Map<String, dynamic>,
        ),
      ),
    );
  }

}