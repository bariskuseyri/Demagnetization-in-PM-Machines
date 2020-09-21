' -------------------------------------------------------------------------------  
' Script Created by RMxprt Version 2016.0 to generate netlist for external circuit 
' Expect 3 args, first the project name,                                           
'                second the design name,                                           
'                third the path to export netlist                                  
' ---------------------------------------------------------------------------------
Dim oAnsoftApp
Dim oDesktop
Dim oProject
Dim oDesign
Dim oEditor
Dim oModule
On Error Resume Next
Set oAnsoftApp = CreateObject("AnsoftMaxCir.MaxCirScript")
On Error Goto 0
Set oArgs = AnsoftScript.arguments
Set oDesktop = oAnsoftApp.GetAppDesktop()
Set oProject = oDesktop.GetActiveProject
if (oArgs.Count > 0) then 
  oProject.InsertDesign "Maxwell Circuit", oArgs(0), "", ""
else
  oProject.InsertDesign "Maxwell Circuit", "", "", ""
end if
Set oDesign = oProject.GetActiveDesign()
Set oEditor = oDesign.SetActiveEditor("SchematicEditor")
oDesign.ChangeProperty Array("NAME:AllTabs", Array("NAME:LocalVariableTab", _
  Array("NAME:PropServers", "LocalVariables"), Array("NAME:NewProps", Array(_
  "NAME:Kle", "PropType:=", "VariableProp", "UserDef:=", true, "Value:=", "1"))))
oEditor.CreateComponent Array("NAME:ComponentProps", "Name:=", "Winding", _
  "Id:=", "14"), Array("NAME:Attributes", "Page:=", 1, "X:=", 0.08128, "Y:=", _
  0.01016, "Degrees:=", 0, "Flip:=", false) 
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:PassedParameterTab", _
  Array("NAME:PropServers", "CompInst@Winding;14;0"), Array(_
  "NAME:ChangedProps", Array("NAME:name", "OverridingDef:=", true, "Value:=", _
  "PhaseA"))))
oEditor.CreateWire Array("NAME:WireData", "Id:=", "1", "Points:=", Array(_
  "(0.08636, 0.01016)", "(0.0889, 0.01016)")), Array("NAME:Attributes", _
  "Page:=", 1) 
oEditor.CreateComponent Array("NAME:ComponentProps", "Name:=", "Winding", _
  "Id:=", "21"), Array("NAME:Attributes", "Page:=", 1, "X:=", 0.08128, "Y:=", _
  0, "Degrees:=", 0, "Flip:=", false) 
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:PassedParameterTab", _
  Array("NAME:PropServers", "CompInst@Winding;21;0"), Array(_
  "NAME:ChangedProps", Array("NAME:name", "OverridingDef:=", true, "Value:=", _
  "PhaseB"))))
oEditor.CreateWire Array("NAME:WireData", "Id:=", "1", "Points:=", Array(_
  "(0.08636, 0)", "(0.0889, 0)")), Array("NAME:Attributes", "Page:=", 1) 
oEditor.CreateComponent Array("NAME:ComponentProps", "Name:=", "Winding", _
  "Id:=", "28"), Array("NAME:Attributes", "Page:=", 1, "X:=", 0.08128, "Y:=", _
  -0.01016, "Degrees:=", 0, "Flip:=", false) 
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:PassedParameterTab", _
  Array("NAME:PropServers", "CompInst@Winding;28;0"), Array(_
  "NAME:ChangedProps", Array("NAME:name", "OverridingDef:=", true, "Value:=", _
  "PhaseC"))))
oEditor.CreateWire Array("NAME:WireData", "Id:=", "1", "Points:=", Array(_
  "(0.08636, -0.01016)", "(0.0889, -0.01016)")), Array("NAME:Attributes", _
  "Page:=", 1) 
oEditor.CreateComponent Array("NAME:ComponentProps", "Name:=", "Res", "Id:=", _
  "35"), Array("NAME:Attributes", "Page:=", 1, "X:=", 0.06858, "Y:=", 0.01016, _
  "Degrees:=", 0, "Flip:=", false) 
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:PassedParameterTab", _
  Array("NAME:PropServers", "CompInst@Res;35;0"), Array("NAME:ChangedProps", _
  Array("NAME:name", "OverridingDef:=", true, "Value:=", "A"))))
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:PassedParameterTab", _
  Array("NAME:PropServers", "CompInst@Res;35;0"), Array("NAME:ChangedProps", _
  Array("NAME:R", "OverridingDef:=", true, "Value:=", "0.65001106ohm"))))
