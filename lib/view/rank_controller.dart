import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/temp_rank_model.dart';
import '../repository/rank_repository.dart';

final _currentInternDataProvider =
    StreamProvider.family<List<TempRankData>, String>((ref, raceName) =>
        ref.read(rankRepositoryProvider).getReggataSnapshots(raceName));

final rankListProvider = StateNotifierProvider.family<RankController,
    AsyncValue<List<TempRankData>>, String>((ref, raceName) {
  final repo = ref.read(rankRepositoryProvider);
  final currentList = ref.watch(_currentInternDataProvider(raceName));
  return RankController(repo, currentList);
});

class RankController extends StateNotifier<AsyncValue<List<TempRankData>>> {
  RankController(this._repo, currentList) : super(currentList);
  final RankRepository _repo;

  //
  // AsyncValue<List<TempRankData>> get getReggata => AsyncValue.data(state.value==null ? [] :state.value!.where((element) => element.raceName==).toList());

  // AsyncValue<List<TempRankData>> getReggata(String raceName){
  //   return AsyncValue.data(state.value==null ? [] :state.value!.where((element) => element.raceName==raceName).toList());
  // }

  void setRank(TempRankData rankData, String raceName) {
    // _repo.saveRankData(rankData, raceName);
    // 汚いけど、同じraceNumがあるときには、更新、ないときにはaddするっていう処理。
    bool flag1=state.value!.isEmpty;
    final temp_list=state.value!.where((element) => element.raceNum==rankData.raceNum).toList();
    bool flag2=temp_list.isEmpty;
    // bool flag3=state.value==null;
    if(flag1 || flag2){
      // set
      _repo.saveRankData(rankData, raceName);

    }else{
      // update
      _repo.updateRankData(rankData, raceName);

    }

  }

  Stream<List<TempRankData>> getReggtaSnapshots(String raceName) {
    return _repo.getReggataSnapshots(raceName);
  }

  Future<Map<int, int>> getResultSum(String raceName) async{
    List<TempRankData> dataList = (state.value == null)
        ? []
        : state.value!
            .where((element) => element.raceName == raceName)
            .toList();

    // final dataList=_repo.getReggataSnapshots(raceName).value!.where((event) => event.ra);


    Map<int, int> resultMap = {};
    dataList.forEach((element) {
      element.ranks.asMap().forEach((index, sailNumber) {
        // https://stackoverflow.com/questions/61198441/does-dart-have-something-like-defaultdict-in-python
        // 艇番号がmapにないときは、0をmapに代入し、その後順位（index＋１）の値を追加
        // resultMap.putIfAbsent(value, () => 0) + index + 1;
        if (resultMap.containsKey(sailNumber)) {
          resultMap[sailNumber] = resultMap[sailNumber]! + index + 1;
        } else {
          resultMap[sailNumber] = index + 1;
        }
      });
    });

    // resultMap = SplayTreeMap.of(resultMap, (a, b) {
    // int compare = resultMap[a]!.compareTo(resultMap[b]!);
    // // compareが0（aとbの値が同じ場合）なら1（aがbよりも大きい場合）に置き換える。
    // return compare == 0 ? 1 : compare;
    // });

    return resultMap;
  }
}
