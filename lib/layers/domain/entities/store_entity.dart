import 'package:equatable/equatable.dart';

class StoreEntity extends Equatable {
  final String categoria, cnpj, local, nome, uid, id;

  const StoreEntity({
    required this.id,
    required this.uid,
    required this.nome,
    required this.categoria,
    required this.cnpj,
    required this.local,
  });

  @override
  List<Object?> get props => [categoria, cnpj, local, nome, uid, id];
}
