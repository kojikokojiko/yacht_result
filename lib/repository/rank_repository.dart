import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yacht_result/model/temp_rank_model.dart';


final rankRepositoryProvider = Provider.family<RankRepository,String>((ref,raceName) => RankRepository(raceName: raceName));



class RankRepository {
  String raceName;
  RankRepository({required this.raceName});

  void saveRankData(TempRankData rankData) {
    final CollectionReference collection =
    FirebaseFirestore.instance.collection(raceName);

    collection.add(rankData.toJson());
  }

  Stream<List<TempRankData>> getSnapshots() {
    final CollectionReference collection =
    FirebaseFirestore.instance.collection(raceName);

    return collection
    .where("raceName",isEqualTo: "なひ")
        .orderBy('raceNum', descending: false)
        .limit(10)
        .snapshots()
        .map((e) => e.docs
            .map((data) =>
                TempRankData.fromJson(data.data() as Map<String, dynamic>))
            .toList());
  }



  Stream<List<TempRankData>> getReggtaSnapshots() {
    final CollectionReference collection =
    FirebaseFirestore.instance.collection(raceName);

    final result=collection
        .where("raceName",isEqualTo: "なかしましゅんすけ")
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
