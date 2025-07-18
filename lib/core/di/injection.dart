import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ebozor/feature/create/data/repository/ad_create_repository_impl.dart';
import 'package:ebozor/feature/create/data/source/ad_create_remote_source.dart';
import 'package:ebozor/feature/create/domain/repository/ad_create_repository.dart';
import 'package:ebozor/feature/create/domain/usecases/upload_ad_create_usecase.dart';
import 'package:ebozor/feature/home/data/repository/ad_home_repository_impl.dart';
import 'package:ebozor/feature/home/data/repository/ads_home_repository_impl.dart';
import 'package:ebozor/feature/home/data/source/ad_home_source.dart';
import 'package:ebozor/feature/home/data/source/ads_home_source.dart';
import 'package:ebozor/feature/home/domain/repository/ad_home_repository.dart';
import 'package:ebozor/feature/home/domain/repository/ads_home_repository.dart';
import 'package:ebozor/feature/home/domain/usecases/get_ad_home_usecase.dart';
import 'package:ebozor/feature/home/domain/usecases/get_ads_home_usecase.dart';
import 'package:ebozor/feature/my_ads/data/repository/my_ads_repository_impl.dart';
import 'package:ebozor/feature/my_ads/data/source/my_ads_source.dart';
import 'package:ebozor/feature/my_ads/domain/repository/my_ads_repository.dart';
import 'package:ebozor/feature/my_ads/domain/usecases/get_my_ads_usecase.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

void init() {
  // Firestore
  sl.registerLazySingleton<FirebaseFirestore>(() => FirebaseFirestore.instance);
  sl.registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);
  //? AdsCreateBloc

  // Data Source
  sl.registerLazySingleton<AdCreateRemoteSource>(
    () => AdCreateRemoteSourceImpl(sl()),
  );

  // Repository
  sl.registerLazySingleton<AdCreateRepository>(
    () => AdCreateRepositoryImpl(sl()),
  );

  // Use Case
  sl.registerLazySingleton(() => UploadAdCreateUsecase(sl()));

  //? AdDetailBloc

  // Remote Source
  sl.registerLazySingleton<AdRemoteSource>(() => AdRemoteSourceImpl(sl()));

  // Repository
  sl.registerLazySingleton<AdRepository>(() => AdRepositoryImpl(sl()));

  // Usecase
  sl.registerLazySingleton(() => GetAdByIdUseCase(sl()));

  //? AdsHomeBloc
  sl.registerLazySingleton<AdsRemoteSource>(() => AdsRemoteSourceImpl(sl()));
  sl.registerLazySingleton<AdsRepository>(() => AdsRepositoryImpl(sl()));
  sl.registerLazySingleton(() => GetAdsUseCase(sl()));

  //? MyAdsBloc
  sl.registerLazySingleton<MyAdsSource>(() => MyAdsSource(sl()));
  sl.registerLazySingleton<MyAdsRepository>(() => MyAdsRepositoryImpl(sl()));
  sl.registerLazySingleton(() => GetMyAdsUsecase(sl()));


}