oEditor.CreateWire Array("NAME:WireData", "Id:=", "1", "Points:=", Array(_
  "(0.07366, 0.01016)", "(0.0762, 0.01016)")), Array("NAME:Attributes", _
  "Page:=", 1) 
oEditor.CreateComponent Array("NAME:ComponentProps", "Name:=", "Res", "Id:=", _
  "42"), Array("NAME:Attributes", "Page:=", 1, "X:=", 0.06858, "Y:=", 0, _
  "Degrees:=", 0, "Flip:=", false) 
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:PassedParameterTab", _
  Array("NAME:PropServers", "CompInst@Res;42;0"), Array("NAME:ChangedProps", _
  Array("NAME:name", "OverridingDef:=", true, "Value:=", "B"))))
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:PassedParameterTab", _
  Array("NAME:PropServers", "CompInst@Res;42;0"), Array("NAME:ChangedProps", _
  Array("NAME:R", "OverridingDef:=", true, "Value:=", "0.65001106ohm"))))
oEditor.CreateWire Array("NAME:WireData", "Id:=", "1", "Points:=", Array(_
  "(0.07366, 0)", "(0.0762, 0)")), Array("NAME:Attributes", "Page:=", 1) 
oEditor.CreateComponent Array("NAME:ComponentProps", "Name:=", "Res", "Id:=", _
  "49"), Array("NAME:Attributes", "Page:=", 1, "X:=", 0.06858, "Y:=", _
  -0.01016, "Degrees:=", 0, "Flip:=", false) 
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:PassedParameterTab", _
  Array("NAME:PropServers", "CompInst@Res;49;0"), Array("NAME:ChangedProps", _
  Array("NAME:name", "OverridingDef:=", true, "Value:=", "C"))))
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:PassedParameterTab", _
  Array("NAME:PropServers", "CompInst@Res;49;0"), Array("NAME:ChangedProps", _
  Array("NAME:R", "OverridingDef:=", true, "Value:=", "0.65001106ohm"))))
oEditor.CreateWire Array("NAME:WireData", "Id:=", "1", "Points:=", Array(_
  "(0.07366, -0.01016)", "(0.0762, -0.01016)")), Array("NAME:Attributes", _
  "Page:=", 1) 
oEditor.CreateComponent Array("NAME:ComponentProps", "Name:=", "Ind", "Id:=", _
  "56"), Array("NAME:Attributes", "Page:=", 1, "X:=", 0.05588, "Y:=", 0.01016, _
  "Degrees:=", 0, "Flip:=", false) 
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:PassedParameterTab", _
  Array("NAME:PropServers", "CompInst@Ind;56;0"), Array("NAME:ChangedProps", _
  Array("NAME:name", "OverridingDef:=", true, "Value:=", "A"))))
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:PassedParameterTab", _
  Array("NAME:PropServers", "CompInst@Ind;56;0"), Array("NAME:ChangedProps", _
  Array("NAME:L", "OverridingDef:=", true, "Value:=", "-3.1157849e-05H*Kle"))))
oEditor.CreateWire Array("NAME:WireData", "Id:=", "1", "Points:=", Array(_
  "(0.06096, 0.01016)", "(0.0635, 0.01016)")), Array("NAME:Attributes", _
  "Page:=", 1) 
oEditor.CreateComponent Array("NAME:ComponentProps", "Name:=", "Ind", "Id:=", _
  "63"), Array("NAME:Attributes", "Page:=", 1, "X:=", 0.05588, "Y:=", 0, _
  "Degrees:=", 0, "Flip:=", false) 
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:PassedParameterTab", _
  Array("NAME:PropServers", "CompInst@Ind;63;0"), Array("NAME:ChangedProps", _
  Array("NAME:name", "OverridingDef:=", true, "Value:=", "B"))))
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:PassedParameterTab", _
  Array("NAME:PropServers", "CompInst@Ind;63;0"), Array("NAME:ChangedProps", _
  Array("NAME:L", "OverridingDef:=", true, "Value:=", "-3.1157849e-05H*Kle"))))
