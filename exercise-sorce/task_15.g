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

#modular1とmodular2の直和を返す関数
Make_Direct_Sum := function(modular1,modular2)
    local ret,field;

    field := modular1.field;

    gens1 :=modular1.generators;
    gens2 :=modular2.generators;

    direct_sum_gens := List([1..Length(gens1)], i-> DiagonalMat([gens1[i],gens2[i]]));

    ret := GModuleByMats(direct_sum_gens,field);

    return ret;
end;

group1 := SymmetricGroup(4);
field := GF(3,2);
modular1 :=RegularModule(group1,field)[2];

group2 := GL(2,5);
modular2 := RegularModule(group2,field)[2];

# 1. module1とmodule2の直和にあたるMTX module を, GModuleByMatsで構成せよ.
Print("1. module1とmodule2の直和にあたるMTX module を, GModuleByMatsで構成せよ. \n");

# gens1 := modular1.generators;
# gens2 := modular2.generators;

# direct_sum_gens := List([1..Length(gens1)], i-> DiagonalMat([gens1[i],gens2[i]]));

# direct_sum_module := GModuleByMats(direct_sum_gens,field1);

direct_sum_module := Make_Direct_Sum(modular1,modular2);

Print(direct_sum_module,"\n");