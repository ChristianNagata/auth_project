
import 'package:cloud_firestore/cloud_firestore.dart';

abstract class GetStoreInformationUseCase {
  Stream<DocumentSnapshot<Map<String, dynamic>>> getStoreInformation();
}