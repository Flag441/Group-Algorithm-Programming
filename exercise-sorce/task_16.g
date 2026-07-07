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
# Indecomposition
# MTX.IsIrreducible
# -------------------------------

# 実行コマンド
# Read("test.g");

group := SymmetricGroup(4);
field :=GF(3,2);
regular := RegularModule(group,field)[2];

dec := List(MTX.Indecomposition(regular),x->x[2]);
m := 0;

# 1. 各加群 m ∈ dec に対して，m/rad(m) は単純加群である事を確認せよ．
Print("1. 各加群 m ∈ dec に対して, m/rad(m) は単純加群である事を確認せよ．\n");

for m in dec do
    rad_m := MTX.BasisRadical(m);
    quotient := MTX.InducedActionFactorModule(m,rad_m);

    if MTX.IsIrreducible(quotient) then
        Print("単純です. \n");
    else
        Print("単純ではないです. \n");
    fi;
od;