oEditor.CreateWire Array("NAME:WireData", "Id:=", "1", "Points:=", Array(_
  "(0.06096, 0)", "(0.0635, 0)")), Array("NAME:Attributes", "Page:=", 1) 
oEditor.CreateComponent Array("NAME:ComponentProps", "Name:=", "Ind", "Id:=", _
  "70"), Array("NAME:Attributes", "Page:=", 1, "X:=", 0.05588, "Y:=", _
  -0.01016, "Degrees:=", 0, "Flip:=", false) 
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:PassedParameterTab", _
  Array("NAME:PropServers", "CompInst@Ind;70;0"), Array("NAME:ChangedProps", _
  Array("NAME:name", "OverridingDef:=", true, "Value:=", "C"))))
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:PassedParameterTab", _
  Array("NAME:PropServers", "CompInst@Ind;70;0"), Array("NAME:ChangedProps", _
  Array("NAME:L", "OverridingDef:=", true, "Value:=", "-3.1157849e-05H*Kle"))))
oEditor.CreateWire Array("NAME:WireData", "Id:=", "1", "Points:=", Array(_
  "(0.06096, -0.01016)", "(0.0635, -0.01016)")), Array("NAME:Attributes", _
  "Page:=", 1) 
oEditor.CreateComponent Array("NAME:ComponentProps", "Name:=", "Ammeter", _
  "Id:=", "77"), Array("NAME:Attributes", "Page:=", 1, "X:=", 0.04318, "Y:=", _
  0.01016, "Degrees:=", 90, "Flip:=", false) 
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:PassedParameterTab", _
  Array("NAME:PropServers", "CompInst@Ammeter;77;0"), Array(_
  "NAME:ChangedProps", Array("NAME:name", "OverridingDef:=", true, "Value:=", _
  "IA"))))
oEditor.CreateWire Array("NAME:WireData", "Id:=", "1", "Points:=", Array(_
  "(0.04826, 0.01016)", "(0.0508, 0.01016)")), Array("NAME:Attributes", _
  "Page:=", 1) 
oEditor.CreateComponent Array("NAME:ComponentProps", "Name:=", "Ammeter", _
  "Id:=", "84"), Array("NAME:Attributes", "Page:=", 1, "X:=", 0.04318, "Y:=", _
  0, "Degrees:=", 90, "Flip:=", false) 
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:PassedParameterTab", _
  Array("NAME:PropServers", "CompInst@Ammeter;84;0"), Array(_
  "NAME:ChangedProps", Array("NAME:name", "OverridingDef:=", true, "Value:=", _
  "IB"))))
oEditor.CreateWire Array("NAME:WireData", "Id:=", "1", "Points:=", Array(_
  "(0.04826, 0)", "(0.0508, 0)")), Array("NAME:Attributes", "Page:=", 1) 
oEditor.CreateComponent Array("NAME:ComponentProps", "Name:=", "Ammeter", _
  "Id:=", "91"), Array("NAME:Attributes", "Page:=", 1, "X:=", 0.04318, "Y:=", _
  -0.01016, "Degrees:=", 90, "Flip:=", false) 
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:PassedParameterTab", _
  Array("NAME:PropServers", "CompInst@Ammeter;91;0"), Array(_
  "NAME:ChangedProps", Array("NAME:name", "OverridingDef:=", true, "Value:=", _
  "IC"))))
oEditor.CreateWire Array("NAME:WireData", "Id:=", "1", "Points:=", Array(_
  "(0.04826, -0.01016)", "(0.0508, -0.01016)")), Array("NAME:Attributes", _
  "Page:=", 1) 
oEditor.CreateWire Array("NAME:WireData", "Id:=", "1", "Points:=", Array(_
  "(0.0889, 0.01016)", "(0.0889, 0)")), Array("NAME:Attributes", "Page:=", 1) 
oEditor.CreateWire Array("NAME:WireData", "Id:=", "1", "Points:=", Array(_
  "(0.0889, 0)", "(0.0889, -0.01016)")), Array("NAME:Attributes", "Page:=", 1) 
