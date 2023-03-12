import 'package:chatapp/custom_bloc_observer.dart';
import 'package:chatapp/features/auth/auth_bloc/auth_bloc.dart';
import 'package:chatapp/features/auth/cubit_cubit/auth_cubit.dart';
import 'package:chatapp/features/chat/chat_cubit/chat_cubit.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'firebase_options.dart';
import 'features/chat/chat_screens/chat_screen.dart';
import 'features/auth/auth_screens/login_screen.dart';
import 'features/auth/auth_screens/resgister_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  } catch (e) {
    print(e);
  }
  Bloc.observer = CustomBlocObserver();
  runApp(const ScholarChat());
}

class ScholarChat extends StatelessWidget {
  const ScholarChat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthCubit()),
        BlocProvider(create: (context) => ChatCubit()),
        BlocProvider(
          create: (context) => AuthBloc(),
        )
      ],
      child: MaterialApp(
        routes: {
          LoginScreen.id: (context) => LoginScreen(),
          RegisterScreen.id: (context) => RegisterScreen(),
          ChatScreen.id: (context) => ChatScreen()
        },
        initialRoute: LoginScreen.id,
      ),
    );
  }
}
