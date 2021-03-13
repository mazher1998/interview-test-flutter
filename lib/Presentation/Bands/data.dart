import 'package:flutter/material.dart';

import 'date_model.dart';
class Bands{

  final String name;
  Bands({
    this.name,
  });
}

final Data a = Data(
dayy: "20 ",
month: "Mar",
day: "SUN",
colorr: Colors.red
);
final Data b = Data(
dayy: "21 ",
month: "Mar",
day: "MON",
colorr: Colors.green
);
final Data c = Data(
dayy: "22 ",
month: "Mar",
day: "TUE",
colorr: Colors.blue
);
final Data d = Data(
dayy: "23 ",
month: "Mar",
day: "WED",
colorr: Colors.yellow
);
List<Data> favorites = [a, b, c, d];

final Bands aa = Bands(
  name: "The Slowstarter"
);
final Bands bb = Bands(
  name: "Blue Moon band"
);
final Bands cc = Bands(
  name: "Rozi Baak Band"
);
final Bands dd = Bands(
  name: "Brooks & Dunn"
);
final Bands ee = Bands(
  name: "Cultural Band"
);

List<Bands> bands = [aa, bb, cc, dd,ee];
