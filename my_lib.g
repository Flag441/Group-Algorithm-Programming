# ライブラリ用のファイル

# radical列の長さを求める関数
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

# socle列の長さを求める関数
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

# modular1とmodular2の直和を返す関数
Make_Direct_Sum := function(modular1,modular2)
    local ret,field;

    field := modular1.field;

    gens1 :=modular1.generators;
    gens2 :=modular2.generators;

    direct_sum_gens := List([1..Length(gens1)], i-> DiagonalMat([gens1[i],gens2[i]]));

    ret := GModuleByMats(direct_sum_gens,field);

    return ret;
end;

# modularが半単純かどうか判定する関数
IsSemisimple := function(modular)
    local rad_basis;
    rad_basis := MTX.BasisRadical(modular);

    return Length(rad_basis)=0;
end;