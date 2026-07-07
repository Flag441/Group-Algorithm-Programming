# --- MTX Commands Dictionary ---
# MTX.Dimension
# MTX.BasisRadical
# MTX.BasisSocle
# MTX.InducedActionSubmodule
# MTX.InducedActionFactorModule
# GModuleByMats
# Print
# Display
# IrreducibleModules
# ConjugacyClasses
# Gcd
# Length
# Representative
# SymmetricGroup
# RegularModule
# DiagonalMat
# -------------------------------

# 実行コマンド
# Read("test.g");

group1 := SymmetricGroup(4);
field1 := GF(3,2);
modular1 :=RegularModule(group1,field1);

group2 := GL(2,5);
field2 := GF(7,7);
modular2 := modular1;

# 1. module1とmodule2の直和にあたるMTX module を, GModuleByMatsで構成せよ.
Print("1. module1とmodule2の直和にあたるMTX module を, GModuleByMatsで構成せよ. \n");

gens1 := modular1.generators;
gens2 := modular2.generators;

direct_sum_gens := List([1..Length(gens1)], i-> DiagonalMat(gens1[i],gens2[i]));

direct_sum_module := GModuleByMats(direct_sum_gens,module1.field);

Print(direct_sum_module,"\n");