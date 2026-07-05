# 実行コマンド
# Read("test.g");
LoadPackage("alco");

mat :=
[
    [1,2],
    [3,4]
];

# 1. 行列式を表示せよ．
Print("1. 行列式を表示せよ．\n");

Print(Determinant(mat),"\n");

# 2. 逆行列を表示せよ.
Print("2. 逆行列を表示せよ.\n");
rmat := Inverse(mat);
Display(rmat);

# 3. Rank を表示せよ．
Print("3. Rank を表示せよ．\n");
Print(Rank(mat),"\n");