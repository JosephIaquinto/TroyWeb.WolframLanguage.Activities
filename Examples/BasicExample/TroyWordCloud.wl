syn="Troy, New York";
synlinks=WikipediaData[syn,"LinksRules","MaxLevelItems"->1000,"MaxLevel"->1];
WordCloud[DeleteStopwords[ToLowerCase[StringRiffle[synlinks]]], ScalingFunctions->(#^.01&),WordOrientation->{{-Pi/4,Pi/4}},AspectRatio->1/2]