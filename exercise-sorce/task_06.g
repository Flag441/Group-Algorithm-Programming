# 実行コマンド
# Read("test.g");

cyc := CyclicGroup(8);
i:=0;

# 1. 生成元を表示せよ.
Print("1. 生成元を表示せよ. \n");

gens := MinimalGeneratingSet(cyc);

Print(gens,"\n");

# 2. 元の位数を表示せよ．
Print("2. 元の位数を表示せよ． \n");

for i in cyc do
    Print(i,"位数",Order(i),"\n");
od;

# 3. 部分群を列挙せよ．
Print("3. 部分群を列挙せよ． \n");
subs := AllSubgroups(cyc);

H:=0;

for H in subs do
    Print(H,"\n");
od;
