import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'views/anasayfa.dart';
import 'cubit/favoriler_cubit.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FavorilerCubit(),
      child: const MaterialApp(debugShowCheckedModeBanner: false,
          home: Anasayfa()),
    );
  }
}

