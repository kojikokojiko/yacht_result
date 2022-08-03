import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yacht_result/view/rank_controller.dart';
import 'package:yacht_result/view/stt_page_vm.dart';

import '../model/temp_rank_model.dart';

class ResultPage extends ConsumerWidget {
  const ResultPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tempResultController = ref.read(tempRankProvider.notifier);
    final tempResultState = ref.read(tempRankProvider);
    final raceName = tempResultState.raceName;
    final rankListController = ref.read(rankListProvider(raceName).notifier);

    return Scaffold(
      appBar: AppBar(
        title: Container(
          child: Row(
            children: const [
              Text("途中結果"),
            ],
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        margin: const EdgeInsets.all(10),
        child: Column(
          children: [
            Center(
              child: Text(
                tempResultState.raceName,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Text(rankListController.getResultSum(raceName).toString()),
            StreamBuilder(
              stream: rankListController.getReggtaSnapshots(raceName),
              builder: ((BuildContext context,
                  AsyncSnapshot<List<TempRankData>> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }
                return (snapshot.data?.isEmpty ?? true)
                    ? const Center(child: Text("記録がありません"))
                    : Expanded(
                        child: ListView.builder(
                            //11
                            itemCount: snapshot.data!.length,
                            itemBuilder: (context, index) {
                              final rank=snapshot.data![index].raceNum;
                              return Card(
                                child: ListTile(
                                  leading: Text(
                                      '${snapshot.data![index].raceNum.toString()}レース目結果'),

                                ),
                              );
                            }),
                      );
              }),
            )
          ],
        ),
      ),
    );
  }
}
