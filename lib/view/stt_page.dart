import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yacht_result/view/rank_controller.dart';

import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:speech_to_text/speech_recognition_error.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:yacht_result/view/resultpage.dart';

import 'package:yacht_result/view/stt_page_vm.dart';

import 'package:flutter_slidable/flutter_slidable.dart';

class SttPage extends HookConsumerWidget {
  SttPage({Key? key}) : super(key: key);
  stt.SpeechToText speech = stt.SpeechToText();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final rankListController = ref.read(rankListProvider.notifier);

    final tempResultController = ref.read(tempRankProvider.notifier);
    final tempResultState = ref.watch(tempRankProvider);

    final raceNum = useState(1);
    final lastWords = useState("");
    final lastError = useState("");
    final lastStatus = useState("");
    Future<void> _stop() async {
      speech.stop();
    }

    void resultListener(SpeechRecognitionResult result) {
      lastWords.value = result.recognizedWords;
    }

    void errorListener(SpeechRecognitionError error) {
      lastError.value = '${error.errorMsg} - ${error.permanent}';
    }

    void statusListener(String status) {
      lastStatus.value = status;
    }

    Future<void> _speak() async {
      bool available = await speech.initialize(
          onError: errorListener, onStatus: statusListener);
      if (available) {
        speech.listen(onResult: resultListener);
      } else {
        print("The user has denied the use of speech recognition.");
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Container(
          child: Row(
            children: [
              Text("着順入力"),

            ],
          ),
        ),
        centerTitle: true,
        actions: [
          Container(
            margin: const EdgeInsets.all(10),
            width: 70,
            height: 20,
            child: ElevatedButton(
              onPressed: () {
                rankListController.setRank(tempResultState);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ResultPage()));
              },
              style: OutlinedButton.styleFrom(
                backgroundColor: Colors.grey[300],
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
              ),
              child: const Text(
                "保存",
                style: TextStyle(color: Colors.black),
              ),
            ),
          )
        ],
      ),
      body: Container(
        margin: const EdgeInsets.all(10),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("レース番号"),
                  TextButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (_) {
                            return SimpleDialog(
                              title: const Text('レース番号を選択'),
                              children: <Widget>[
                                for (int i = 1; i < 9; i++)
                                  SimpleDialogOption(
                                    child: Text('第$iレ―ス'),
                                    onPressed: () {
                                      // raceNum.value=i;
                                      tempResultController.updateRaceNumber(i);
                                      Navigator.pop(context);
                                    },
                                  ),
                              ],
                            );
                          });
                    },
                    child: Text(
                      tempResultState.raceNum.toString(),
                      style: TextStyle(
                          fontSize: 20,
                          color: (tempResultState.raceNum == 0)
                              ? Colors.red
                              : Colors.blue),
                    ),
                  ),
                ],
              ),
              Text(
                '艇番:${lastWords.value}',
                style: Theme
                    .of(context)
                    .textTheme
                    .headline4,
              ),
              Text(
                'ステータス : ${lastStatus.value}',
                style: Theme
                    .of(context)
                    .textTheme
                    .headline4,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: tempResultState.ranks.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: [
                        Slidable(
                          endActionPane: ActionPane(
                            motion: const DrawerMotion(),
                            children: [
                              SlidableAction(
                                onPressed: (_) {
                                  tempResultController.rmSelectedRank(index);
                                },
                                flex: 1,
                                icon: Icons.delete,
                              ),
                              SlidableAction(
                                onPressed: (_) {
                                  // 編集
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      // final sfd="dfdf";
                                      // final temp_edit_num=useState(tempResultState.ranks[index]);
                                      return ModalEditPage(
                                        prevNum: tempResultState.ranks[index],
                                        ranksIndex: index,
                                      );
                                    },
                                  );
                                },
                                flex: 1,
                                icon: Icons.edit,
                              ),
                            ],
                          ),
                          child: ListTile(
                            title: Text(
                              "${index + 1}着 ${tempResultState.ranks[index]}",
                              style: Theme
                                  .of(context)
                                  .textTheme
                                  .headline5,
                            ),
                          ),
                        ),
                        const Divider(),
                      ],
                    );
                  },),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue,
                      onPrimary: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: _speak,
                    child: const Text('speak'),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue,
                      onPrimary: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: _stop,
                    child: const Text('stop'),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue,
                      onPrimary: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () {
                      try {
                        tempResultController
                            .addRank(int.parse(lastWords.value));
                        print(tempResultState);
                      } catch (exception) {
                        // print("fdfd $exception");
                      }
                    },
                    child: const Text('確定'),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue,
                      onPrimary: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () {
                      try {
                        tempResultController.rmLastRank();
                        print(tempResultState);
                      } catch (exception) {
                        print("fdfd $exception");
                      }
                    },
                    child: const Text('削除'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ModalEditPage extends HookConsumerWidget {
  const ModalEditPage({
    Key? key,
    required this.prevNum,
    required this.ranksIndex,
  }) : super(key: key);

  // final ValueNotifier<int> temp_edit_num;
  final prevNum;
  final ranksIndex;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tempEditNum = useState(prevNum);
    final tempResultController = ref.read(tempRankProvider.notifier);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AlertDialog(
          title: const Text("順位を編集"),
          content: Column(
            children: [
              Text(tempEditNum.value.toString()),
              TextField(
                  onChanged: (value) {
                    tempEditNum.value = int.parse(value);
                  },
                  onSubmitted: (value) {
                    tempEditNum.value = int.parse(value);
                  },
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly])
            ],
          ),
          actions: [
            TextButton(
              child: const Text("Cancel"),
              onPressed: () => Navigator.pop(context),
            ),
            TextButton(
                child: const Text("OK"),
                onPressed: () {
                  tempResultController.editRank(ranksIndex, tempEditNum.value);
                  Navigator.pop(context);
                }),
          ],
        ),
      ],
    );
  }
}
