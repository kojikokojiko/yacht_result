import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yacht_result/model/temp_rank_model.dart';


final tempRankProvider =
StateNotifierProvider<TempRankNotifier,List<int>>((_) {
  return TempRankNotifier();
});


class TempRankNotifier extends StateNotifier<List<int>> {
  TempRankNotifier() : super([]);

  void addRank(int value){
    state=[...state,value];
  }

}
