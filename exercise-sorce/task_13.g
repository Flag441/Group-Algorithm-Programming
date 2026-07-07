# --- MTX Commands Dictionary ---
# MTX.Dimension
# MTX.BasisRadical
# MTX.BasisSocle
# MTX.InducedActionSubmodule
# MTX.InducedActionFactorModule
# GModuleByMats
# -------------------------------

# 実行コマンド
# Read("test.g");

group := SymmetricGroup(4);
field := GF(3,2);
modular := RegularModule(group,field)[2];

# 1. 群 groupと有限体 field を与えた時、groupの左正則表現を求めよ.
Print("1. 群 groupと有限体 field を与えた時、groupの左正則表現を求めよ. \n");

gens := modular.generators;

left_gens := List(gens, m -> m^-1);

left_modular := GModuleByMats(left_gens,modular.field);

Print(left_modular,"\n");