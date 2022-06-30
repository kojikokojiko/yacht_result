
import "package:flutter/material.dart";
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:speech_to_text/speech_recognition_error.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:yacht_result/view/stv_page_vm.dart';

class SttWidget extends HookConsumerWidget {
  SttWidget({Key? key}) : super(key: key);

  stt.SpeechToText speech = stt.SpeechToText();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tempResultController = ref.read(tempRankProvider.notifier);
    final tempResultState = ref.watch(tempRankProvider);
    final lastWords = useState("");
    final lastError = useState("");
    final lastStatus = useState("");
    Future<void> _stop() async {
      speech.stop();
    }

    void resultListener(SpeechRecognitionResult result) {
      // lastWords = '${result.recognizedWords}';
      lastWords.value = result.recognizedWords;
      // tempResultController.addRank(int.parse(result.recognizedWords));
      // 数字にできる文字列か判定

      // // if(double.tryParse(result.recognizedWords)!=null){
      // //   tempResultController..add(Math.parseInt(result.recognizedWords));
      // //
      // // }
    }

    void errorListener(SpeechRecognitionError error) {
      lastError.value = '${error.errorMsg} - ${error.permanent}';
    }

    void statusListener(String status) {
      lastStatus.value = '$status';
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

    return Container(
      margin: EdgeInsets.all(10),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              '変換文字:${lastWords.value}',
              // style: Theme.of(context).textTheme.headline4,
            ),
            Text(
              'ステータス : ${lastStatus.value}',
              // style: Theme.of(context).textTheme.headline4,
            ),
            ElevatedButton(
              child: const Text('speak'),
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
                onPrimary: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: _speak,
            ),
            ElevatedButton(
              child: const Text('stop'),
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
                onPrimary: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: _stop,
            ),
          ElevatedButton(
            child: const Text('確定'),
            style: ElevatedButton.styleFrom(
              primary: Colors.blue,
              onPrimary: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            onPressed: (){
              try {
                tempResultController.addRank(int.parse(lastWords.value));
                print(tempResultState);
              } catch (exception) {
                print("fdfd $exception");
              }

            },
          ),



            Expanded(
              child: ListView.builder(
                  itemCount: tempResultState.length,
                  itemBuilder: (BuildContext context, int index) {
                return Container(
                    child: Center(child: Text("${tempResultState[index]}")),
                  color: Colors.red,

                );
              }),
            )
          ],
        ),
      ),
    );
  }
}
