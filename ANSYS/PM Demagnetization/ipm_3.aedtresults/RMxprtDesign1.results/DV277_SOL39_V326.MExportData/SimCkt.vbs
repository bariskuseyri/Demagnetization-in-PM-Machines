' -----------------------------------------------------------------------------  
' Script Created by RMxprt Version 2016.0 to generate Simplorer Circuit design   
' Expect 2 args, first the project name,                                         
'                second the design name                                          
' -------------------------------------------------------------------------------
Dim oAnsoftApp
Dim oDesktop
Dim oProject
Dim oDesign
Dim oEditor
Dim oModule
Dim oSml1, oSml2, oModName
oModName = "Setup1"

On Error Resume Next
Set oAnsoftApp = CreateObject("AnsoftSimplorer.SimplorerScript")
On Error Goto 0
' -----------------------------------------------------------------------------  
' Determine the path of this vbs and resolve path to other referenced files      
' -----------------------------------------------------------------------------  
Dim vbspath, dir, path, fileName, filesys, pathArray, count
vbspath = AnsoftScript.GetScriptPath
Set filesys = CreateObject("Scripting.FileSystemObject")
dir = filesys.GetParentFolderName(vbspath)
fileName = filesys.GetFileName(vbspath)
fileName = filesys.GetBaseName(fileName)
pathArray = Split(fileName, "_")
' Form the path
count = UBound(pathArray) - 1
if (count > 0) Then
For i = 0 to count
path = path + pathArray(i)
if (i < count) Then
path = path + "_"
End If
Next
oSml1 = dir + "/" + path + ".sml"
oSml2 = dir + "/" + path + "_signals.sml"
Else ' no _ in file name
oSml1 = dir + "/" + oModName + ".sml"
oSml2 = dir + "/" + "signals.sml"
End if

Set oArgs = AnsoftScript.arguments
Set oDesktop = oAnsoftApp.GetAppDesktop()
Set oProject = oDesktop.GetActiveProject()
if (oArgs.Count > 1) then 
  oProject.InsertDesign "Twin Builder", oArgs(1), "", ""
else
  oProject.InsertDesign "Twin Builder", "", "", ""
end if
Set oDesign = oProject.GetActiveDesign()
Set oEditor = oDesign.SetActiveEditor("SchematicEditor")
Set oDefinitionManager = oProject.GetDefinitionManager()
Set oComponentManager = oDefinitionManager.GetManager("Component")
oComponentManager.ImportModelsFromFile oSml1, Array("NAME:Options", "Mode:=", _
  1)
oComponentManager.ImportModelsFromFile oSml2, Array("NAME:Options", "Mode:=", _
  1)
oEditor.CreateComponent Array("NAME:ComponentProps", "Name:=", "Setup1", _
  "Id:=", "189"), Array("NAME:Attributes", "Page:=", 1, "X:=", 0.05334, "Y:=", _
  -0.03048, "Degrees:=", 0, "Flip:=", false) 
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:PassedParameterTab", _
  Array("NAME:PropServers", "CompInst@Setup1;189;0"), Array(_
  "NAME:ChangedProps", Array("NAME:InstanceName", "OverridingDef:=", true, _
  "Value:=", "BLDC"))))
ppID = oEditor.CreatePagePort( Array("NAME:PagePortProps", "Name:=", "A", _
  "Id:=", 196), Array("NAME:Attributes", "Page:=", 1, "X:=", 0.04572, "Y:=", _
  -0.02794, "Degrees:=", 0, "Flip:=", false) )
oEditor.Move Array("NAME:Selections", "Selections:=", Array(ppID)), Array(_
  "NAME:MoveParameters", "xdelta:=", -0.00254, "ydelta:=", 0, "Disconnect:=", _
  false, "Rubberband:=", false)
ppID = oEditor.CreatePagePort( Array("NAME:PagePortProps", "Name:=", "B", _
  "Id:=", 203), Array("NAME:Attributes", "Page:=", 1, "X:=", 0.04572, "Y:=", _
  -0.03048, "Degrees:=", 0, "Flip:=", false) )
oEditor.Move Array("NAME:Selections", "Selections:=", Array(ppID)), Array(_
  "NAME:MoveParameters", "xdelta:=", -0.00254, "ydelta:=", 0, "Disconnect:=", _
  false, "Rubberband:=", false)
ppID = oEditor.CreatePagePort( Array("NAME:PagePortProps", "Name:=", "C", _
  "Id:=", 210), Array("NAME:Attributes", "Page:=", 1, "X:=", 0.04572, "Y:=", _
  -0.03302, "Degrees:=", 0, "Flip:=", false) )
