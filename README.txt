!!!パンくずリストプラグイン
README

!Hiro Sakuma <sakuma@zero52.com>
!Copyright 2005-2009 BitCoffee, Inc. All Rights Reserved.
!Copyright (C) medicalsystems, Inc. All Rights Reserved.


!!パンくずリストプラグインとは

ページのパンくずリストを自動生成するプラグインです．

パンくずリストとは，


 ホームページ ＞ 大分類 ＞ 中分類 ＞ 小分類 ＞ ページ


といったページの階層構造の表示のことです．


!!使い方

パンくずリストプラグインでは，ページ名の/(スラッシュ)を階層区切りとして認識します．

ページを作成する際，ただ名前を付けるのではなく，


 大分類/中分類/小分類


という命名規則を使うと，威力を発揮します．


!!文法


一番簡単なのが，


 {{pankudu}}


とだけ書く方法です．

書かれたページについてのパンくずリストを表示します．

[[Header]]や[[Footer]]に記述すると，全ページで表示されて便利です．


特定のページについての表示を行いたい場合，


 {{pankudu hogehoge/blabla}}


と書きます．この場合，


 [[hogehoge|hogehoge]] ＞ [[blabla|hogehoge/blabla]]


という出力になります．


区切り文字をデフォルトの ''' ＞ ''' から変えたい場合，


 {{pankudu ," >> "}}


などとします．


現在のページ名に，命名規則を導入して無い場合など，任意のページを親にしたい場合，


 {{pankudu ,,ホームページ,大分類,中分類,小分類}}


と記述すると，


 [[ホームページ|ホームページ]] ＞ [[大分類|大分類]] ＞ [[中分類|中分類]] ＞ [[小分類|小分類]] ＞ [[ページ|ページ]]


という出力になります．


