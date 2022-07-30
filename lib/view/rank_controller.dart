

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/temp_rank_model.dart';
import '../repository/rank_repository.dart';


final _currentInternDataProvider=StreamProvider.family<List<TempRankData>,String>((ref,raceName)=>
    ref.read(rankRepositoryProvider(raceName)).getSnapshots()
);

final rankListProvider=StateNotifierProvider.family<RankController,AsyncValue<List<TempRankData>>,String>((ref,raceName){

  final repo=ref.read(rankRepositoryProvider(raceName));
  final currentList=ref.watch(_currentInternDataProvider(raceName));
  return RankController(repo,currentList);
});


class RankController extends StateNotifier<AsyncValue<List<TempRankData>>>{
  RankController(this._repo,currentList):super(currentList);
  final RankRepository _repo;


  // AsyncValue<List<TempRankData>> get getReggata => AsyncValue.data(state.value==null ? [] :state.value!.where((element) => element.raceName==).toList());

  void setRank(TempRankData rankData){
    _repo.saveRankData(rankData);
  }

  Stream<List<TempRankData>> getSnapshots() {
    return _repo.getSnapshots();
  }

  Stream<List<TempRankData>> getReggtaSnapshots() {
    return _repo.getReggtaSnapshots();
  }




}