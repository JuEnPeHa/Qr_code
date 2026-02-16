import '../../features/generator/data/datasources/generator_local_datasource.dart';
import '../../features/generator/data/repositories/generator_repository_impl.dart';
import '../../features/generator/domain/repositories/generator_repository.dart';
import '../../features/scanner/data/datasources/scanner_local_datasource.dart';
import '../../features/scanner/data/repositories/scanner_repository_impl.dart';
import '../../features/scanner/domain/repositories/scanner_repository.dart';

late final ScannerRepository scannerRepository;
late final GeneratorRepository generatorRepository;

Future<void> configureDependencies() async {
  final scannerLocalDataSource = ScannerLocalDataSource();
  final generatorLocalDataSource = GeneratorLocalDataSource();

  scannerRepository = ScannerRepositoryImpl(localDataSource: scannerLocalDataSource);
  generatorRepository = GeneratorRepositoryImpl(localDataSource: generatorLocalDataSource);
}
