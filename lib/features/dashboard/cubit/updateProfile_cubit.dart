import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/data/api/api.dart';
import '../../../core/data/local/cacheHelper.dart';
import '../../../core/data/models/subscribtion/Subscribtion_model.dart';
import '../../../core/data/models/vehicle/user.dart';
import '../../../core/data/repository/vehicle_repo.dart';
import '../../../core/dialoges/toast.dart';
import '../../../core/keys/keys.dart';
import '../../../core/master_cubit/getDataForm_state.dart';
import 'UpdateProfile_state.dart';

class UpdateProfileCubit extends Cubit<UpdateProfileStates> {
  UpdateProfileCubit() : super(UpdateProfileLoading());

  static UpdateProfileCubit get(context) => BlocProvider.of(context);
  Connectivity connectivity = Connectivity();
  List<User>? profileList = [];
  User profileData = User();

  SubscriptionModel subscriptionData = SubscriptionModel();
  updateProfile(updateProfileModel,) async {
    var token = await CacheHelper.getString(SharedKeys.token);
    var response = Api().postHttp(
        url: 'profile/update',
        data: updateProfileModel.toJson(),
        authToken: token);
    emit(UpdateLoading());
    print(response);
    response
        .then((value) => {
              print(value),
              profileData = User.fromJson(value['record']),
              emit(UpdateProfileSuccess(User.fromJson(value['record']))),
              showToast(
                  msg: 'update Profile successfully',
                  state: ToastedStates.SUCCESS),
            })
        .onError((error, stackTrace) => {
              emit(UpdateProfileFailed()),
              print(error),
            });
  }

  getUserProfileData() async {
    var token = await CacheHelper.getString(SharedKeys.token);
    var response = Api().getHttp(
      url: 'profile',
      authToken: token,
    );
    emit(GetUserProfileLoading());
    print(response);
    response
        .then((value) => {
              print('**********'),
              print(value),
              profileData = User.fromJson(value['record']),
              emit(GetUserProfileSuccess(User.fromJson(value['record']))),
            })
        .onError((error, stackTrace) => {
              emit(GetUserProfileFailed(error.toString())),
              print(error),
            });
  }

  getVehicleTypesCubit() {
    connectivity.checkConnectivity().then((value) async {
      if (ConnectivityResult.none == value) {
        emit(FailedNetwork("Check your internet connection and try again"));
      } else {
        VehicleRepo.getProfile('profile')
            .then((value) => {
                  print('..................................'),
                  print(value),
                  profileList = value,
                  emit(GetProfileSuccess(value))
                })
            .onError((error, stackTrace) =>
                {emit(GetProfileFailed(error.toString())), print(error)});
      }
    });
  }
  getSubscriptionData() {
    connectivity.checkConnectivity().then((value) async {
      if (ConnectivityResult.none == value) {
        emit(FailedNetwork("Check your internet connection and try again"));
      } else {
        emit(GetSubscriptionLoading());
        var token = await CacheHelper.getString(SharedKeys.token);

        var response = Api().getHttp(
          url: 'profile/current-subscription',
          authToken: token,
        );
        response
            .then((value) => {
          print('subscriptionData'),
          print(value),
         subscriptionData = SubscriptionModel.fromJson(value['record']),
          emit(GetSubscriptionSuccess(SubscriptionModel.fromJson(value))),
        })
            .onError((error, stackTrace) =>
        {emit(GetSubscriptionFailed(error.toString())), print(error)});

      }
    });
  }

 /*
  getSubscriptionData() async {
    var token = await CacheHelper.getString(SharedKeys.token);
    var response = Api().getHttp(
      url: 'profile/current-subscription',
      authToken: token,
    );
    emit(GetSubscriptionLoading());
    print(response);
    response
        .then((value) => {
      print('**********'),
      print(value),
      subscriptionData = value,
      emit(GetSubscriptionSuccess(SubscriptionModel.fromJson(value))),
    })
        .onError((error, stackTrace) => {
      emit(GetSubscriptionFailed(error.toString())),
      print(error),
    });
  }
  */

  cancelSubscriptionCubit() {
    connectivity.checkConnectivity().then((value) async {
      if (ConnectivityResult.none == value) {
        emit(FailedNetwork("Check your internet connection and try again"));
      } else {
        VehicleRepo.cancel()
            .then((value) => {
          print('Cancel Success'),
          print(value),
          emit(CancelSuccess()),
          showToast(
              msg: 'Cancel Success', state: ToastedStates.SUCCESS),
        })
            .catchError((error, stackTrace) => {
          emit(CancelFailed()),
          print(error),
          showToast(msg: error.toString(), state: ToastedStates.ERROR),
          print('Cancel  Failed'),
        });
      }
    });
  }
}
