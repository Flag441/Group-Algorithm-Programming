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
# SylowSubgroup
# Embedding
# GeneratorsOfGroup
# GroupHomomorphismByImages
# Homomorphisms
# -------------------------------

# 実行コマンド
# Read("test.g");

G := SymmetricGroup(4);
field := GF(3,2);

# irreds := IrreducibleModules(G,field);
irreds := IrreducibleRepresentations(G, field);

gens_G := GeneratorsOfGroup(G);

mats1 := List(gens_G, g -> Image(irreds[1],g));
mats2 := List(gens_G, g -> Image(irreds[2],g));

M1 := GModuleByMats(mats1,field);
M2 := GModuleByMats(mats2,field);

hom_space := MTX.Homomorphisms(M1,M2);

i := 0;

# 1. HomkG(module1, module2) の基底を求めよ.
Print("1. HomkG(module1, module2) の基底を求めよ. \n");

if Length(hom_space)=0 then
    Print(0,"\n");
else
    for i in [1..Length(hom_space)] do
        Print(i,"\n");
    od;
fi;

# 2. module1, module2 が共に単純加群のとき，hom 空間の次元を調べることで，同型か判定せよ.
Print("2. module1, module2 が共に単純加群のとき, hom 空間の次元を調べることで，同型か判定せよ. \n");

if Length(hom_space)>0 then
    Print("同型である. \n");
else
    Print("同型でない. \n");
fi;

# 3. module1 の極大部分加群を一つ求めよ.
Print("# 3. module1 の極大部分加群を一つ求めよ. \n");

max_bases_list := MTX.BasesMaximalSubmodules(M1);

if Length(max_bases_list)>0 then
    max_bases := max_bases_list[1];
    
    if Length(max_bases)=0 then
        Print("M1は単純である\n");
    else
        max_submodule := MTX.InducedActionSubmodule(M1,max_bases);
        Print(max_submodule,"\n");
    fi;
else
    Print("error");
fi;