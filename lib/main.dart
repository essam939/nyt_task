import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:nyt/core/service/remote/service_locator.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:nyt/core/utilities/db_helper.dart';
import 'package:nyt/features/authentication/presentation/pages/login_screen.dart';
import 'features/authentication/presentation/controller/login_cubit.dart';
import 'features/news/presentation/controller/categories/categories_cubit.dart';
import 'features/news/presentation/controller/news/news_cubit.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await DBHelper.dbHelper.initDB();
  ServiceLocator.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      builder: (_, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider<NewsCubit>(
              create: (_) => ServiceLocator.instance<NewsCubit>(),
            ),
            BlocProvider<SelectedCategoryCubit>(
              create: (_) => ServiceLocator.instance<SelectedCategoryCubit>(),
            ),
            BlocProvider<LoginCubit>(
              create: (_) => ServiceLocator.instance<LoginCubit>(),
            ),
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'First Method',
            theme: ThemeData(
              primarySwatch: Colors.blue,
              textTheme: Typography.englishLike2018.apply(fontSizeFactor: 1.sp),
            ),
            home: child,
          ),
        );
      },
      child:   const LoaderOverlay(child: LoginScreen()),
    );
  }
}
