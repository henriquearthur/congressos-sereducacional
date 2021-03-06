import 'package:congressos_sereducacional/app/app_module.dart';
import 'package:congressos_sereducacional/app/pages/home/home_module.dart';
import 'package:congressos_sereducacional/app/pages/pick_congress/components/congress_box.dart';
import 'package:congressos_sereducacional/app/pages/pick_congress/pick_congress_bloc.dart';
import 'package:congressos_sereducacional/app/pages/pick_congress/pick_congress_module.dart';
import 'package:congressos_sereducacional/app/shared/blocs/congress_bloc.dart';
import 'package:congressos_sereducacional/app/shared/components/admob_banner_ad.dart';
import 'package:congressos_sereducacional/app/shared/models/congress.dart';
import 'package:congressos_sereducacional/app/shared/theme/styles.dart';
import 'package:flutter/material.dart';

import 'components/pick_congress_header.dart';

class PickCongressPage extends StatelessWidget {
  final _congressBloc = AppModule.to.getBloc<CongressBloc>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const PickCongressHeader(),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: RichText(
                text: TextSpan(
                  text:
                      'Esses são os próximos congressos a serem realizados pelo ',
                  style: TextStyle(
                    fontFamily: Styles.primaryFontFamily,
                    color: Styles.textColor,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                        text: 'Grupo Ser Educacional.',
                        style: TextStyle(
                            fontWeight: Styles.primaryFontBoldWeight)),
                    TextSpan(
                        text:
                            ' Toque em um para ver mais informações e a programação oficial.'),
                  ],
                ),
              ),
            ),
            const AdmobBannerAd(
                adUnit: 'ca-app-pub-6254443832700241/9016352610'),
            StreamBuilder(
              stream: PickCongressModule.to
                  .bloc<PickCongressBloc>()
                  .congressListOut,
              builder: (BuildContext context,
                  AsyncSnapshot<List<Congress>> snapshot) {
                if (snapshot.hasData) {
                  var congresses = snapshot.data;

                  if (congresses.isEmpty) {
                    return Container(
                      child: Text("Não há congressos acontecendo em breve."),
                    );
                  } else {
                    return ListView.builder(
                      primary: false,
                      shrinkWrap: true,
                      padding: const EdgeInsets.all(16.0),
                      itemCount: congresses.length,
                      itemBuilder: (BuildContext context, int index) {
                        return CongressBox(
                          congress: congresses[index],
                          onTap: () {
                            _congressBloc.pick(congresses[index]);

                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (_) => HomeModule()));
                          },
                        );
                      },
                    );
                  }
                }

                return Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                    child: CircularProgressIndicator(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
