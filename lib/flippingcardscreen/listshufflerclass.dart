import 'dart:math';

class Listsshuffler {
  List<String> flippingcards;
  List<String> flippingcardsletter;

  Listsshuffler(this.flippingcards, this.flippingcardsletter);

  void shuffle(){
    var combined = List.generate(flippingcards.length, (i) => [flippingcards[i],
      flippingcardsletter[i]]);
    combined.shuffle(Random.secure());
    flippingcards = combined.map((pair) => pair[0]).toList();
    flippingcardsletter = combined.map((pair) => pair[1]).toList();
  }
}

var lists = Listsshuffler([
  'assets/flipping card/back/backa.png',
  'assets/flipping card/back/backb.png',
  'assets/flipping card/back/backc.png',
  'assets/flipping card/back/backd.png',
  'assets/flipping card/back/backe.png',
  'assets/flipping card/back/backf.png',
  'assets/flipping card/back/backg.png',
  'assets/flipping card/back/backh.png',
  'assets/flipping card/back/backi.png',
  'assets/flipping card/back/backj.png',
  'assets/flipping card/back/backk.png',
  'assets/flipping card/back/backl.png',
  'assets/flipping card/back/backm.png',
  'assets/flipping card/back/backn.png',
  'assets/flipping card/back/backo.png',
  'assets/flipping card/back/backp.png',
  'assets/flipping card/back/backq.png',
  'assets/flipping card/back/backr.png',
  'assets/flipping card/back/backs.png',
  'assets/flipping card/back/backt.png',
  'assets/flipping card/back/backu.png',
  'assets/flipping card/back/backv.png',
  'assets/flipping card/back/backw.png',
  'assets/flipping card/back/backx.png',
  'assets/flipping card/back/backy.png',
  'assets/flipping card/back/backz.png',
], [
  'A',
  'B',
  'C',
  'D',
  'E',
  'F',
  'G',
  'H',
  'I',
  'J',
  'K',
  'L',
  'M',
  'N',
  'O',
  'P',
  'Q',
  'R',
  'S',
  'T',
  'U',
  'V',
  'W',
  'X',
  'Y',
  'Z',]);