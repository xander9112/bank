import 'package:bank/core/_core.dart';
import 'package:bank/features/_features.dart';
import 'package:dartz/dartz.dart';

class UserRepositoryImpl implements UserRepository {
  UserRepositoryImpl({
    required TokenDataSource tokenDataSource,
    required UserDataSource dataSource,
  })  : _tokenDataSource = tokenDataSource,
        _dataSource = dataSource;

  final TokenDataSource _tokenDataSource;
  final UserDataSource _dataSource;

  Future<String> get _token async => (await _tokenDataSource.getToken()) ?? '';

  @override
  Future<Either<Failure, List<UserDTO>>> getChildren() async {
    return _dataSource.getChildren(await _token);
  }
}
