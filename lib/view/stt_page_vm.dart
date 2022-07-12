import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yacht_result/model/temp_rank_model.dart';


final tempRankProvider =
StateNotifierProvider<TempRankNotifier,TempRankData>((_) {
  return TempRankNotifier();
});
// class TempRankNotifier extends StateNotifier<List<int>> {
//   TempRankNotifier() : super([]);
//
//   void addRank(int value){
//     state=[...state,value];
//     state=state..add(value);
//   }
//
//   void rmRank(int value){
//     state=[...state,value];
//   }
// }
class TempRankNotifier extends StateNotifier<TempRankData> {
  TempRankNotifier() : super(const TempRankData());

  void addRank(int value){
    // state=state.copyWith(ranks:[...state.ranks,value]);


    final ranks=List.of(state.ranks)..add(value);
    state=state.copyWith(ranks:ranks);
  }
  //
  void rmLastRank(){

    final ranks=List.of(state.ranks)..removeLast();
    state=state.copyWith(ranks:ranks);
  }

  void rmSelectedRank(int index){

    final ranks=List.of(state.ranks)..removeAt(index);
    state=state.copyWith(ranks:ranks);
  }

  void editRank(int index,int value){

    final ranks=[...state.ranks.sublist(0,index),value,...state.ranks.sublist(index+1,state.ranks.length)];
    state=state.copyWith(ranks:ranks);
  }
}
