import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ebozor/feature/create/data/repository/ad_create_repository_impl.dart';
import 'package:ebozor/feature/create/data/source/ad_create_remote_source.dart';
import 'package:ebozor/feature/create/domain/repository/ad_create_repository.dart';
import 'package:ebozor/feature/create/domain/usecases/upload_ad_create_usecase.dart';
import 'package:ebozor/feature/home/data/repository/ads_home_repository_impl.dart';
import 'package:ebozor/feature/home/data/source/ads_home_source.dart';
import 'package:ebozor/feature/home/domain/repository/ads_home_repository.dart';
import 'package:ebozor/feature/home/domain/usecases/get_ads_home_usecase.dart';
import 'package:ebozor/feature/home/presentation/bloc/ads_home_bloc.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

void init() {
  // Firestore
  sl.registerLazySingleton<FirebaseFirestore>(() => FirebaseFirestore.instance);

  // Data Source
  sl.registerLazySingleton<AdCreateRemoteSource>(() => AdCreateRemoteSourceImpl(sl()));

  // Repository
  sl.registerLazySingleton<AdCreateRepository>(() => AdCreateRepositoryImpl(sl()));

  // Use Case
  sl.registerLazySingleton(() => UploadAdCreateUsecase(sl()));





 sl.registerLazySingleton<AdsRemoteSource>(() => AdsRemoteSourceImpl(sl()));
  sl.registerLazySingleton<AdsRepository>(() => AdsRepositoryImpl(sl()));
  sl.registerLazySingleton(() => GetAdsUseCase(sl()));
  sl.registerFactory(() => AdsBloc(sl()));




}