oEditor.CreateWire Array("NAME:WireData", "Id:=", "1", "Points:=", Array(_
  "(0, -0.0381)", "(0, -0.03556)")), Array("NAME:Attributes", "Page:=", 1) 
oEditor.CreateComponent Array("NAME:ComponentProps", "Name:=", "VSin", "Id:=", _
  "98"), Array("NAME:Attributes", "Page:=", 1, "X:=", 0, "Y:=", -0.03048, _
  "Degrees:=", 0, "Flip:=", false) 
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:PassedParameterTab", _
  Array("NAME:PropServers", "CompInst@VSin;98;0"), Array("NAME:ChangedProps", _
  Array("NAME:Va", "OverridingDef:=", true, "Value:=", "179.62925V"))))
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:PassedParameterTab", _
  Array("NAME:PropServers", "CompInst@VSin;98;0"), Array("NAME:ChangedProps", _
  Array("NAME:VFreq", "OverridingDef:=", true, "Value:=", "300"))))
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:PassedParameterTab", _
  Array("NAME:PropServers", "CompInst@VSin;98;0"), Array("NAME:ChangedProps", _
  Array("NAME:Phase", "OverridingDef:=", true, "Value:=", "329.13116deg"))))
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:PassedParameterTab", _
  Array("NAME:PropServers", "CompInst@VSin;98;0"), Array("NAME:ChangedProps", _
  Array("NAME:AF", "OverridingDef:=", true, "Value:=", "1"))))
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:PassedParameterTab", _
  Array("NAME:PropServers", "CompInst@VSin;98;0"), Array("NAME:ChangedProps", _
  Array("NAME:name", "OverridingDef:=", true, "Value:=", "A"))))
oEditor.CreateWire Array("NAME:WireData", "Id:=", "1", "Points:=", Array(_
  "(0, -0.0254)", "(0, 0.01016)", "(0.0381, 0.01016)")), Array(_
  "NAME:Attributes", "Page:=", 1) 
oEditor.CreateComponent Array("NAME:ComponentProps", "Name:=", "VoltmeterG", _
  "Id:=", "105"), Array("NAME:Attributes", "Page:=", 1, "X:=", 0, "Y:=", _
  0.01524, "Degrees:=", 0, "Flip:=", false) 
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:PassedParameterTab", _
  Array("NAME:PropServers", "CompInst@VoltmeterG;105;0"), Array(_
  "NAME:ChangedProps", Array("NAME:name", "OverridingDef:=", true, "Value:=", _
  "Va"))))
oEditor.CreateWire Array("NAME:WireData", "Id:=", "1", "Points:=", Array(_
  "(0.0127, -0.0381)", "(0.0127, -0.03556)")), Array("NAME:Attributes", _
  "Page:=", 1) 
oEditor.CreateComponent Array("NAME:ComponentProps", "Name:=", "VSin", "Id:=", _
  "112"), Array("NAME:Attributes", "Page:=", 1, "X:=", 0.0127, "Y:=", _
  -0.03048, "Degrees:=", 0, "Flip:=", false) 
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:PassedParameterTab", _
  Array("NAME:PropServers", "CompInst@VSin;112;0"), Array("NAME:ChangedProps", _
  Array("NAME:Va", "OverridingDef:=", true, "Value:=", "179.62925V"))))
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:PassedParameterTab", _
  Array("NAME:PropServers", "CompInst@VSin;112;0"), Array("NAME:ChangedProps", _
  Array("NAME:VFreq", "OverridingDef:=", true, "Value:=", "300"))))
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:PassedParameterTab", _
  Array("NAME:PropServers", "CompInst@VSin;112;0"), Array("NAME:ChangedProps", _
  Array("NAME:Phase", "OverridingDef:=", true, "Value:=", "89.131161deg"))))
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:PassedParameterTab", _
  Array("NAME:PropServers", "CompInst@VSin;112;0"), Array("NAME:ChangedProps", _
  Array("NAME:AF", "OverridingDef:=", true, "Value:=", "1"))))
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:PassedParameterTab", _
  Array("NAME:PropServers", "CompInst@VSin;112;0"), Array("NAME:ChangedProps", _
  Array("NAME:name", "OverridingDef:=", true, "Value:=", "B"))))
