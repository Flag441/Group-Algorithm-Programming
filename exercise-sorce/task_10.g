# 実行コマンド
# Read("test.g");

group := SymmetricGroup(4);
field :=GF(3,2);

mat:=
[
    [1,0],
    [0,1]
] * One(field);

gens := [mat];

module := GModuleByMats(gens,field);
Print(module,"\n");

# 1. mat を [[1,0],[0,1]] に置き換えて実行せよ．

# *One(field)ありのときの出力
#rec(
#  IsOverFiniteField := true,  ->ベースが有限体
#  dimension := 2,  -> F^2だから二次元
#  field := GF(3^2), 
#  generators := [ [ [ Z(3)^0, 0*Z(3) ], [ 0*Z(3), Z(3)^0 ] ] ], ->生成元は単位元
#  isMTXModule := true )

# なしのときの出力
#Error, matrices and field do not fit together
#*[1] Error( "matrices and field do not fit together" );
#   @ /opt/gap-4.16.0/lib/meataxe.gi:23
#<function "GModuleByMats">( <arguments> )
# called from read-eval loop at test.g:17
#you can 'quit;' to quit to outer loop, or
#you can 'return;' to continue


# [[1,0],[0,1]] * One(field) との違いを説明せよ．
Print("[[1,0],[0,1]] * One(field) との違いを説明せよ. \n");
Print("ありのときはGL(3,2)の元として考えられるが、なしのときは単に整数成分の行列とみなされるためMTXで無限群を扱うことはできないのでエラーが出る. \n");
