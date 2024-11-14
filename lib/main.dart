import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/assessment_provider.dart';
import 'providers/location_provider.dart';
import 'screens/home_screen.dart';
import 'services/tts_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final ttsService = TTSService();
  await ttsService.initialize();
  runApp(const FirstAidApp());
}

class FirstAidApp extends StatelessWidget {
  const FirstAidApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AssessmentProvider()),
        ChangeNotifierProvider(create: (_) => LocationProvider()),
      ],
      child: MaterialApp(
        title: 'Emergency Assistant',
        theme: ThemeData(
          primarySwatch: Colors.red,
          useMaterial3: true,
        ),
        home: FutureBuilder(
          future: Future.value(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return const HomeScreen();
            }
            return const MaterialApp(
              home: Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
