
uses
  Diff_NP,
  DiffTypes,
  SysUtils;

var
  FDiff_NP: TNPDiff;
  s1, s2: string;
{
  alist1, alist2: TIntegerList;
}
  LCompareRec: TCompareRec;
  index: integer;
  
  LDiffStats: TDiffStats;
  
begin
  s1 := EmptyStr;
  s2 := EmptyStr;
  
{
  alist1 := nil;
  alist2 := nil;
}
  
  FDiff_NP := TNPDiff.Create(nil);
  
  s1 := 'aa';
  s2 := 'ab';
  
  FDiff_NP.Execute(s1, s2);
{
  FDiff_NP.Execute(alist1, alist2);
}
  
  WriteLn('FDiff_NP.CompareList.count ', FDiff_NP.CompareList.count);
  
  for index := 0 to Pred(FDiff_NP.CompareList.count) do
  begin
    LCompareRec := PCompareRec(FDiff_NP.CompareList[index])^;
    
    with LCompareRec do
    begin
      if Kind = ckAdd then Write('ADD ') else
      if Kind = ckDelete then Write('DEL ') else
      if Kind = ckModify then Write('MOD ') else
        Write('... ');
      WriteLn(chr1, ' ', chr2);
    end;
  end;
  
  LDiffStats := FDiff_NP.DiffStats;
  
  with LDiffStats do
  begin
    WriteLn('  Matches : ', matches);
    WriteLn('  Modifies: ', modifies);
    WriteLn('  Adds    : ', adds);
    WriteLn('  Deletes : ', deletes);
  end;
end.
