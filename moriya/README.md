# AJACS安芸　パスウェイデータベースの紹介とKEGG PATHWAYの使い方  
情報・システム研究機構
データサイエンス共同利用基盤施設
ライフサイエンス統合データベースセンター  
守屋 勇樹 moriya@dbcls.rois.ac.jp  
2016/07/05 AJACS安芸  

--
## 講習会の流れ  

今回の講習ではパスウェイデータベースの紹介と、ウェブブラウザを使った３つのデータベースの操作を行います
  - パスウェイデータベースの概要
  - BioCyc に触れてみる
    - データをパスウェイにマッピングする
  - Reactome に触れてみる
    - Analysis tool を用いてパスウェイにマッピングする
  - KEGG PATHWAY
    - KEGG Mapper を用いてパスウェイにマッピングする
    - BlastKOALA を用いて新規遺伝子の機能を推定し、パスウェイにマップングする

---
#### 受講前アンケートにご協力いただき、ありがとうございます

|パスウェイ関連のデータベース使ったことがありますか|人数|割合|
|:--|--:|:--:|
|日常的に使っている|2 名|4 %|
|今後使いたい|28 名|61 %|
|使う予定はすぐにはないが使い方は覚えたい|16 名|35 %|

|KEGG を使ったことがありますか|人数|割合|
|:--|--:|:--:|
|使ったことがある|6 名|13 %|
|知っている|10 名|23 %|
|聞いたことがある|14 名|32 %|
|知らない|14 名|32 %|

---
## パスウェイデータベースとは
パスウェイとは、生体内での遺伝子やタンパク質、その他の化合物等の分子間相互作用を "経路" として表現したものです。相互作用の知識を集積して可視化、電子化したものがパスウェイデータベースと呼ばれています。歴史的には、代謝経路の表現から始まりました

