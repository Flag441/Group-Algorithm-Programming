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
# -------------------------------

# 実行コマンド
# Read("test.g");

G := SymmetricGroup(4);
H := SylowSubgroup(G,2);
k := GF(3,2);
n := 3;
regular := RegularModule(G,k)[2];

# 1. GLn(k) を構成せよ.
Print("1. GLn(k) を構成せよ. \n");

Mat := GL(n,k);

Print(Mat,"\n");

# 2. 包含による群準同型 H → G を構成せよ.
Print("2. 包含による群準同型 H → G を構成せよ. \n");

gens_H := GeneratorsOfGroup(H);

inc := GroupHomomorphismByImages(H,G,gens_H,gens_H);
for h in H do
    Print(String(h), "|-> ",String(Image(inc,h)),"\n");
od;

# 3. M の G から H への制限表現を求めよ．
Print("3. M の G から H への制限表現を求めよ．\n");

gens_G := GeneratorsOfGroup(G);
mats_G := regular.generators;

# Gの元がどの行列に対応しているのかをrepでもつ
rep := GroupHomomorphismByImages(G,Group(mats_G),gens_G,mats_G);

# Hの元がどの行列と対応しているかをリストに詰めておく
mats_H := List(gens_H, h -> Image(rep,h));

restricted_regular := GModuleByMats(mats_H,k);

Print(restricted_regular,"\n");