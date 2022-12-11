

import 'package:hoga_load/core/data/models/Packages.dart';

abstract class PackageStates{}

class PackageLoading extends PackageStates{}
class PackageSubscribeSuccess extends PackageStates{}
class PackageSubscribeFailed extends PackageStates{}
class PackageSubscribeLoading extends PackageStates{}



class GetPackageSuccess extends PackageStates{

  List<Packages>attributesList=[];
  GetPackageSuccess(this.attributesList);
}

class GetPackageFailed extends PackageStates{

  final String msg;
  GetPackageFailed(this.msg);
}

class NetworkFailed extends PackageStates{

  final String msg;
  NetworkFailed(this.msg);
}