oEditor.CreateWire Array("NAME:WireData", "Id:=", "1", "Points:=", Array(_
  "(0.0127, -0.0254)", "(0.0127, 0)", "(0.0381, 0)")), Array(_
  "NAME:Attributes", "Page:=", 1) 
oEditor.CreateComponent Array("NAME:ComponentProps", "Name:=", "VoltmeterG", _
  "Id:=", "119"), Array("NAME:Attributes", "Page:=", 1, "X:=", 0.0127, "Y:=", _
  0.00508, "Degrees:=", 0, "Flip:=", false) 
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:PassedParameterTab", _
  Array("NAME:PropServers", "CompInst@VoltmeterG;119;0"), Array(_
  "NAME:ChangedProps", Array("NAME:name", "OverridingDef:=", true, "Value:=", _
  "Vb"))))
oEditor.CreateWire Array("NAME:WireData", "Id:=", "1", "Points:=", Array(_
  "(0.0254, -0.0381)", "(0.0254, -0.03556)")), Array("NAME:Attributes", _
  "Page:=", 1) 
oEditor.CreateComponent Array("NAME:ComponentProps", "Name:=", "VSin", "Id:=", _
  "126"), Array("NAME:Attributes", "Page:=", 1, "X:=", 0.0254, "Y:=", _
  -0.03048, "Degrees:=", 0, "Flip:=", false) 
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:PassedParameterTab", _
  Array("NAME:PropServers", "CompInst@VSin;126;0"), Array("NAME:ChangedProps", _
  Array("NAME:Va", "OverridingDef:=", true, "Value:=", "179.62925V"))))
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:PassedParameterTab", _
  Array("NAME:PropServers", "CompInst@VSin;126;0"), Array("NAME:ChangedProps", _
  Array("NAME:VFreq", "OverridingDef:=", true, "Value:=", "300"))))
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:PassedParameterTab", _
  Array("NAME:PropServers", "CompInst@VSin;126;0"), Array("NAME:ChangedProps", _
  Array("NAME:Phase", "OverridingDef:=", true, "Value:=", "209.13116deg"))))
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:PassedParameterTab", _
  Array("NAME:PropServers", "CompInst@VSin;126;0"), Array("NAME:ChangedProps", _
  Array("NAME:AF", "OverridingDef:=", true, "Value:=", "1"))))
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:PassedParameterTab", _
  Array("NAME:PropServers", "CompInst@VSin;126;0"), Array("NAME:ChangedProps", _
  Array("NAME:name", "OverridingDef:=", true, "Value:=", "C"))))
oEditor.CreateWire Array("NAME:WireData", "Id:=", "1", "Points:=", Array(_
  "(0.0254, -0.0254)", "(0.0254, -0.01016)", "(0.0381, -0.01016)")), Array(_
  "NAME:Attributes", "Page:=", 1) 
oEditor.CreateComponent Array("NAME:ComponentProps", "Name:=", "VoltmeterG", _
  "Id:=", "133"), Array("NAME:Attributes", "Page:=", 1, "X:=", 0.0254, "Y:=", _
  -0.00508, "Degrees:=", 0, "Flip:=", false) 
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:PassedParameterTab", _
  Array("NAME:PropServers", "CompInst@VoltmeterG;133;0"), Array(_
  "NAME:ChangedProps", Array("NAME:name", "OverridingDef:=", true, "Value:=", _
  "Vc"))))
oEditor.CreateWire Array("NAME:WireData", "Id:=", "1", "Points:=", Array(_
  "(0, -0.0381)", "(0.0254, -0.0381)")), Array("NAME:Attributes", "Page:=", 1) 
oEditor.CreateGround Array("NAME:GroundProps", "Id:=", "7"), Array(_
  "NAME:Attributes", "Page:=", 1, "X:=", 0.0127, "Y:=", -0.04064, "Degrees:=", _
  0, "Flip:=", false) 
if (oArgs.Count > 0) then 
  oProject.SetActiveDesign oArgs(0)
end if
oEditor.ZoomToFit
if (oArgs.Count > 1) then 
  oDesign.ExportNetList "", oArgs(1)
end if
