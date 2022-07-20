import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yacht_result/model/temp_rank_model.dart';


final rankRepositoryProvider = Provider((ref) => RankRepository());



class RankRepository {
  final CollectionReference _collection =
      FirebaseFirestore.instance.collection("collection_ranks");

  void saveRankData(TempRankData rankData) {
    _collection.add(rankData.toJson());
  }

  Stream<List<TempRankData>> getSnapshots() {
    return _collection
    // .where("raceName",isEqualTo: "なひ")
        .orderBy('raceNum', descending: false)
        .limit(10)
        .snapshots()
        .map((e) => e.docs
            .map((data) =>
                TempRankData.fromJson(data.data() as Map<String, dynamic>))
            .toList());
  }

  Stream<List<TempRankData>> getReggtaSnapshots() {
    final result=_collection
        .where("raceName",isEqualTo: "なひ")
        .orderBy('raceNum', descending: false)
        .limit(20)
        .snapshots()
        .map((e) => e.docs
        .map((data) =>
        TempRankData.fromJson(data.data() as Map<String, dynamic>))
        .toList());
    return result;
  }
}
