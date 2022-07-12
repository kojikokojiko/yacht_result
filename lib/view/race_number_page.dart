import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:yacht_result/view/stt_page.dart';
import 'package:yacht_result/view/stt_page_vm.dart';

class RaceNumberPage extends HookConsumerWidget {
  const RaceNumberPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tempResultController = ref.read(tempRankProvider.notifier);
    final tempResultState = ref.read(tempRankProvider);
    final  raceNum = useState(1);
    return Scaffold(
      appBar: AppBar(
        title: Text(tempResultState.raceName),
        centerTitle: true,
      ),
      body: Container(
        margin: EdgeInsets.all(20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DropdownButton<int>(
                value: raceNum.value,
                icon: const Icon(Icons.arrow_downward),
                elevation: 16,
                style: const TextStyle(color: Colors.deepPurple),
                underline: Container(
                  height: 2,
                  color: Colors.deepPurpleAccent,
                ),
                onChanged: (int? newValue) {
                  raceNum.value=newValue!;

                },
                items: <int>[1, 2, 3, 4,5,6,7,8,9]
                    .map<DropdownMenuItem<int>>((int value) {
                  return DropdownMenuItem<int>(
                    value: value,
                    child: Text(value.toString()),
                  );
                }).toList(),
              ),
              const Padding(padding: EdgeInsets.all(10)),
              // Flutter1.22以降のみ
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                  onPrimary: Colors.black,
                  shape: const StadiumBorder(),
                ),
                onPressed: () {
                  tempResultController.updateRaceNumber(raceNum.value);
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SttPage()));
                },
                child: const Text(
                  '次へ',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
