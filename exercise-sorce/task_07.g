# 実行コマンド
# Read("test.g");

group := SymmetricGroup(4);
sub := AlternatingGroup(4);

# Print(IsSubgroup(group,sub),"\n");

# 1. sub は group の正規部分群であることを確かめよ．
Print("1. sub は group の正規部分群であることを確かめよ． \n");

if IsNormal(group,sub) then
    Print("正規部分群である. \n");
else
    Print("正規部分群でない. \n");
fi;