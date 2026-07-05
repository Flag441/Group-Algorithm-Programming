# 実行コマンド
# Read("test.g");

group := SymmetricGroup(4);
field := GF(3,2);
regular := RegularModule(group,field)[2];

# 1. regular の次元が group の位数と等しいことを確認せよ．
Print("1. regular の次元が group の位数と等しいことを確認せよ．\n");

regular_dimension := MTX.Dimension(regular);
Group_Order := Order(group);

if regular_dimension = Group_Order then
    Print("regular の次元は group の位数と等しい. \n");
else
    Print("regular の次元は group の位数と等しくない. \n");
fi;

# 2. regular の radical を MTX で求めよ．
Print("2. regular の radical を MTX で求めよ．\n");

radical := MTX.BasisRadical(regular);

Display(radical);

# 横がgroupの元に対応していて係数が並んでいる.

# 3. regular の双対加群 dual を MTX で求めよ．
Print("3. regular の双対加群 dual を MTX で求めよ．\n");

gens := regular.generators;

dual_gens := List(gens,M -> TransposedMat(M^(-1)));

dual := GModuleByMats(dual_gens,regular.field);

Print(dual,"\n");

# 4. dual と regular は，右 kG-加群 として同型であることを確認せよ.
Print("4. dual と regular は，右 kG-加群 として同型であることを確認せよ. \n");

isom := MTX.IsomorphismModules(regular,dual);

if isom = false then
    Print("同型ではない. \n");
else
    Print("同型である. \n");
fi;
