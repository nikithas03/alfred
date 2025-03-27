import 'package:alfred/config/alfred_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../gen/strings.g.dart';
import '../../view_models/ros_connection_view_model.dart';

class LoadingScreen extends ConsumerStatefulWidget {
  const LoadingScreen({super.key});

  @override
  ConsumerState<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends ConsumerState<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    // Trigger ROS connection.
    Future.delayed(const Duration(seconds: 3), () {
      ref.read(rosConnectionVMProvider.notifier).connect();
    });
  }

  @override
  Widget build(BuildContext context) {
    final connectionStatus = ref.watch(rosConnectionVMProvider);
    // if (connectionStatus == ConnectionStatus.connected) {
    //   context.go(AlfredConstants.routeChecklistScreen);
    // }
    Future.delayed(const Duration(seconds: 5), () {
      context.go(AlfredConstants.routeChecklistScreen);
    });

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 100),
            Expanded(
              child: Image.asset(
                'assets/images/loading.png',
                fit: BoxFit.cover, // Or BoxFit.fill based on your image
                // width: MediaQuery.of(context).size.width * 0.5,
                height: MediaQuery.of(context).size.height * 0.3,
              ),
            ),
            const SizedBox(height: 50),
            Padding(
                padding: EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    connectionStatus == ConnectionStatus.connecting
                        ? const CircularProgressIndicator()
                        : connectionStatus == ConnectionStatus.connecting
                            ? Text(
                                'Initializing System...',
                                style: GoogleFonts.inter(textStyle: Theme.of(context).textTheme.titleMedium, fontSize: 24),
                              )
                            : connectionStatus == ConnectionStatus.error
                                ? Text(
                                    'Initialization Failed',
                                    style: GoogleFonts.inter(textStyle: Theme.of(context).textTheme.titleMedium, fontSize: 24),
                                  )
                                : Text(
                                    'System Initialized',
                                    style: GoogleFonts.inter(textStyle: Theme.of(context).textTheme.titleMedium, fontSize: 24),
                                  ),
                  ],
                )),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
