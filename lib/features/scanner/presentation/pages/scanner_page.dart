import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/design_tokens.dart';
import '../bloc/scanner_bloc.dart';
import '../widgets/scan_history_card.dart';

class ScannerPage extends StatelessWidget {
  const ScannerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ScannerBloc()..add(const ScannerStarted()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Scanner Pro'),
          actions: [
            IconButton(
              tooltip: 'Generar QR',
              onPressed: () => context.go('/generator'),
              icon: const Icon(Icons.qr_code_2_rounded),
            ),
          ],
        ),
        body: DecoratedBox(
          decoration: const BoxDecoration(gradient: DesignTokens.primaryGradient),
          child: SafeArea(
            child: BlocBuilder<ScannerBloc, ScannerState>(
              builder: (context, state) {
                return Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.all(16),
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.12),
                        borderRadius: BorderRadius.circular(24),
                        boxShadow: DesignTokens.softShadow(Colors.black),
                      ),
                      child: Row(
                        children: [
                          const Icon(Icons.center_focus_strong_rounded, color: Colors.white),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Text(
                              state.lastScan?.raw ?? 'Escaneo en tiempo real listo',
                              style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
                            ),
                          ),
                          FilledButton(
                            onPressed: () => context.read<ScannerBloc>().add(
                                  const ScannerCodeDetected('https://example.com'),
                                ),
                            child: const Text('Demo scan'),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                        padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
                        itemCount: state.history.length,
                        itemBuilder: (context, index) {
                          final record = state.history[index];
                          return ScanHistoryCard(
                            record: record,
                            onFavoriteTap: () => context
                                .read<ScannerBloc>()
                                .add(ScannerToggleFavoritePressed(record.id)),
                          );
                        },
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
