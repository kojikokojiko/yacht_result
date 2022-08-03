import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yacht_result/model/temp_rank_model.dart';


final rankRepositoryProvider = Provider((ref) => RankRepository());



class RankRepository {
  final myId=FirebaseAuth.instance.currentUser!.uid;
  final CollectionReference collection =
  FirebaseFirestore.instance.collection("user");



  void saveRankData(TempRankData rankData,String raceName) {
    final myId = FirebaseAuth.instance.currentUser!.uid;

    collection.doc(myId).collection(raceName).doc(rankData.raceNum.toString()).set(rankData.toJson());
  }

  void updateRankData(TempRankData rankData,String raceName) {
    final myId = FirebaseAuth.instance.currentUser!.uid;

    collection.doc(myId).collection(raceName).doc(rankData.raceNum.toString()).update(rankData.toJson());
  }


  Stream<List<TempRankData>> getReggataSnapshots(String raceName) {
    final myId = FirebaseAuth.instance.currentUser!.uid;

    return collection.doc(myId).collection(raceName)
        .orderBy('raceNum', descending: false)
        .limit(10)
        .snapshots()
        .map((e) => e.docs
            .map((data) =>
                TempRankData.fromJson(data.data() as Map<String, dynamic>))
            .toList());
  }



  // Stream<List<TempRankData>> getReggataSnapshots() {
  //
  //   final result=collection
  //       .where("raceName",isEqualTo: "なかしましゅんすけ")
  //       .orderBy('raceNum', descending: false)
  //       .limit(20)
  //       .snapshots()
  //       .map((e) => e.docs
  //       .map((data) =>
  //       TempRankData.fromJson(data.data() as Map<String, dynamic>))
  //       .toList());
  //   return result;
  // }
}