oEditor.Move Array("NAME:Selections", "Selections:=", Array(ppID)), Array(_
  "NAME:MoveParameters", "xdelta:=", -0.00254, "ydelta:=", 0, "Disconnect:=", _
  false, "Rubberband:=", false)
ppID = oEditor.CreatePagePort( Array("NAME:PagePortProps", "Name:=", "N", _
  "Id:=", 217), Array("NAME:Attributes", "Page:=", 1, "X:=", 0.06096, "Y:=", _
  -0.02794, "Degrees:=", 180, "Flip:=", false) )
oEditor.Move Array("NAME:Selections", "Selections:=", Array(ppID)), Array(_
  "NAME:MoveParameters", "xdelta:=", 0.00254, "ydelta:=", 0, "Disconnect:=", _
  false, "Rubberband:=", false)
ppID = oEditor.CreatePagePort( Array("NAME:PagePortProps", "Name:=", "ROT1", _
  "Id:=", 224), Array("NAME:Attributes", "Page:=", 1, "X:=", 0.06096, "Y:=", _
  -0.03048, "Degrees:=", 180, "Flip:=", false) )
oEditor.Move Array("NAME:Selections", "Selections:=", Array(ppID)), Array(_
  "NAME:MoveParameters", "xdelta:=", 0.00254, "ydelta:=", 0, "Disconnect:=", _
  false, "Rubberband:=", false)
ppID = oEditor.CreatePagePort( Array("NAME:PagePortProps", "Name:=", "ROT2", _
  "Id:=", 231), Array("NAME:Attributes", "Page:=", 1, "X:=", 0.06096, "Y:=", _
  -0.03302, "Degrees:=", 180, "Flip:=", false) )
oEditor.Move Array("NAME:Selections", "Selections:=", Array(ppID)), Array(_
  "NAME:MoveParameters", "xdelta:=", 0.00254, "ydelta:=", 0, "Disconnect:=", _
  false, "Rubberband:=", false)
oEditor.CreateComponent Array("NAME:ComponentProps", "Name:=", _
  "Simplorer Elements/Basic Elements/Physical Domains/Mechanical/Velocity-Force-Representation/Rotational_V:V_ROT", _
  "Id:=", "238"), Array("NAME:Attributes", "Page:=", 1, "X:=", 0.09144, "Y:=", _
  -0.0254, "Degrees:=", 180, "Flip:=", false) 
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:PassedParameterTab", _
  Array("NAME:PropServers", "CompInst@V_ROT;238;0"), Array(_
  "NAME:ChangedProps", Array("NAME:InstanceName", "OverridingDef:=", true, _
  "Value:=", "speed"))))
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:Quantities", Array(_
  "NAME:PropServers", "CompInst@V_ROT;238;0"), Array("NAME:ChangedProps", _
  Array("NAME:VALUE", "OverridingDef:=", true, "Value:=", "3600rpm"))))
ppID = oEditor.CreatePagePort( Array("NAME:PagePortProps", "Name:=", "ROT1", _
  "Id:=", 245), Array("NAME:Attributes", "Page:=", 1, "X:=", 0.08636, "Y:=", _
  -0.02794, "Degrees:=", 0, "Flip:=", false) )
ppID = oEditor.CreatePagePort( Array("NAME:PagePortProps", "Name:=", "ROT2", _
  "Id:=", 252), Array("NAME:Attributes", "Page:=", 1, "X:=", 0.08636, "Y:=", _
  -0.0381, "Degrees:=", 0, "Flip:=", false) )
oEditor.CreateGround Array("NAME:GroundProps", "Id:=", "182"), Array(_
  "NAME:Attributes", "Page:=", 1, "X:=", 0.08636, "Y:=", -0.04064, _
  "Degrees:=", 0, "Flip:=", false) 
oEditor.CreateComponent Array("NAME:ComponentProps", "Name:=", _
  "Simplorer Elements/Basic Elements/Measurement/Electrical:AM", "Id:=", _
  "259"), Array("NAME:Attributes", "Page:=", 1, "X:=", 0.04318, "Y:=", _
  0.00762, "Degrees:=", 90, "Flip:=", false) 
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:PassedParameterTab", _
  Array("NAME:PropServers", "CompInst@AM;259;0"), Array("NAME:ChangedProps", _
  Array("NAME:InstanceName", "OverridingDef:=", true, "Value:=", "IA"))))
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:PropDisplayPropTab", _
  Array("NAME:PropServers", "CompInst@AM;259;0"), Array("NAME:NewProps", _
  Array("NAME:InstanceName", "Format:=", "Value", "Location:=", "Right"))))
