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
field := GF(3,2);
regular := RegularModule(group,field)[2];
socle := MTX.InducedActionSubmodule(regular,MTX.BasisSocle(regular));

# 1. 加群 socle が半単純であることを確認せよ.
Print("1. 加群 socle が半単純であることを確認せよ. \n");

IsSemisimple := function(modular)
    local rad_basis;
    rad_basis := MTX.BasisRadical(modular);

    return Length(rad_basis)=0;
end;

if IsSemisimple(socle) then
    Print("半単純です. \n");
else
    Print("半単純ではありません. \n");
fi;