
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yacht_result/view/race_number_page.dart';
import 'package:yacht_result/view/stt_page.dart';
import 'package:yacht_result/view/stt_page_vm.dart';



class RegattaNamePage extends ConsumerWidget {
  const RegattaNamePage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final tempResultController = ref.read(tempRankProvider.notifier);
    String regattaName="";
    return Scaffold(
      appBar: AppBar(
        title: const Text("レガッタ名入力"),
        centerTitle: true,
      ),

      body: Container(
        margin: EdgeInsets.all(20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:  [
              TextField(
                onChanged: (value){
                  regattaName=value;
                },
                onSubmitted: (value){
                  regattaName=value;
                },

                decoration: const InputDecoration(
                  labelText: 'レガッタ名を入力',
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                ),
              ),
              Padding(padding: EdgeInsets.all(10)),
              // Flutter1.22以降のみ
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                  onPrimary: Colors.black,
                  shape: const StadiumBorder(),
                ),
                onPressed: () {
                  tempResultController.updateRegattaName(regattaName);
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>SttPage()));
                },
                child: const Text('次へ',
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
