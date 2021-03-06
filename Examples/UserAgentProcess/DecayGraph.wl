DaughterNuclides[s_List] := DeleteCases[Union[Apply[Join, Map[IsotopeData[#, "DaughterNuclides"] &, DeleteCases[s, _Missing]]]], _Missing];

ReachableNuclides[s_List] := FixedPoint[Union[Join[#, DaughterNuclides[#]]] &, s];

DaughterNuclidesQ[s1_, s2_] := (s1 =!= s2 && MemberQ[DaughterNuclides[{s1}], s2]);

verts = ReachableNuclides[{Entity["Isotope", "@@EXPR@@"]}];

rotateLabel[lbl_] := Rotate[lbl, 15 Degree];

Export[ "@@SAVELOC@@" , RelationGraph[DaughterNuclidesQ, verts, Sequence[PlotRangePadding -> 1, PlotTheme -> "Scientific", VertexLabels -> Placed["Name", Above, rotateLabel]]]]