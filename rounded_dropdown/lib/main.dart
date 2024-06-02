import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

enum Genders {
  none(text: '無回答'),
  male(text: '男性'),
  female(text: '女性');

  const Genders({required this.text});
  final String text;
}

// https://zenn.dev/hirotosuzuki/articles/bdc52850441b60
enum Prefectures {
  hokkaido(text: '北海道'),
  aomori(text: '青森県'),
  iwate(text: '岩手県'),
  miyagi(text: '宮城県'),
  akita(text: '秋田県'),
  yamagata(text: '山形県'),
  fukushima(text: '福島県'),
  ibaraki(text: '茨城県'),
  tochigi(text: '栃木県'),
  gunma(text: '群馬県'),
  saitama(text: '埼玉県'),
  chiba(text: '千葉県'),
  tokyo(text: '東京都'),
  kanagawa(text: '神奈川県'),
  niigata(text: '新潟県'),
  toyama(text: '富山県'),
  ishikawa(text: '石川県'),
  fukui(text: '福井県'),
  yamanashi(text: '山梨県'),
  nagano(text: '長野県'),
  gifu(text: '岐阜県'),
  shizuoka(text: '静岡県'),
  aichi(text: '愛知県'),
  mie(text: '三重県'),
  shiga(text: '滋賀県'),
  kyoto(text: '京都府'),
  osaka(text: '大阪府'),
  hyogo(text: '兵庫県'),
  nara(text: '奈良県'),
  wakayama(text: '和歌山県'),
  tottori(text: '鳥取県'),
  shimane(text: '島根県'),
  okayama(text: '岡山県'),
  hiroshima(text: '広島県'),
  yamaguchi(text: '山口県'),
  tokushima(text: '徳島県'),
  kagawa(text: '香川県'),
  ehime(text: '愛媛県'),
  kochi(text: '高知県'),
  fukuoka(text: '福岡県'),
  saga(text: '佐賀県'),
  nagasaki(text: '長崎県'),
  kumamoto(text: '熊本県'),
  oita(text: '大分県'),
  miyazaki(text: '宮崎県'),
  kagoshima(text: '鹿児島県'),
  okinawa(text: '沖縄県');

  const Prefectures({required this.text});
  final String text;
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Genders myGender = Genders.none;
  Prefectures myPrefecture = Prefectures.hokkaido;
  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    controller.text = myPrefecture.text;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            children: [
//              DropdownButtonFormField<Genders>(
//                decoration: const InputDecoration(
//                  border: UnderlineInputBorder(),
//                  labelText: '性別',
//                ),
//                items: [
//                  for (final gender in Genders.values)
//                    DropdownMenuItem(
//                      value: gender,
//                      child: Text(gender.text),
//                    )
//                ],
//                onChanged: (value) {
//                  if (value != null) {
//                    setState(() {
//                      myGender = value;
//                    });
//                  }
//                },
//              ),
              PopupMenuButton(
                itemBuilder: (context) => [
                  for (final gender in Genders.values)
                    PopupMenuItem(
                      value: gender,
                      child: Text(gender.text),
                    )
                ],
                initialValue: myGender,
                onSelected: (value) => setState(() {
                  myGender = value;
                }),
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8.0))),
                child: InputDecorator(
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: '性別',
                  ),
                  child: Text(myGender.text),
                ),
              ),
              TypeAheadField(
                textFieldConfiguration: TextFieldConfiguration(
                  controller: controller,
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: '都道府県',
                  ),
                ),
                // 以下のオプションを追加
                suggestionsBoxDecoration: SuggestionsBoxDecoration(
                    borderRadius: BorderRadius.circular(8.0)),
                suggestionsCallback: (pattern) async {
                  List<Prefectures> matches = [...Prefectures.values];
                  matches
                      .retainWhere((element) => element.text.contains(pattern));
                  return matches;
                },
                itemBuilder: (context, suggestion) {
                  return ListTile(title: Text(suggestion.text));
                },
                onSuggestionSelected: (suggestion) => setState(() {
                  myPrefecture = suggestion;
                  controller.text = suggestion.text;
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
