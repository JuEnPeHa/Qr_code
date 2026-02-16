import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../../../core/theme/design_tokens.dart';
import '../../domain/entities/qr_payload.dart';
import '../bloc/generator_bloc.dart';

class GeneratorPage extends StatelessWidget {
  const GeneratorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => GeneratorBloc(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('QR Studio'),
          actions: [
            IconButton(
              onPressed: () => context.go('/scanner'),
              icon: const Icon(Icons.qr_code_scanner_rounded),
            ),
          ],
        ),
        body: Container(
          decoration: const BoxDecoration(gradient: DesignTokens.primaryGradient),
          child: SafeArea(
            child: BlocBuilder<GeneratorBloc, GeneratorState>(
              builder: (context, state) {
                return ListView(
                  padding: const EdgeInsets.all(16),
                  children: [
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          children: [
                            DropdownButtonFormField<QrPayloadType>(
                              value: state.selectedType,
                              items: QrPayloadType.values
                                  .map(
                                    (type) => DropdownMenuItem(
                                      value: type,
                                      child: Text(type.name.toUpperCase()),
                                    ),
                                  )
                                  .toList(),
                              onChanged: (value) {
                                if (value != null) {
                                  context.read<GeneratorBloc>().add(GeneratorTypeChanged(value));
                                }
                              },
                            ),
                            const SizedBox(height: 12),
                            TextField(
                              onChanged: (value) => context
                                  .read<GeneratorBloc>()
                                  .add(GeneratorValueChanged(value)),
                              decoration: const InputDecoration(
                                labelText: 'Contenido dinámico del QR',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    if (state.previewPayload != null)
                      Card(
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            children: [
                              QrImageView(data: state.previewPayload!.raw, size: 200),
                              const SizedBox(height: 12),
                              FilledButton.icon(
                                onPressed: () => context
                                    .read<GeneratorBloc>()
                                    .add(const GeneratorSavePresetPressed()),
                                icon: const Icon(Icons.save_alt_rounded),
                                label: const Text('Guardar preset'),
                              ),
                            ],
                          ),
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
