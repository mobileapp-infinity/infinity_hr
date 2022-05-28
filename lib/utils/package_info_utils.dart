// import 'package:device_apps/device_apps.dart';
//
// class PackageInfoUtilFile{
//
//     //TO use this feature we need to add device_apps: ^2.1.1 dependency in .yaml file
//
//     static Future<Application?> getAnyAppInfoFromAppName({required String appName}) async{
//       Application? application;
//       List<Application> allApps = await DeviceApps.getInstalledApplications(onlyAppsWithLaunchIntent: true, includeSystemApps: true);
//       application = allApps.firstWhere((element) => element.appName.toLowerCase().trim().contains(appName.trim()));
//       return Future.value(application);
//     }
//
//     static Future<Application?> getAnyAppInfoFromPackageName({required String packageName}) async{
//       Application? application;
//       List<Application> allApps = await DeviceApps.getInstalledApplications(onlyAppsWithLaunchIntent: true, includeSystemApps: true);
//       application = allApps.firstWhere((element) => element.packageName.toLowerCase().trim().contains(packageName.trim()));
//       return Future.value(application);
//     }
// }