oEditor.CreateComponent Array("NAME:ComponentProps", "Name:=", _
  "Simplorer Elements/Basic Elements/Measurement/Electrical:AM", "Id:=", _
  "266"), Array("NAME:Attributes", "Page:=", 1, "X:=", 0.04318, "Y:=", _
  -0.00254, "Degrees:=", 90, "Flip:=", false) 
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:PassedParameterTab", _
  Array("NAME:PropServers", "CompInst@AM;266;0"), Array("NAME:ChangedProps", _
  Array("NAME:InstanceName", "OverridingDef:=", true, "Value:=", "IB"))))
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:PropDisplayPropTab", _
  Array("NAME:PropServers", "CompInst@AM;266;0"), Array("NAME:NewProps", _
  Array("NAME:InstanceName", "Format:=", "Value", "Location:=", "Right"))))
oEditor.CreateComponent Array("NAME:ComponentProps", "Name:=", _
  "Simplorer Elements/Basic Elements/Measurement/Electrical:AM", "Id:=", _
  "273"), Array("NAME:Attributes", "Page:=", 1, "X:=", 0.04318, "Y:=", _
  -0.0127, "Degrees:=", 90, "Flip:=", false) 
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:PassedParameterTab", _
  Array("NAME:PropServers", "CompInst@AM;273;0"), Array("NAME:ChangedProps", _
  Array("NAME:InstanceName", "OverridingDef:=", true, "Value:=", "IC"))))
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:PropDisplayPropTab", _
  Array("NAME:PropServers", "CompInst@AM;273;0"), Array("NAME:NewProps", _
  Array("NAME:InstanceName", "Format:=", "Value", "Location:=", "Right"))))
ppID = oEditor.CreatePagePort( Array("NAME:PagePortProps", "Name:=", "A", _
  "Id:=", 280), Array("NAME:Attributes", "Page:=", 1, "X:=", 0.04826, "Y:=", _
  0.01016, "Degrees:=", 180, "Flip:=", false) )
ppID = oEditor.CreatePagePort( Array("NAME:PagePortProps", "Name:=", "B", _
  "Id:=", 287), Array("NAME:Attributes", "Page:=", 1, "X:=", 0.04826, "Y:=", _
  0, "Degrees:=", 180, "Flip:=", false) )
ppID = oEditor.CreatePagePort( Array("NAME:PagePortProps", "Name:=", "C", _
  "Id:=", 294), Array("NAME:Attributes", "Page:=", 1, "X:=", 0.04826, "Y:=", _
  -0.01016, "Degrees:=", 180, "Flip:=", false) )
ppID = oEditor.CreatePagePort( Array("NAME:PagePortProps", "Name:=", "N", _
  "Id:=", 301), Array("NAME:Attributes", "Page:=", 1, "X:=", 0.07874, "Y:=", _
  0, "Degrees:=", 0, "Flip:=", false) )
oEditor.CreateComponent Array("NAME:ComponentProps", "Name:=", _
  "Simplorer Elements/Basic Elements/Measurement/Electrical:VM", "Id:=", _
  "308"), Array("NAME:Attributes", "Page:=", 1, "X:=", 0.08382, "Y:=", _
  -0.00254, "Degrees:=", 90, "Flip:=", false) 
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:PropDisplayPropTab", _
  Array("NAME:PropServers", "CompInst@VM;308;0"), Array("NAME:NewProps", _
  Array("NAME:InstanceName", "Format:=", "Value", "Location:=", "Right"))))
oEditor.CreateGround Array("NAME:GroundProps", "Id:=", "182"), Array(_
  "NAME:Attributes", "Page:=", 1, "X:=", 0.0889, "Y:=", -0.00254, "Degrees:=", _
  0, "Flip:=", false) 
oEditor.CreateWire Array("NAME:WireData", "Id:=", "1", "Points:=", Array(_
  "(0, -0.0381)", "(0.0254, -0.0381)")), Array("NAME:Attributes", "Page:=", 1) 
oEditor.CreateGround Array("NAME:GroundProps", "Id:=", "182"), Array(_
  "NAME:Attributes", "Page:=", 1, "X:=", 0.0127, "Y:=", -0.04064, "Degrees:=", _
  0, "Flip:=", false) 
