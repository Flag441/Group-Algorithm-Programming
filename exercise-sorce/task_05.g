# 実行コマンド
# Read("test.g");

group := SymmetricGroup(3);

# 1.groupの元を列挙せよ.
Print("1.groupの元を列挙せよ. \n");

i:=0;
for i in group do
    Print(i,"\n");
od;

# 2.groupの単位元を表示せよ.
Print("2.groupの単位元を表示せよ. \n");

Print(One(group),"\n");

# 3.groupの共役類の個数を表示せよ.
Print("3.groupの共役類の個数を表示せよ. \n");

Print(NrConjugacyClasses(group),"\n");