- [ベーリンガーマンハイム社（現ロシュ社）の代謝マップ](http://www.roche.com/sustainability/what_we_do/for_communities_and_environment/philanthropy/science_education/pathways.htm) (1965~)
- 最初は紙媒体での出版。のちに[電子化](http://biochemical-pathways.com/)されています

![pathway1](https://github.com/moriya-dbcls/AJACS60/blob/master/moriya/images/a60-pathway1.png)

![pathway2](https://github.com/moriya-dbcls/AJACS60/blob/master/moriya/images/a60-pathway2.png)

- 計算機上で表現することで、様々な可視化が行えるようになり、パスウェイ全体を俯瞰したり、一部の相互作用に注目したり、生命現象の理解が行い易くなります
- また、データベース化することで網羅的に扱えるようになり、コンピューターでの利用が可能になします
  - ゲノムアノテーションや種間比較、進化解析
  - 遺伝子発現などのエンリッチメント解析
  - モデル化、シミュレーション、予測

今回の講習では遺伝子やタンパク質、化合物をパスウェイデータベースにマッピングして可視化と、ブラウザ経由で行うゲノムアノテーションについて実習していきます

---
## いろいろなパスウェイデータベース
#### Pathguide
- http://www.pathguide.org/
- パスウェイリソースのリスト約 550　(2013)
  - Availability: 有料か無料か  
  - Standards: 標準データ形式(BioPAX, SBML等)に準拠しているかどうか

![pathguide](https://github.com/moriya-dbcls/AJACS60/blob/master/moriya/images/a60-pathguide.png)

歴史的には代謝経路の表現から始まりましたが、現在ではタンパク質間相互作用、シグナル伝達系、遺伝子制御、環境シグナルなど様々な生命現象がパスウェイとして表現されています

- Pathguide での分類
  - タンパク質間相互作用
  - 代謝パスウェイ
  - シグナリングパスウェイ
  - パスウェイダイアグラム
  - 転写因子・遺伝子制御ネットワーク
  - タンパク質-化合物間相互作用
  - 遺伝的相互作用ネットワーク
  - アミノ酸配列解析
  - その他

#### パスウェイデータベースの表現
見やすくするために、ダイアグラムで表現されていることが多くなっています

- KEGG Pathway での表現例
  - 代謝パスウェイでは代謝産物をノード、酵素反応をエッジとして表現されています
  - 制御系ではタンパク質や遺伝子、その他の小分子をノード、その関係性（活性化、抑制、リン酸化など）がエッジとして表現されています
  
![pathway1](https://github.com/moriya-dbcls/AJACS58/blob/master/moriya/images/a58-pathway1.png)

#### パスウェイデータベースのデータ形式
計算機での取り扱いを目的として XML (Extensible Markup Language) で記述されていることが多くなっています
- [KGML](http://www.genome.jp/kegg/xml/docs/) (KEGG Markup Language) は分子間の関係とダイアグラムのレイアウトを取り扱うための KEGG 独自のフォーマット
- [SBML](http://sbml.org/Main_Page) (Systems Biology Markup Language)、[CellML](https://www.cellml.org/)、[CSML](http://www.csml.org/) (Cell System Markup Language) はパスウェイのシミュレーションやモデリングのためのフォーマット
- [PSI-MI](http://www.psidev.info/node/60) (Proteomics Standards Initiative Molecular Interaction XML Format) はタンパク質間相互作用を記述するためのフォーマット
- [BioPAX](http://www.biopax.org/) (Biological Pathways Exchange) は様々なパスウェイデータを統合したり、データ交換を行うことを目的として策定された標準フォーマット

どのパスウェイデータベースを研究に使えば良いかは、対象生物や対象パスウェイ、目的によって異なってきます  
ここでは BioCyc, Reactome, KEGG PATHWAY を紹介します

----
## BioCyc
- ウェブサイト：http://biocyc.org/
- 開発：SRIインターナショナル（Stanford Research Institute）
- 対象：大腸菌からヒトまで、異株を含めて 7,600 種以上
  - 専門家が手作業で作成した文献ベースのデータ＋自動ツール
  - 代謝パスウェイ（一部、遺伝子制御系）
- 利用：アカデミックフリー
- データ形式：BioPAX

![biocyc1](https://github.com/moriya-dbcls/AJACS60/blob/master/moriya/images/a60-biocyc1.png)


#### 実習 1-1. 対象生物種を見てみよう  
- http://biocyc.org/biocyc-pgdb-list.shtml
- データベースには３つのレベルがあります
  - Tier 1：専門家が手作業で作成した文献ベースのデータ (7 DBs)
  - Tier 2：自動ツールで作成したデータを手作業で修正 (>40 DBs)
  - Tier 3：自動ツール (>7,500 DBs)
- MetaCyc だけは 生物種のデータベースではなく、2,000 種以上から構築したリファレンス代謝パスウェイ

![biocyc2](https://github.com/moriya-dbcls/AJACS60/blob/master/moriya/images/a60-biocyc2.png)

#### 実習 1-2. 好きな生物のパスウェイを見てみよう
- 好きな生物種をクリック（例： [EcoCyc](http://biocyc.org/ecocyc/index.shtml)）
- 右上の検索ボックスで "glycolysis" や "tca" などの生命現象関連の単語を入力し、Quick Search ボタンをクリック
- ![biocyc6](https://github.com/moriya-dbcls/AJACS58/blob/master/moriya/images/a58-biocyc6.png)
- パスウェイが存在する場合、リストが表示されるので、クリック
- 代謝産物のパスウェイが表示される
- More Detail ボタンをクリックすると、酵素の情報が追加され、もう一度 More Detail ボタンをクリックすると代謝産物の構造情報が追加される
- 右の Options メニューから、表示のカスタマイズやダウンロードが可能
- ![biocyc3](https://github.com/moriya-dbcls/AJACS58/blob/master/moriya/images/a58-biocyc3.png)


#### 実習 1-3. 種間比較をしてみよう
- 右の Option メニューの [Species Comparison](http://ecocyc.org/compare-frame-in-orgs?type=PATHWAY&object=GLYCOLYSIS&initial-orgs=(ECOLI)&detail-level=1) をクリック
- 比較する種の選択画面が表示されるので、比較したい好きな種を入力し、OK をクリック
- ![biocyc7](https://github.com/moriya-dbcls/AJACS58/blob/master/moriya/images/a58-biocyc7.png)
- パスウェイや遺伝子、オペロン構造などが比較できる


#### 実習 1-4. 好きな生物の Overview パスウェイを見てみよう  
- 右の Option メニューの [Show on Cellular Overview](http://ecocyc.org/overviewsWeb/celOv.shtml?orgid=ECOLI&pnids=GLYCOLYSIS) をクリック
- ![biocyc2](https://github.com/moriya-dbcls/AJACS58/blob/master/moriya/images/a58-biocyc2.png)


### 実習 1-5. サンプル・データをマッピングしてみよう  
- 右のメニューの Overlay Experimental Data ＞ Upload Data from File
- 出てきた入力フォームのファイルアップロード部のすぐ下の (or "paste data" directly into form) のリンクをクリック
- ![biocyc4](https://github.com/moriya-dbcls/AJACS58/blob/master/moriya/images/a58-biocyc4.png)
- テキストエリアに切り替わるので、テキストエリア右上の Gene example をクリックすると、サンプル・データが入る
- データのカラム（1〜3）を入力して Submit ボタンをクリック
- ![biocyc5](https://github.com/moriya-dbcls/AJACS58/blob/master/moriya/images/a58-biocyc5.png)

詳細は [BioCyc User's guide](http://biocyc.org/PToolsWebsiteHowto.shtml) を参照

----
## Reactome
- ウェブサイト：http://www.reactome.org/
- 開発：EMBLE-EBI 他
- 対象：ヒトを中心に脊椎動物、酵母、植物、19 種
  - 専門家が手作業で作成した文献ベースのデータ（ヒト）
  - 代謝パスウェイ、シグナル伝達系、他
- 利用：フリー
- データ形式：BioPAX, SBML

![reactome1](https://github.com/moriya-dbcls/AJACS58/blob/master/moriya/images/a58-reactome1.png)

#### 実習 2-1. 好きな生物のパスウェイを見てみよう  
- [Browse Pathways](http://www.reactome.org/PathwayBrowser/) ボタンをクリック
- 初期画面はヒトのパスウェイなので、好きな種を選択
- ![reactome2](https://github.com/moriya-dbcls/AJACS58/blob/master/moriya/images/a58-reactome2.png)
- 左のパスウェイのリスト、右のパスウェイマップが連動
  - 下層になると、ダイヤグラムが表示される
  - Reactome には代謝パスウェイの他に制御系も含むため、ノードとエッジの関係が複数ある
- ![reactome5](https://github.com/moriya-dbcls/AJACS58/blob/master/moriya/images/a58-reactome5.png)

#### 実習 2-2. パスウェイをハイライトさせてみよう  
- マップ左上の虫眼鏡アイコンをクリックして、 "glycolysis" や "tca" などの生命現象関連の単語を入力すると、候補がリストアップされるので選択
- ![reactome3](https://github.com/moriya-dbcls/AJACS58/blob/master/moriya/images/a58-reactome3.png)

#### 実習 2-3. サンプル・データをマッピングしてみよう
- サンプルがヒトしか無いので、ヒトのパスウェイに移動
- 上、右側の Analysis: アイコンをクリック
- ファイルアップロード部のすぐ下の click here to paste your data... をクリック
- ![reactome4](https://github.com/moriya-dbcls/AJACS58/blob/master/moriya/images/a58-reactome4.png)
- 右のサンプルをクリックして GO ボタンをクリック
  - ID リストの場合は Over-representation 解析 (ORA）, Enrichment 解析
  - ID と数値のリストの場合は発現解析
    - 再生ボタンで、複数のカラムのデータを連続表示
- ![reactome6](https://github.com/moriya-dbcls/AJACS58/blob/master/moriya/images/a58-reactome6.png)

#### 実習 2-4. 種間比較をしてみよう
- Analysis tools から Species Comparison を選択
- ヒトとその他の生物のパスウェイ比較が可能

詳細は [Reactome User's Guide](http://wiki.reactome.org/index.php/Usersguide) を参照  

他のReactome
- http://www.reactome.org/pages/about/other-reactomes/
  
----
## KEGG PATHWAY
- ウェブサイト：http://www.kegg.jp/
- 開発：京都大学
- 対象：ゲノムの決まった全生物種（真核生物、真性細菌、古細菌）4,000 種以上
  - 専門家が手作業で作成した文献ベースのデータ＋自動ツール
    - リファレンスパスウェイ：専門家が手作業で文献ベースから作成（BioCyc の Tier 1(MetaCyc)に相当）
    - 種毎のパスウェイ（手動）：自動ツールで作成し、手作業でキュレーション（BioCyc の Tier 2 に相当）
    - 種毎のパスウェイ（自動）：自動ツールで作成（Buicyc の Tier 3 に相当）
  - 代謝パスウェイ、シグナル伝達系、他
- 利用：アカデミックフリー
- データ形式：KGML
  - [KCPAVS KEGG-XML converter](http://www.kcpavs.cidms.org/kcpavs-features/tools-and-utilities/kegg-xml-converter) などで代謝パスウェイ、シグナル伝達などの多くのパスウェイを標準形式 に変換可能
  - [KEGGscape] (http://apps.cytoscape.org/apps/keggscape) でネットワーク可視化ソフト Cytoscape に読み込み可能

![kegg1](https://github.com/moriya-dbcls/AJACS58/blob/master/moriya/images/a58-kegg1.png)

#### KEGG はデータベースの集合
- [KEGG2](http://www.kegg.jp/kegg/kegg2.html) をクリック
- KEGG PATHWAY を含むシステム情報データベースの他に、遺伝情報、化学情報、健康情報などのデータベースがリンクしている
- ここでは PATHWAY 以外の詳細は省くので、それ以外の詳細は過去の AJACS 資料を参照
  - [AJACS50](http://motdb.dbcls.jp/?plugin=attach&pcmd=open&file=140912AJACS50_kawano.pdf&refer=AJACS50)
  - [AJACS51](http://motdb.dbcls.jp/?plugin=attach&pcmd=open&file=KEGG_2014_12_slide.pdf&refer=AJACS51)、[付録資料](http://motdb.dbcls.jp/?plugin=attach&pcmd=open&file=KEGG_2013_11.pdf&refer=AJACS51)
  - [AJACS53](https://github.com/AJACS-training/AJACS53/tree/master/skwsm)
  - [AJACS54](http://motdb.dbcls.jp/?plugin=attach&pcmd=open&file=AJACS2015_muto_handout_.pdf&refer=AJACS54)


#### 実習 3-1. 対象生物種を見てみよう
- データベースのテーブルの下、[KEGG organisms](http://www.kegg.jp/kegg/catalog/org_list.html) をクリック
  - KEGG では 3-4 文字の独自の生物種コードを使用している
  - 生物種コードのリンクをクリックすると、種の情報のページに飛ぶ
  - "Annotation" が manual -> 手作業（hsa等）、KOALA -> 自動ツール（pps等）
  - ![kegg5](https://github.com/moriya-dbcls/AJACS58/blob/master/moriya/images/a58-kegg5.png)	

- 生物種リスト上の [Draft](http://www.kegg.jp/kegg/catalog/org_list1.html) をクリック
  - 真核生物のドラフトゲノムのリストで、ここは生物種コードではなくT番号で管理されている
- [Meta](http://www.genome.jp/kegg/catalog/org_list3.html) はメタゲノム

#### 実習 3-2. パスウェイマップを見てみよう  
- [トップページ](http://www.kegg.jp) 上方の検索ボックスで "glycolysis" や "tca" などの生命現象関連の単語を入力し、Search ボタンをクリック
- ![kegg4](https://github.com/moriya-dbcls/AJACS58/blob/master/moriya/images/a58-kegg4.png)
- KEGG データベース全体でヒットしたエントリーが全てリストアップされ、KEGG PATHWAY にヒットがあれば、一番上に表示されるのでクリック
- パスウェイの情報が表示されるエントリーページに移動するので、マップ画像をクリック
  - この色のついていない白いパスウェイマップが、専門家が手作業で文献ベースから作成したリファレンスパスウェイ
  - ボックスが遺伝子やタンパク質などの配列情報、丸が代謝産物、環境物質などの化合物
  - 右上の Help でそれぞれの図形の意味を見てみよう

#### 実習 3-3. 好きな生物のパスウェイを見てみよう
- プルダウンメニューから好きな生物を選択して Go をクリック
  - 多すぎて選びにくい場合
  - &lt; Sort below by alphabet &gt; を選択して Go をクリックでリストをソート
  - &lt; Set personalized menu &gt; を選択して Go をクリックでポップアップウィンドウからリストの絞り込み
  - ![kegg6](https://github.com/moriya-dbcls/AJACS58/blob/master/moriya/images/a58-kegg6.png)
    - ドラフトゲノム、メタゲノムはここからは選べないので、生物種リストのページから、種のページ、パスウェイリストへ移動
    - ![kegg7](https://github.com/moriya-dbcls/AJACS58/blob/master/moriya/images/a58-kegg7.png)
- 一部のボックスが緑色で塗られる、その生物の持つ遺伝子がマッピングされている


#### リファレンスパスウェイと種毎のパスウェイの関係  

![kegg2](https://github.com/moriya-dbcls/AJACS58/blob/master/moriya/images/a58-kegg2.png)

![kegg3](https://github.com/moriya-dbcls/AJACS58/blob/master/moriya/images/a58-kegg3.png)


#### 実習 3-4. Overview マップを見てみよう  
- http://www.kegg.jp/kegg/pathway.html
- 1.0 Global and overview maps の [Metabolic pathways](http://www.kegg.jp/kegg-bin/show_pathway?map01100) をクリック
  - 右の [[KEGG Atlus](http://www.kegg.jp/kegg/atlas/?01100)] は Java で動くビューワーで、自由度が少し高い分、動作が重たい
- 左にモジュールのリスト（KEGG におけるパスウェイの小さい機能単位）、右にマップが表示
- 機能単位毎にパスウェイを強調表示できる

#### 実習 3-5. 生物種毎の Overview マップを見てみよう  
- プルダウンメニューから生物を選択し、Go をクリック
- 生物の持っていない経路は灰色になる

#### 実習 3-6. ヒトの疾患パスウェイを見てみよう
- http://www.genome.jp/kegg/pathway.html#disease
- がん、免疫系疾患、神経変性疾患など多因子性の疾患
- 好きな疾患パスウェイをクリック（例：[大腸がん](http://www.genome.jp/kegg-bin/show_pathway?hsa05210)）
  - 赤字の遺伝子が疾患の病因遺伝子
- プルダウンメニューから [Homo sapiens (human) + Disease/drug](http://www.genome.jp/kegg-bin/show_pathway?org_name=hsadd&mapno=05210&mapscale=&show_description=hide) を選択
  - ピンクのボックスは何らかの疾患で病因遺伝子となっている遺伝子
  - ライトブルーのボックスは何らかの疾患で医薬品のターゲットとなっている遺伝子

#### 実習 3-7. 種間比較をしてみよう
- http://www.genome.jp/kegg/kegg2.html
- KEGG for pangenomes or genome comparison/combination のテキストボックスに "eco ecs" と入力して Go をクリック
  - eco：非病原性大腸菌 k-12
  - ecs：病原性大腸菌 O157
- ![kegg12](https://github.com/moriya-dbcls/AJACS58/blob/master/moriya/images/a58-kegg12.png)
- 上のメニューの [Pathway map](http://www.genome.jp/kegg-bin/show_organism?menu_type=pathway_maps&orgs=eco%20ecs) をクリック
- 好きなパスウェイをクリック
  - 前者が持っている遺伝子が緑、後者が持っている遺伝子がピンクで表示
  - Overview パスウェイの場合、両者が持っている遺伝子はライトブルーで表示
- 戻って、[Bacterial secretion system](http://www.genome.jp/kegg-bin/show_pathway?orgs=eco%20ecs&mapno=03070) パスウェイをクリック
  - 病原性に関わる III型、VI型分泌装置が O157 側だけが持っているのがわかる

- 戻って "api buc" を入力し、Valine, leucine and isoleucine biosynthesis パスウェイを見てみよう
  - api：アブラムシ
  - buc：ブフネラ
  - 共生生物間のパスウェイ補完によってアミノ酸合成が可能になっていることがわかる

３種以上の比較も可能  


#### 実習 3-8. 配列 ID を KEGG の遺伝子 ID に変換しよう
遺伝子 ID やタンパク質 ID を使ってパスウェイにマッピングしたいが KEGG のウェブサイトでは KEGG 遺伝子 ID が必要な場合もある  
  - [Link DB](http://www.genome.jp/linkdb/)
    - データベースエントリー ID 間のリンク情報を収集したデータベース
    - ID 変換にも利用可能
  - 図の Genes をクリックすると、KEGG に登録されている遺伝子と関連のあるデータベースが表示される
  - ![linkdb1](https://github.com/moriya-dbcls/AJACS58/blob/master/moriya/images/a58-linkdb1.png)
  - 表示されてたデータベースをクリックすると、下のフォームに選択したデータベースの内容が入るので、Download ボタンをクリックすると対応表がダウンロードできる
  - ![linkdb2](https://github.com/moriya-dbcls/AJACS58/blob/master/moriya/images/a58-linkdb2.png)


#### 実習 3-9. サンプル・データをマッピングしてみよう
- [KEGG Mapper](http://www.kegg.jp/kegg/mapper.html)
- Pathway mapping tool の２番目の [Search&Color Pathway](http://www.kegg.jp/kegg/tool/map_pathway2.html) をクリック
- テキストエリア右の Examples: を選択して Exec ボタンをクリック
  - [配列 ID or 代謝産物 ID] 塗りつぶし色[,線の色]
    - 配列 ID は KEGG gene ID, NCBI-GeneID, NCBI-ProteinID, UniProt ID
    - 代謝産物 ID は KEGG Compound ID （C番号）のみ
    - 線の色はオプション
    - 色は16進数表記か基本的なカラーネームで記述
- ヒットしたパスウェイのリストが表示、カッコの中はヒットした要素の数

チンパンジーの遺伝子 (NCBI-GeneID) をマッピングしてみよう  
- 例
```
453039 red  
104003784 coral
453645 gray,red  
453565 blue,yellow  
450453 #fbfb88  
463861 #88ffbb  
```

- テキストボックスに上の例をコピー＆ペースト
- Search against: にチンパンジーの生物種コードを入れる
  - コードがわからないので、org ボタンをクリック
  - ポップアップウィンドウでに 種名を入力すると、下のボックスに候補が出るので、選択したああと Select をクリック
  - チンパンジーのコード "ptr" が入力されていることを確認
- ![kegg8](https://github.com/moriya-dbcls/AJACS58/blob/master/moriya/images/a58-kegg8.png)
- Primry ID: で NCBI-GeneID を選択
- Use uncolored diagrams のチェックボックスをチェック（生物種マップの緑色を消去）
- Exec ボタンをクリック

自由に色を塗れる反面、色の定義付けなどは自分で行う必要がある

数値データをマッピングしてみよう  
- [Color Pathway](http://www.kegg.jp/kegg/tool/map_pathway3.html) をクリック
- 右のサンプル CML-COSMIC をダウンロード
  - 中身は配列 ID と数値の対応リスト
- Select KEGG pathway map: でパスウェイを指定（hsa05200)
- Enter file name containing the data: でダウロードしたサンプルファイルを指定
- File type: で Numerical value を選択
- Exec ボタンをクリック
- ![kegg9](https://github.com/moriya-dbcls/AJACS58/blob/master/moriya/images/a58-kegg9.png)

数値がグラデーションになってマッピングされる

他の２つの Example: もマッピングしてみよう

[Color Pathway WebGL](http://www.kegg.jp/kegg/tool/map_pathway3a.html) も使ってみよう  
- Example: を使って、どんな絵になるか試してみましょう

#### 実習 3-10. KEGG データベースにはない遺伝子をマッピングしてみよう
KEGG に登録されている配列データと類似性を計算し、自動で遺伝子機能を推定、パスウェイへのマッピングを行う  

- [KAAS](http://www.genome.jp/tools/kaas/)
  - 配列類似性の計算は [BLAST](http://blast.ncbi.nlm.nih.gov/Blast.cgi), [GhostX](http://www.bi.cs.titech.ac.jp/ghostx/), [GhostZ](http://www.bi.cs.titech.ac.jp/ghostz/) ベースの３つ
    - GhostX は BLAST より精度は劣るが 100 倍早い					 
    - GhostZ は GhostX より精度は劣るが２倍早い
  - 種間で両方向ベストヒットを利用して遺伝子機能を推定（片方向も可能）
  - ![kegg13](https://github.com/moriya-dbcls/AJACS58/blob/master/moriya/images/a58-kegg13.png)

- [BlastKOALA](http://www.kegg.jp/blastkoala/), [GhostKOALA](http://www.kegg.jp/ghostkoala/)
  - 配列類似性の計算は BLAST, GhostX ベース
  - クエリーからデータベースへの片方向の計算なのと、データベースを圧縮しているぶん KAAS より早い
  
BlastKOALA を使ったパスウェイへのマッピング
- [Annotate Sequence by BlastKOALA](http://www.kegg.jp/kegg/tool/annotate_sequence.html)
- Exapmle: の sequence.txt をコピー＆ペースト、もすくはダウンロードしてファイルを選択
  - Buchnera の仲間
- Family/Genus ボタンをクリック
  - サンプルが Buchnera の仲間なので、KEGG の Buchnera データを使う
  - 新たに開いたウィンドウで、Buchnera を探し、Taxonomy番号をクリック
- ![kegg10](https://github.com/moriya-dbcls/AJACS58/blob/master/moriya/images/a58-kegg10.png)
- Exec ボタンをクリック
  - 数分待つ（[講習会用結果例](http://www.kegg.jp/kegg-bin/blastkoala_result?id=89320edbab9f63445b34881655fc019b4531d61f&passwd=FKPNLx&mode=mapper)）
  - Reconstruct Pathway から遺伝子がマッピングされたパスウェイを見ることができる
- ![kegg11](https://github.com/moriya-dbcls/AJACS58/blob/master/moriya/images/a58-kegg11.png)

遺伝子IDとK番号の対応表を保存しておけば、KEGG Mapper 使っていつでも KEGG PATHWAY へのマッピングができる  
- [Reconstruct Pathway](http://www.genome.jp/kegg/tool/map_pathway.html)
- Example の genelist.txt は１生物の対応表
- genelist2.txt は４生物種の対応表で種間比較などに利用できる
  - データ形式
```
# organism1
gene1	K02874
gene7	K12864
gene12 …
# organism2
gene2798	K11649
gene2799	K12816
gene2800 …
# organism3
gene5398	K03627
gene5399	K02893
gene5400	…
```

#### せっかくなので、[小野さんの講習](https://github.com/AJACS-training/AJACS58/tree/master/hono)の[マル秘遺伝子リスト](https://raw.githubusercontent.com/AJACS-training/AJACS58/master/hono/secret_list.txt)をマッピングしてみよう  

-  [DAVID](https://david.ncifcrf.gov/home.jsp) から直接マッピング
  - Functional Annotation Tool で Gene Ontology の 代わりに Pathways を選択し、 KEGG_PATHWAY の Chart からマッピング（[小野さんの資料](https://github.com/AJACS-training/AJACS58/tree/master/hono)参照）


- DAVID でプローブ ID を KEGG で扱える ID に変換するして、KEGG でマッピング
  - [DAVID](https://david.ncifcrf.gov/home.jsp) で遺伝子リストを読み込み（[小野さんの資料](https://github.com/AJACS-training/AJACS58/tree/master/hono)参照）
  - 上のメニューの Shortcut to DAVID Tools の Gene ID Conversion をクリック
  - Option 1 の変換 ID を ENTERZ_GENE_ID (NCBI GeneID) に変更
  - Submit to Conversion Tool ボタンをクリック
  - 変換リストが表示される
  - 右上の Download File を右クリックして、名前をつけて保存 ("gene_conv.txt")

- タブ切りファイルの第二カラムを抜き出す

Windows のコマンドプロンプト（講習会会場の場合）
```
> cd Downloads
> FOR /F "tokens=2" %i IN (gene_conv.txt) DO @ECHO %i >> gene_id.txt
```

Linux, Mac OS X のターミナル
```
# ファイルのあるディレクトリへ移動
# cut -f2 gene_conv.txt > gene_id.txt
```

できない方は[変換済みファイル](https://github.com/moriya-dbcls/AJACS58/blob/master/moriya/gene_id.txt)  

- [KEGG Mapper](http://www.genome.jp/kegg/tool/map_pathway2.html) でマッピング
  - Arabidopsis thaliana だったので、それに合わせて Search Against を選択
  - NCBi-GeneID に変換したので Primary ID を変更
  - コピペ、もしくはアップロード
  - Exec ボタンをクリック

#### 実習 4 KEGG REST API を使ってデータをダウンロードしてみよう
KEGG では FTP などで一括したデータのダウンロードはできないが、便利な API が容易されている
- http://www.kegg.jp/kegg/rest/keggapi.html

- ヒトの遺伝子一覧
  - http://rest.kegg.jp/list/hsa
- ヒトのパスウェイ一覧
  - http://rest.kegg.jp/list/pathway/hsa
- ヒトの遺伝子一覧とパスウェイの対応
  - http://rest.kegg.jp/link/hsa/pathway
- ヒトの遺伝子 ID 対応表 (KEGG 遺伝子 ID 対 NCBI-GeneID)
  - http://rest.kegg.jp/conv/ncbi-geneid/hsa
  - NCBI-GeneID, NCBI-ProteinID, UniProt 以外は [LinkDB](http://www.genome.jp/linkdb/) で変換
- ヒトのKGML形式のパスウェイのダウンロード(hsa00010)
  - http://rest.kegg.jp/get/hsa00010/kgml

---