oEditor.CreateWire Array("NAME:WireData", "Id:=", "1", "Points:=", Array(_
  "(0, -0.0381)", "(0, -0.03556)")), Array("NAME:Attributes", "Page:=", 1) 
oEditor.CreateComponent Array("NAME:ComponentProps", "Name:=", _
  "Simplorer Elements/Basic Elements/Circuit/Sources:E", "Id:=", "315"), _
  Array("NAME:Attributes", "Page:=", 1, "X:=", -0.00254, "Y:=", -0.03048, _
  "Degrees:=", 0, "Flip:=", false) 
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:PropDisplayPropTab", _
  Array("NAME:PropServers", "CompInst@E;315;0"), Array("NAME:NewProps", _
  Array("NAME:InstanceName", "Format:=", "Value", "Location:=", "Right"))))
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:PassedParameterTab", _
  Array("NAME:PropServers", "CompInst@E;315;0"), Array("NAME:ChangedProps", _
  Array("NAME:InstanceName", "OverridingDef:=", true, "Value:=", "VA"))))
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:PassedParameterTab", _
  Array("NAME:PropServers", "CompInst@E;315;0"), Array("NAME:ChangedProps", _
  Array("NAME:Type", "OverridingDef:=", true, "Value:=", "ESINE"))))
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:Quantities", Array(_
  "NAME:PropServers", "CompInst@E;315;0"), Array("NAME:ChangedProps", Array(_
  "NAME:AMPL", "OverridingDef:=", true, "Value:=", "179.629V"))))
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:Quantities", Array(_
  "NAME:PropServers", "CompInst@E;315;0"), Array("NAME:ChangedProps", Array(_
  "NAME:FREQ", "OverridingDef:=", true, "Value:=", "300Hz"))))
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:Quantities", Array(_
  "NAME:PropServers", "CompInst@E;315;0"), Array("NAME:ChangedProps", Array(_
  "NAME:TPERIO", "OverridingDef:=", true, "Value:=", "0.00333333s"))))
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:Quantities", Array(_
  "NAME:PropServers", "CompInst@E;315;0"), Array("NAME:ChangedProps", Array(_
  "NAME:PHASE", "OverridingDef:=", true, "Value:=", "30.8688deg"))))
oEditor.CreateWire Array("NAME:WireData", "Id:=", "1", "Points:=", Array(_
  "(0, -0.0254)", "(0, 0.01016)", "(0.0381, 0.01016)")), Array(_
  "NAME:Attributes", "Page:=", 1) 
oEditor.CreateWire Array("NAME:WireData", "Id:=", "1", "Points:=", Array(_
  "(0.0127, -0.0381)", "(0.0127, -0.03556)")), Array("NAME:Attributes", _
  "Page:=", 1) 
oEditor.CreateComponent Array("NAME:ComponentProps", "Name:=", _
  "Simplorer Elements/Basic Elements/Circuit/Sources:E", "Id:=", "322"), _
  Array("NAME:Attributes", "Page:=", 1, "X:=", 0.01016, "Y:=", -0.03048, _
  "Degrees:=", 0, "Flip:=", false) 
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:PropDisplayPropTab", _
  Array("NAME:PropServers", "CompInst@E;322;0"), Array("NAME:NewProps", _
  Array("NAME:InstanceName", "Format:=", "Value", "Location:=", "Right"))))
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:PassedParameterTab", _
  Array("NAME:PropServers", "CompInst@E;322;0"), Array("NAME:ChangedProps", _
  Array("NAME:InstanceName", "OverridingDef:=", true, "Value:=", "VB"))))
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:PassedParameterTab", _
  Array("NAME:PropServers", "CompInst@E;322;0"), Array("NAME:ChangedProps", _
  Array("NAME:Type", "OverridingDef:=", true, "Value:=", "ESINE"))))
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:Quantities", Array(_
  "NAME:PropServers", "CompInst@E;322;0"), Array("NAME:ChangedProps", Array(_
  "NAME:AMPL", "OverridingDef:=", true, "Value:=", "179.629V"))))
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:Quantities", Array(_
  "NAME:PropServers", "CompInst@E;322;0"), Array("NAME:ChangedProps", Array(_
  "NAME:FREQ", "OverridingDef:=", true, "Value:=", "300Hz"))))
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:Quantities", Array(_
  "NAME:PropServers", "CompInst@E;322;0"), Array("NAME:ChangedProps", Array(_
  "NAME:TPERIO", "OverridingDef:=", true, "Value:=", "0.00333333s"))))
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:Quantities", Array(_
  "NAME:PropServers", "CompInst@E;322;0"), Array("NAME:ChangedProps", Array(_
  "NAME:PHASE", "OverridingDef:=", true, "Value:=", "270.869deg"))))
