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
# -------------------------------

# 実行コマンド
# Read("test.g");

group := SymmetricGroup(4);
field := GF(3,2);
simples := IrreducibleModules(group,field)[2];

p := Characteristic(field);

ConjuList := ConjugacyClasses(group);

con := 0;
cnt := 0;
for con in ConjuList do
    if Gcd(Order(Representative(con)),p)=1 then
        cnt := cnt+1;
    fi;
od;

# 1. groupの共役類のうち位数がpと素な元を含むものの個数は, リストsimplesの長さと一致することを確認せよ.
Print("1. groupの共役類のうち位数がpと素な元を含むものの個数は, リストsimplesの長さと一致することを確認せよ. \n");

if cnt = Length(simples) then
    Print("同じです.\n");
else
    Print("違います. \n");
fi;