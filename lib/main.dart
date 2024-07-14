import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gulf_scanner/dio_helper.dart';
import 'package:gulf_scanner/presentaions/home_qr/scan_of_points_screen.dart';
import 'package:gulf_scanner/presentaions/home_qr/scan_of_rewordes_screen.dart';
import 'package:qr_bar_code_scanner_dialog/qr_bar_code_scanner_dialog.dart';


void main() {
  DioHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _qrBarCodeScannerDialogPlugin = QrBarCodeScannerDialog();
  String? code;
  String? massage;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: Scaffold(
              appBar: AppBar(
                backgroundColor: Color.fromRGBO(255, 99, 25, 1),
                centerTitle: true,
                title: const Text(
                  'Scanner',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              body: Builder(builder: (context) {
                return Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                          borderRadius: BorderRadius.circular(10.r),
                          onTap: () {
                            _qrBarCodeScannerDialogPlugin.getScannedQrBarCode(
                                context: context,
                                onCode: (code) {
                                  setState(() {
                                    print('${code}==========');
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                RewordsScreen(
                                                  id: code!,
                                                )));
                                  });
                                });
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(12),
                            child: Container(
                                height: 50.h,
                                width: double.maxFinite,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Color.fromRGBO(255, 99, 25, 1),
                                      width: 1.w),
                                  borderRadius: BorderRadius.circular(10.r),
                                ),
                                child: Center(
                                    child: Text(
                                  "Scan To Get Rewards",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 22.sp,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ))),
                          )),
                      SizedBox(
                        height: 10.h,
                      ),
                      InkWell(
                          borderRadius: BorderRadius.circular(10.r),
                          onTap: () {
                            _qrBarCodeScannerDialogPlugin.getScannedQrBarCode(
                                context: context,
                                onCode: (code) {
                                  setState(() {
                                    print('${code}==========');
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                PointsScreen(
                                                  id: code!,
                                                )));
                                  });
                                });
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(12),
                            child: Container(
                                height: 50.h,
                                width: double.maxFinite,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Color.fromRGBO(255, 99, 25, 1),
                                      width: 1.w),
                                  borderRadius: BorderRadius.circular(10.r),
                                ),
                                child: Center(
                                    child: Text(
                                  "Scan To Get Points",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 22.sp,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ))),
                          )),
                      SizedBox(
                        height: 10.h,
                      ),
                   
                    ],
                  ),
                );
              }),
            ),
          );
        });
  }
}
