import 'package:firstapp/feature/screens/auth/login/bloc/login_bloc.dart';
import 'package:firstapp/feature/screens/auth/profileinfo/bloc/profile_bloc_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'core/bloc/bloc_observer.dart';
import 'core/bloc/database_cubit.dart';
import 'feature/screens/auth/registration/bloc/registration_bloc.dart';
import 'feature/screens/shop/account/bloc/account_cubit.dart';
import 'feature/screens/shop/cart/bloc/cart_cubit.dart';
import 'feature/screens/shop/home/bloc/home_cubit.dart';
import 'core/bloc/navigation_cubit.dart';
import 'exports/data_paths.dart';
import 'package:flutter_skill/flutter_skill.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  final supabaseUrl = dotenv.env['SUPABASE_URL']!;
  final supabaseAnonKey = dotenv.env['SUPABASE_ANON_KEY']!;
  final mistralKey = dotenv.env['MISTRAL_API_KEY']!;

  Bloc.observer = AppBlocObserver();

  await Supabase.initialize(url: supabaseUrl, anonKey: supabaseAnonKey);
  await DatabaseService.instance.initialize();
  await SmallStorage.instance.initialize();
  MistralService().init(mistralKey);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider.value(value: SmallStorage.instance),
        RepositoryProvider.value(value: DatabaseService.instance),
        RepositoryProvider(
          create: (context) => UserDataService(Supabase.instance.client),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => DatabaseCubit(context.read<DatabaseService>()),
          ),
          BlocProvider(create: (context) => NavigationCubit()),
          BlocProvider(
            create: (context) => HomeCubit(
              databaseCubit: context.read<DatabaseCubit>(),
              storage: context.read<SmallStorage>(),
            ),
          ),
          BlocProvider(
            create: (context) => AccountCubit(
              databaseCubit: context.read<DatabaseCubit>(),
              storage: context.read<SmallStorage>(),
            ),
          ),
          BlocProvider(
            create: (context) => CartCubit(
              databaseCubit: context.read<DatabaseCubit>(),
              storage: context.read<SmallStorage>(),
            ),
          ),
          BlocProvider(
            create: (context) => LoginBloc(
              supabase: Supabase.instance.client,
              storage: SmallStorage.instance,
            ),
          ),
          BlocProvider(
            create: (context) => ProfileBlocBloc(),
            child: Container(),
          ),
          BlocProvider(
            create: (context) => RegisterBloc(
              supabase: Supabase.instance.client,
              storage: SmallStorage.instance,
            ),
          ),
        ],
        child: MaterialApp(
          title: 'Kaafi',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            useMaterial3: true,
            textTheme: GoogleFonts.openSansTextTheme(),
          ),
          initialRoute: AppRoutes.register,
          routes: AppRoutes.routes,
        ),
      ),
    );
  }
}