oEditor.CreateWire Array("NAME:WireData", "Id:=", "1", "Points:=", Array(_
  "(0.0127, -0.0254)", "(0.0127, 0)", "(0.0381, 0)")), Array(_
  "NAME:Attributes", "Page:=", 1) 
oEditor.CreateWire Array("NAME:WireData", "Id:=", "1", "Points:=", Array(_
  "(0.0254, -0.0381)", "(0.0254, -0.03556)")), Array("NAME:Attributes", _
  "Page:=", 1) 
oEditor.CreateComponent Array("NAME:ComponentProps", "Name:=", _
  "Simplorer Elements/Basic Elements/Circuit/Sources:E", "Id:=", "329"), _
  Array("NAME:Attributes", "Page:=", 1, "X:=", 0.02286, "Y:=", -0.03048, _
  "Degrees:=", 0, "Flip:=", false) 
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:PropDisplayPropTab", _
  Array("NAME:PropServers", "CompInst@E;329;0"), Array("NAME:NewProps", _
  Array("NAME:InstanceName", "Format:=", "Value", "Location:=", "Right"))))
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:PassedParameterTab", _
  Array("NAME:PropServers", "CompInst@E;329;0"), Array("NAME:ChangedProps", _
  Array("NAME:InstanceName", "OverridingDef:=", true, "Value:=", "VC"))))
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:PassedParameterTab", _
  Array("NAME:PropServers", "CompInst@E;329;0"), Array("NAME:ChangedProps", _
  Array("NAME:Type", "OverridingDef:=", true, "Value:=", "ESINE"))))
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:Quantities", Array(_
  "NAME:PropServers", "CompInst@E;329;0"), Array("NAME:ChangedProps", Array(_
  "NAME:AMPL", "OverridingDef:=", true, "Value:=", "179.629V"))))
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:Quantities", Array(_
  "NAME:PropServers", "CompInst@E;329;0"), Array("NAME:ChangedProps", Array(_
  "NAME:FREQ", "OverridingDef:=", true, "Value:=", "300Hz"))))
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:Quantities", Array(_
  "NAME:PropServers", "CompInst@E;329;0"), Array("NAME:ChangedProps", Array(_
  "NAME:TPERIO", "OverridingDef:=", true, "Value:=", "0.00333333s"))))
oEditor.ChangeProperty Array("NAME:AllTabs", Array("NAME:Quantities", Array(_
  "NAME:PropServers", "CompInst@E;329;0"), Array("NAME:ChangedProps", Array(_
  "NAME:PHASE", "OverridingDef:=", true, "Value:=", "150.869deg"))))
oEditor.CreateWire Array("NAME:WireData", "Id:=", "1", "Points:=", Array(_
  "(0.0254, -0.0254)", "(0.0254, -0.01016)", "(0.0381, -0.01016)")), Array(_
  "NAME:Attributes", "Page:=", 1) 
Set oModule = oDesign.GetModule("SimSetup")
oModule.EditTransient "TR", Array("NAME:SimSetup", "OptionName:=", _
  "(Default Options)", "AnalysisEnabled:=", 1, "Name:=", "TR", _
  "TransientData:=", Array("15ms", "0.3us", "3us", false, ""), _
  "EnableContSolve:=", false)
Set oModule = oDesign.GetModule("ReportSetup")
oModule.CreateReport "Load Torque", "Standard", "Rectangular Plot", "TR", _
  Array("NAME:Context", "SimValueContext:=", _
  Array(1, 0, 2, 0, false, false, -1, 1, 0, 1, 1, "", 0, 0)), Array("Time:=", _
  Array("All")), Array("X Component:=", "Time", "Y Component:=", Array(_
  "speed.TORQUE")), Array()
oModule.CreateReport "Current", "Standard", "Rectangular Plot", "TR", Array(_
  "NAME:Context", "SimValueContext:=", _
  Array(1, 0, 2, 0, false, false, -1, 1, 0, 1, 1, "", 0, 0)), Array("Time:=", _
  Array("All")), Array("X Component:=", "Time", "Y Component:=", Array(_
  "IA.I", "IB.I", "IC.I")), Array()
sName = oDesign.GetName()
arr = Split(sName, ";")
oProject.SetActiveDesign arr(1)
oEditor.ZoomToFit
if (oArgs.Count > 0) then 
  oProject.SaveAs oArgs(0), TRUE
end if
