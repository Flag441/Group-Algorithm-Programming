# --- MTX Commands Dictionary ---
# MTX.Dimension
# MTX.BasisRadical
# MTX.BasisSocle
# MTX.InducedActionSubmodule
# MTX.InducedActionFactorModule
# -------------------------------

# 実行コマンド
# Read("test.g");

group := SymmetricGroup(4);
field := GF(3,2);
module := RegularModule(group,field)[2];

#radical列の長さを求める関数
Radicallength := function(module)
    local current_mod,rad_basis,ret;

    current_mod := module;
    ret := 0;

    #次元が0になるまで繰り返す.
    while MTX.Dimension(current_mod)>0 do

        #radをとる.
        rad_basis := MTX.BasisRadical(current_mod);
        ret := ret+1;

        #次元が0になっていればそこで終わり
        if Length(rad_basis)=0 then
            break;
        fi;

        #current_modをradとったものに置き換える.
        current_mod := MTX.InducedActionSubmodule(current_mod,rad_basis);
    od;

    return ret;
end;

Soclelength :=function(module)
    local current_mod,soc_basis,ret;

    current_mod := module;
    ret := 0;

    while MTX.Dimension(current_mod)>0 do

        soc_basis := MTX.BasisSocle(current_mod);

        ret:=ret+1;

        if Length(soc_basis)=MTX.Dimension(current_mod) then
            break;
        fi;

        current_mod := MTX.InducedActionFactorModule(current_mod,soc_basis);
    od;

    return ret;
end;


# 1. moduleのradical列の長さを求めよ.
Print("1. moduleのradical列の長さを求めよ. \n");
Print(Radicallength(module),"\n");

Rad_length := Radicallength(module);
Soc_length := Soclelength(module);

# 2. moduleのradical列の長さが、socle列のながさと一致することを確認せよ.
Print("2. moduleのradical列の長さが、socle列の長さと一致することを確認せよ. \n");
if Rad_length = Soc_length then
    Print("長さは等しい. \n");
else
    Print("長さは等しくない \n");
fi;
