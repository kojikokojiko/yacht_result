

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/temp_rank_model.dart';
import '../repository/rank_repository.dart';


final _currentInternDataProvider=StreamProvider((ref)=>
    ref.read(rankRepositoryProvider).getSnapshots()
);

final rankListProvider=StateNotifierProvider<RankController,AsyncValue<List<TempRankData>>>((ref){
  final repo=ref.read(rankRepositoryProvider);
  final currentList=ref.watch(_currentInternDataProvider);
  return RankController(repo,currentList);
});


class RankController extends StateNotifier<AsyncValue<List<TempRankData>>>{
  RankController(this._repo,currentList):super(currentList);
  final RankRepository _repo;



  void setRank(TempRankData rankData){
    _repo.saveRankData(rankData);

  }


}