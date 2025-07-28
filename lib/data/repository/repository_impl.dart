import 'package:dartz/dartz.dart';
import 'package:mvvm/data/data_source/remote_data_source.dart';
import 'package:mvvm/data/mapper/mapper.dart';
import 'package:mvvm/data/network/failure.dart';
import 'package:mvvm/data/network/network_info.dart';
import 'package:mvvm/data/network/requests.dart';
import 'package:mvvm/domain/models/models.dart';
import 'package:mvvm/domain/repository/repository.dart';

class RepositoryImpl implements Repository {
  final RemoteDataSource _remoteDataSource;
  final NetworkInfo _networkInfo;
 
  RepositoryImpl(this._remoteDataSource, this._networkInfo);
  @override
  Future<Either<Failure, Authentication>> login(LoginRequest loginRequest)async {
    if(await _networkInfo.isConnected){
      final response = await _remoteDataSource.login(loginRequest);
      if(response.status == 0){
        return Right(response.toDomain());
      }else{
        return Left(Failure(409, response.message??'Business Error'));
      }
    }else{
      return Left(Failure(409, 'No Internet Connection'));
    }
  }
}
