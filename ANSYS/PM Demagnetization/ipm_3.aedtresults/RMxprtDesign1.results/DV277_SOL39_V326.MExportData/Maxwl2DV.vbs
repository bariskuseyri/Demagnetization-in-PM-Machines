' ----------------------------------------------------------------------
' Script Created by RMxprt to generate Maxwell 2D Version 2016.0 design 
' Can specify one arg to setup external circuit                         
' ----------------------------------------------------------------------

On Error Resume Next
Set oAnsoftApp = CreateObject("AnsoftMaxwell.MaxwellScriptInterface")
On Error Goto 0
Set oDesktop = oAnsoftApp.GetAppDesktop()
Set oArgs = AnsoftScript.arguments
oDesktop.RestoreWindow
Set oProject = oDesktop.GetActiveProject()
Set oDesign = oProject.GetActiveDesign()
designName = oDesign.GetName
Set oEditor = oDesign.SetActiveEditor("3D Modeler")
oEditor.SetModelUnits Array("NAME:Units Parameter", "Units:=", "mm", _
  "Rescale:=", false)
oDesign.SetSolutionType "Transient", "XY"
Set oModule = oDesign.GetModule("BoundarySetup")
if (oArgs.Count = 1) then 
oModule.EditExternalCircuit oArgs(0), Array(), Array(), Array(), Array()
end if
oEditor.SetModelValidationSettings Array("NAME:Validation Options", _
  "EntityCheckLevel:=", "Strict", "IgnoreUnclassifiedObjects:=", true)
On Error Resume Next
Set oModule = oDesign.GetModule("MeshSetup")
oModule.InitialMeshSettings Array("NAME:MeshSettings", "MeshMethod:=", _
  "AnsoftTAU")
On Error Goto 0
On Error Resume Next
oDesign.ChangeProperty Array("NAME:AllTabs", Array("NAME:LocalVariableTab", _
  Array("NAME:PropServers", "LocalVariables"), Array("NAME:NewProps", Array(_
  "NAME:fractions", "PropType:=", "VariableProp", "UserDef:=", true, _
  "Value:=", "1"))))
oDesign.ChangeProperty Array("NAME:AllTabs", Array("NAME:LocalVariableTab", _
  Array("NAME:PropServers", "LocalVariables"), Array("NAME:ChangedProps", _
  Array("NAME:fractions", "Value:=", "1"))))
On Error Goto 0
Set oDefinitionManager = oProject.GetDefinitionManager()
oDefinitionManager.ModifyLibraries designName, Array("NAME:PersonalLib"), _
  Array("NAME:UserLib"), Array("NAME:SystemLib", "Materials:=", Array(_
  "Materials", "RMxprt"))
On Error Resume Next
Set oModule = oDesign.GetModule("AnalysisSetup")
oModule.DeleteSetups Array("Setup1")
Set oModule = oDesign.GetModule("ModelSetup")
oModule.DeleteMotionSetup Array("MotionSetup1")
Set oModule = oDesign.GetModule("BoundarySetup")
oModule.DeleteBoundaries Array("Master")
oModule.DeleteBoundaries Array("Slave")
oModule.DeleteBoundaries Array("PhaseA")
oModule.DeleteBoundaries Array("PhaseB")
oModule.DeleteBoundaries Array("PhaseC")
oEditor.Delete Array("NAME:Selections", "Selections:=", "Band")
oEditor.Delete Array("NAME:Selections", "Selections:=", "InnerRegion")
oEditor.Delete Array("NAME:Selections", "Selections:=", "OuterRegion")
oEditor.Delete Array("NAME:Selections", "Selections:=", "StatorRegion")
oEditor.Delete Array("NAME:Selections", "Selections:=", "MasterSheet")
oEditor.Delete Array("NAME:Selections", "Selections:=", "SlaveSheet")
On Error Goto 0
if (oDefinitionManager.DoesMaterialExist("M19_24G_2DSF0.950")) then
else
oDefinitionManager.AddMaterial Array("NAME:M19_24G_2DSF0.950", _
  "CoordinateSystemType:=", "Cartesian", Array("NAME:AttachedData"), Array(_
  "NAME:ModifierData"), Array("NAME:permeability", "property_type:=", _
  "nonlinear", "HUnit:=", "A_per_meter", "BUnit:=", "tesla", Array(_
  "NAME:BHCoordinates", Array("NAME:Coordinate", "X:=", 0, "Y:=", 0), Array(_
  "NAME:Coordinate", "X:=", 22.28, "Y:=", 0.0475014), Array("NAME:Coordinate", _
  "X:=", 25.46, "Y:=", 0.0950016), Array("NAME:Coordinate", "X:=", 31.83, _
  "Y:=", 0.142502), Array("NAME:Coordinate", "X:=", 47.74, "Y:=", 0.342003), _
  Array("NAME:Coordinate", "X:=", 63.66, "Y:=", 0.513004), Array(_
  "NAME:Coordinate", "X:=", 79.57, "Y:=", 0.617505), Array("NAME:Coordinate", _
  "X:=", 159.15, "Y:=", 0.94051), Array("NAME:Coordinate", "X:=", 318.3, _
  "Y:=", 1.14002), Array("NAME:Coordinate", "X:=", 477.46, "Y:=", 1.21603), _
  Array("NAME:Coordinate", "X:=", 636.61, "Y:=", 1.26354), Array(_
  "NAME:Coordinate", "X:=", 795.77, "Y:=", 1.29205), Array("NAME:Coordinate", _
  "X:=", 1591.5, "Y:=", 1.3681), Array("NAME:Coordinate", "X:=", 3183, "Y:=", _
  1.4442), Array("NAME:Coordinate", "X:=", 4774.6, "Y:=", 1.5013), Array(_
  "NAME:Coordinate", "X:=", 6366.1, "Y:=", 1.5489), Array("NAME:Coordinate", _
  "X:=", 7957.7, "Y:=", 1.587), Array("NAME:Coordinate", "X:=", 15915, "Y:=", _
  1.711), Array("NAME:Coordinate", "X:=", 31830, "Y:=", 1.8069999), Array(_
  "NAME:Coordinate", "X:=", 111407, "Y:=", 1.9069999), Array(_
  "NAME:Coordinate", "X:=", 190984, "Y:=", 2.0069999), Array(_
  "NAME:Coordinate", "X:=", 350138, "Y:=", 2.2069998), Array(_
  "NAME:Coordinate", "X:=", 509292, "Y:=", 2.4069998), Array(_
  "NAME:Coordinate", "X:=", 2100832, "Y:=", 4.4069992))), Array(_
  "NAME:magnetic_coercivity", "property_type:=", "VectorProperty", _
  "Magnitude:=", "0A_per_meter", "DirComp1:=", "0", "DirComp2:=", "0", _
  "DirComp3:=", "0"), Array("NAME:core_loss_type", "property_type:=", _
  "ChoiceProperty", "Choice:=", "Electrical Steel"), "core_loss_kh:=", _
  172.84211, "core_loss_kc:=", 1.3684211, "core_loss_ke:=", 1.7646828, _
  "conductivity:=", 1960000, "mass_density:=", 7267.5) 
end if
if (oDefinitionManager.DoesMaterialExist("XG196/96_2DSF1.000_X")) then
else
oDefinitionManager.AddMaterial Array("NAME:XG196/96_2DSF1.000_X", _
  "CoordinateSystemType:=", "Cartesian", Array("NAME:AttachedData"), Array(_
  "NAME:ModifierData"), "permeability:=", "1", "conductivity:=", "0", _
  "mass_density:=", "0", Array("NAME:magnetic_coercivity", "property_type:=", _
  "VectorProperty", "Magnitude:=", "-726961.73A_per_meter", "DirComp1:=", "1", _
  "DirComp2:=", "0", "DirComp3:=", "0"))
end if
if (oDefinitionManager.DoesMaterialExist("copper_75C")) then
else
oDefinitionManager.AddMaterial Array("NAME:copper_75C", _
  "CoordinateSystemType:=", "Cartesian", Array("NAME:AttachedData"), Array(_
  "NAME:ModifierData"), "conductivity:=", "46000000")
end if
oEditor.CreateUserDefinedPart Array("NAME:UserDefinedPrimitiveParameters", _
  "DllName:=", "RMxprt/Band", "Version:=", "12.1", "NoOfParameters:=", 7, _
  "Library:=", "syslib", Array("NAME:ParamVector", Array("NAME:Pair", _
  "Name:=", "DiaGap", "Value:=", "74.5mm"), Array("NAME:Pair", "Name:=", _
  "DiaYoke", "Value:=", "26mm"), Array("NAME:Pair", "Name:=", "Length", _
  "Value:=", "0mm"), Array("NAME:Pair", "Name:=", "SegAngle", "Value:=", _
  "0deg"), Array("NAME:Pair", "Name:=", "Fractions", "Value:=", "1"), Array(_
  "NAME:Pair", "Name:=", "HalfAxial", "Value:=", "0"), Array("NAME:Pair", _
  "Name:=", "InfoCore", "Value:=", "0"))), Array("NAME:Attributes", "Name:=", _
  "Band", "Flags:=", "", "Color:=", "(0 255 255)", "Transparency:=", 0, _
  "PartCoordinateSystem:=", "Global", "MaterialName:=", "vacuum", _
  "SolveInside:=", true) 
oEditor.CreateUserDefinedPart Array("NAME:UserDefinedPrimitiveParameters", _
  "DllName:=", "RMxprt/Band", "Version:=", "12.1", "NoOfParameters:=", 7, _
  "Library:=", "syslib", Array("NAME:ParamVector", Array("NAME:Pair", _
  "Name:=", "DiaGap", "Value:=", "74.5mm"), Array("NAME:Pair", "Name:=", _
  "DiaYoke", "Value:=", "26mm"), Array("NAME:Pair", "Name:=", "Length", _
  "Value:=", "0mm"), Array("NAME:Pair", "Name:=", "SegAngle", "Value:=", _
  "0deg"), Array("NAME:Pair", "Name:=", "Fractions", "Value:=", "1"), Array(_
  "NAME:Pair", "Name:=", "HalfAxial", "Value:=", "0"), Array("NAME:Pair", _
  "Name:=", "InfoCore", "Value:=", "100"))), Array("NAME:Attributes", _
  "Name:=", "Shaft", "Flags:=", "", "Color:=", "(0 255 255)", _
  "Transparency:=", 0, "PartCoordinateSystem:=", "Global", "MaterialName:=", _
  "M19_24G_2DSF0.950", "SolveInside:=", true) 
oEditor.CreateUserDefinedPart Array("NAME:UserDefinedPrimitiveParameters", _
  "DllName:=", "RMxprt/Band", "Version:=", "12.1", "NoOfParameters:=", 7, _
  "Library:=", "syslib", Array("NAME:ParamVector", Array("NAME:Pair", _
  "Name:=", "DiaGap", "Value:=", "74.5mm"), Array("NAME:Pair", "Name:=", _
  "DiaYoke", "Value:=", "120mm"), Array("NAME:Pair", "Name:=", "Length", _
  "Value:=", "0mm"), Array("NAME:Pair", "Name:=", "SegAngle", "Value:=", _
  "0deg"), Array("NAME:Pair", "Name:=", "Fractions", "Value:=", "1"), Array(_
  "NAME:Pair", "Name:=", "HalfAxial", "Value:=", "0"), Array("NAME:Pair", _
  "Name:=", "InfoCore", "Value:=", "100"))), Array("NAME:Attributes", _
  "Name:=", "OuterRegion", "Flags:=", "", "Color:=", "(0 255 255)", _
  "Transparency:=", 0, "PartCoordinateSystem:=", "Global", "MaterialName:=", _
  "vacuum", "SolveInside:=", true) 
oEditor.SetPropertyValue "Geometry3DCmdTab", _
  "OuterRegion:CreateUserDefinedPart:1", "Fractions", "fractions"
oEditor.Copy Array("NAME:Selections", "Selections:=", "OuterRegion")
oEditor.Paste
oEditor.SetPropertyValue "Geometry3DCmdTab", _
  "OuterRegion1:CreateUserDefinedPart:1", "InfoCore", "1"
oEditor.ChangeProperty Array("NAME:AllTabs", Array(_
  "NAME:Geometry3DAttributeTab", Array("NAME:PropServers", "OuterRegion1"), _
  Array("NAME:ChangedProps", Array("NAME:Name", "Value:=", "Tool"))))
tool = oEditor.GetBodyNamesByPosition(Array("NAME:Parameters", "XPosition:=", _
  "63mm", "YPosition:=", "0mm", "ZPosition:=", "0mm"))
oEditor.FitAll
Set oModule = oDesign.GetModule("ModelSetup")
oModule.SetSymmetryMultiplier "fractions"
Set oModule = oDesign.GetModule("BoundarySetup")
edgeID = oEditor.GetEdgeByPosition(Array("NAME:Parameters", "BodyName:=", _
  "OuterRegion", "XPosition:=", "-60mm", "YPosition:=", _
  "7.3478807948841199e-15mm", "ZPosition:=", "0mm"))
oModule.AssignVectorPotential Array("NAME:VectorPotential1", "Edges:=", Array(edgeID), _
  "Value:=", "0", "CoordinateSystem:=", "")
oDesign.SetDesignSettings Array("NAME:Design Settings Data", "ModelDepth:=", _
  "65mm")
Set oModule = oDesign.GetModule("AnalysisSetup")
oModule.InsertSetup "Transient", Array("NAME:Setup1", "FastReachSteadyState:=", _
  true, "AutoDetectSteadyState:=", true, "FrequencyOfAddedVoltageSource:=", _
  "300Hz", "StopTime:=", "0.03s", "TimeStep:=", "3e-05s")
Set oModule = oDesign.GetModule("BoundarySetup")
oModule.SetMinimumTimeStep "0.0003ms" 
oEditor.ShowWindow
oEditor.CreateUserDefinedPart Array("NAME:UserDefinedPrimitiveParameters", _
  "DllName:=", "RMxprt/SlotCore", "Version:=", "12.1", "NoOfParameters:=", 19, _
  "Library:=", "syslib", Array("NAME:ParamVector", Array("NAME:Pair", _
  "Name:=", "DiaGap", "Value:=", "75mm"), Array("NAME:Pair", "Name:=", _
  "DiaYoke", "Value:=", "120mm"), Array("NAME:Pair", "Name:=", "Length", _
  "Value:=", "0mm"), Array("NAME:Pair", "Name:=", "Skew", "Value:=", "0deg"), _
  Array("NAME:Pair", "Name:=", "Slots", "Value:=", "12"), Array("NAME:Pair", _
  "Name:=", "SlotType", "Value:=", "2"), Array("NAME:Pair", "Name:=", "Hs0", _
  "Value:=", "0.5mm"), Array("NAME:Pair", "Name:=", "Hs01", "Value:=", "0mm"), _
  Array("NAME:Pair", "Name:=", "Hs1", "Value:=", "1mm"), Array("NAME:Pair", _
  "Name:=", "Hs2", "Value:=", "8.199999999999999mm"), Array("NAME:Pair", _
  "Name:=", "Bs0", "Value:=", "2.5mm"), Array("NAME:Pair", "Name:=", "Bs1", _
  "Value:=", "5.6mm"), Array("NAME:Pair", "Name:=", "Bs2", "Value:=", "7.6mm"), _
  Array("NAME:Pair", "Name:=", "Rs", "Value:=", "3.8mm"), Array("NAME:Pair", _
  "Name:=", "FilletType", "Value:=", "0"), Array("NAME:Pair", "Name:=", _
  "HalfSlot", "Value:=", "0"), Array("NAME:Pair", "Name:=", "SegAngle", _
  "Value:=", "15deg"), Array("NAME:Pair", "Name:=", "LenRegion", "Value:=", _
  "0mm"), Array("NAME:Pair", "Name:=", "InfoCore", "Value:=", "0"))), Array(_
  "NAME:Attributes", "Name:=", "Stator", "Flags:=", "", "Color:=", _
  "(132 132 193)", "Transparency:=", 0, "PartCoordinateSystem:=", "Global", _
  "MaterialName:=", "M19_24G_2DSF0.950", "SolveInside:=", true) 
On Error Resume Next
oDesign.ChangeProperty Array("NAME:AllTabs", Array("NAME:LocalVariableTab", _
  Array("NAME:PropServers", "LocalVariables"), Array("NAME:NewProps", Array(_
  "NAME:delta", "PropType:=", "VariableProp", "UserDef:=", true, "Value:=", _
  "30.868838869240751deg"))))
oDesign.ChangeProperty Array("NAME:AllTabs", Array("NAME:LocalVariableTab", _
  Array("NAME:PropServers", "LocalVariables"), Array("NAME:NewProps", Array(_
  "NAME:conds", "PropType:=", "VariableProp", "UserDef:=", true, "Value:=", _
  "52"))))
oDesign.ChangeProperty Array("NAME:AllTabs", Array("NAME:LocalVariableTab", _
  Array("NAME:PropServers", "LocalVariables"), Array("NAME:NewProps", Array(_
  "NAME:R1", "PropType:=", "VariableProp", "UserDef:=", true, "Value:=", _
  "0.65001106077290594ohm"))))
oDesign.ChangeProperty Array("NAME:AllTabs", Array("NAME:LocalVariableTab", _
  Array("NAME:PropServers", "LocalVariables"), Array("NAME:NewProps", Array(_
  "NAME:Le1", "PropType:=", "VariableProp", "UserDef:=", true, "Value:=", _
  "-3.1157849301281273e-05H"))))
On Error Goto 0
oEditor.CreateUserDefinedPart Array("NAME:UserDefinedPrimitiveParameters", _
  "DllName:=", "RMxprt/LapCoil", "Version:=", "12.0", "NoOfParameters:=", 21, _
  "Library:=", "syslib", Array("NAME:ParamVector", Array("NAME:Pair", _
  "Name:=", "DiaGap", "Value:=", "75mm"), Array("NAME:Pair", "Name:=", _
  "DiaYoke", "Value:=", "120mm"), Array("NAME:Pair", "Name:=", "Length", _
  "Value:=", "0mm"), Array("NAME:Pair", "Name:=", "Skew", "Value:=", "0deg"), _
  Array("NAME:Pair", "Name:=", "Slots", "Value:=", "12"), Array("NAME:Pair", _
  "Name:=", "SlotType", "Value:=", "2"), Array("NAME:Pair", "Name:=", "Hs0", _
  "Value:=", "0.5mm"), Array("NAME:Pair", "Name:=", "Hs1", "Value:=", "1mm"), _
  Array("NAME:Pair", "Name:=", "Hs2", "Value:=", "8.199999999999999mm"), _
  Array("NAME:Pair", "Name:=", "Bs0", "Value:=", "2.5mm"), Array("NAME:Pair", _
  "Name:=", "Bs1", "Value:=", "5.6mm"), Array("NAME:Pair", "Name:=", "Bs2", _
  "Value:=", "7.6mm"), Array("NAME:Pair", "Name:=", "Rs", "Value:=", "3.8mm"), _
  Array("NAME:Pair", "Name:=", "FilletType", "Value:=", "0"), Array(_
  "NAME:Pair", "Name:=", "Layers", "Value:=", "1"), Array("NAME:Pair", _
  "Name:=", "CoilPitch", "Value:=", "2"), Array("NAME:Pair", "Name:=", _
  "EndExt", "Value:=", "0mm"), Array("NAME:Pair", "Name:=", "SpanExt", _
  "Value:=", "0mm"), Array("NAME:Pair", "Name:=", "SegAngle", "Value:=", _
  "10deg"), Array("NAME:Pair", "Name:=", "LenRegion", "Value:=", "0mm"), _
  Array("NAME:Pair", "Name:=", "InfoCoil", "Value:=", "2"))), Array(_
  "NAME:Attributes", "Name:=", "Coil", "Flags:=", "", "Color:=", _
  "(250 167 14)", "Transparency:=", 0, "PartCoordinateSystem:=", "Global", _
  "MaterialName:=", "copper_75C", "SolveInside:=", true) 
oEditor.DuplicateAroundAxis Array("NAME:Selections", "Selections:=", "Coil"), _
  Array("NAME:DuplicateAroundAxisParameters", "CoordinateSystemID:=", -1, _
  "CreateNewObjects:=", true, "WhichAxis:=", "Z", "AngleStr:=", "30deg", _
  "NumClones:=", "12"), Array("NAME:Options", "DuplicateBoundaries:=", false)
oEditor.ChangeProperty Array("NAME:AllTabs", Array(_
  "NAME:Geometry3DAttributeTab", Array("NAME:PropServers", "Coil"), Array(_
  "NAME:ChangedProps", Array("NAME:Name", "Value:=", "Coil_0"))))
Set oModule = oDesign.GetModule("BoundarySetup")
oModule.AssignWindingGroup Array("NAME:PhaseA", "Type:=", "Voltage", _
  "IsSolid:=", false, "Current:=", "0A", "Voltage:=", _
  "179.629*sin(2*pi*300*time+delta)", "Resistance:=", "R1", "Inductance:=", _
  "Le1", "ParallelBranchesNum:=", "1")
Set oModule = oDesign.GetModule("BoundarySetup")
oModule.AssignWindingGroup Array("NAME:PhaseB", "Type:=", "Voltage", _
  "IsSolid:=", false, "Current:=", "0A", "Voltage:=", _
  "179.629*sin(2*pi*300*time+delta-2*pi/3)", "Resistance:=", "R1", _
  "Inductance:=", "Le1", "ParallelBranchesNum:=", "1")
Set oModule = oDesign.GetModule("BoundarySetup")
oModule.AssignWindingGroup Array("NAME:PhaseC", "Type:=", "Voltage", _
  "IsSolid:=", false, "Current:=", "0A", "Voltage:=", _
  "179.629*sin(2*pi*300*time+delta-4*pi/3)", "Resistance:=", "R1", _
  "Inductance:=", "Le1", "ParallelBranchesNum:=", "1")
oModule.AssignCoil Array("NAME:PhARe_0", "Objects:=", Array("Coil_11"), _
  "Conductor number:=", "conds", "PolarityType:=", "Negative", "Winding:=", _
  "PhaseA")
oModule.AssignCoil Array("NAME:PhA_0", "Objects:=", Array("Coil_0"), _
  "Conductor number:=", "conds", "PolarityType:=", "Positive", "Winding:=", _
  "PhaseA")
oModule.AssignCoil Array("NAME:PhB_1", "Objects:=", Array("Coil_1"), _
  "Conductor number:=", "conds", "PolarityType:=", "Positive", "Winding:=", _
  "PhaseB")
oModule.AssignCoil Array("NAME:PhBRe_1", "Objects:=", Array("Coil_2"), _
  "Conductor number:=", "conds", "PolarityType:=", "Negative", "Winding:=", _
  "PhaseB")
oModule.AssignCoil Array("NAME:PhCRe_2", "Objects:=", Array("Coil_3"), _
  "Conductor number:=", "conds", "PolarityType:=", "Negative", "Winding:=", _
  "PhaseC")
oModule.AssignCoil Array("NAME:PhC_2", "Objects:=", Array("Coil_4"), _
  "Conductor number:=", "conds", "PolarityType:=", "Positive", "Winding:=", _
  "PhaseC")
oModule.AssignCoil Array("NAME:PhA_3", "Objects:=", Array("Coil_5"), _
  "Conductor number:=", "conds", "PolarityType:=", "Positive", "Winding:=", _
  "PhaseA")
oModule.AssignCoil Array("NAME:PhARe_3", "Objects:=", Array("Coil_6"), _
  "Conductor number:=", "conds", "PolarityType:=", "Negative", "Winding:=", _
  "PhaseA")
oModule.AssignCoil Array("NAME:PhBRe_4", "Objects:=", Array("Coil_7"), _
  "Conductor number:=", "conds", "PolarityType:=", "Negative", "Winding:=", _
  "PhaseB")
oModule.AssignCoil Array("NAME:PhB_4", "Objects:=", Array("Coil_8"), _
  "Conductor number:=", "conds", "PolarityType:=", "Positive", "Winding:=", _
  "PhaseB")
oModule.AssignCoil Array("NAME:PhC_5", "Objects:=", Array("Coil_9"), _
  "Conductor number:=", "conds", "PolarityType:=", "Positive", "Winding:=", _
  "PhaseC")
oModule.AssignCoil Array("NAME:PhCRe_5", "Objects:=", Array("Coil_10"), _
  "Conductor number:=", "conds", "PolarityType:=", "Negative", "Winding:=", _
  "PhaseC")
Set oModule = oDesign.GetModule("ReportSetup")
oModule.CreateReport "Stator Currents", "Transient", "XY Plot", _
  "Setup1 : Transient", Array(), Array("Time:=", Array("All")), Array(_
  "X Component:=", "Time", "Y Component:=", Array("Current(PhaseA)", _
  "Current(PhaseB)", "Current(PhaseC)")), Array()
oEditor.ShowWindow
Set oModule = oDesign.GetModule("BoundarySetup")
oModule.SetupYConnection Array(Array("NAME:YConnection", "Windings:=", _
  "PhaseA,PhaseB,PhaseC"))
oEditor.CreateUserDefinedPart Array("NAME:UserDefinedPrimitiveParameters", _
  "DllName:=", "RMxprt/IPMCore", "Version:=", "19.0", "NoOfParameters:=", 16, _
  "Library:=", "syslib", Array("NAME:ParamVector", Array("NAME:Pair", _
  "Name:=", "DiaGap", "Value:=", "74mm"), Array("NAME:Pair", "Name:=", _
  "DiaYoke", "Value:=", "26mm"), Array("NAME:Pair", "Name:=", "Length", _
  "Value:=", "0mm"), Array("NAME:Pair", "Name:=", "Poles", "Value:=", "10"), _
  Array("NAME:Pair", "Name:=", "PoleType", "Value:=", "3"), Array("NAME:Pair", _
  "Name:=", "D1", "Value:=", "72mm"), Array("NAME:Pair", "Name:=", "O1", _
  "Value:=", "1mm"), Array("NAME:Pair", "Name:=", "O2", "Value:=", "10mm"), _
  Array("NAME:Pair", "Name:=", "B1", "Value:=", "2mm"), Array("NAME:Pair", _
  "Name:=", "Rib", "Value:=", "2mm"), Array("NAME:Pair", "Name:=", "HRib", _
  "Value:=", "1mm"), Array("NAME:Pair", "Name:=", "DminMag", "Value:=", "0mm"), _
  Array("NAME:Pair", "Name:=", "ThickMag", "Value:=", "3mm"), Array(_
  "NAME:Pair", "Name:=", "WidthMag", "Value:=", "20mm"), Array("NAME:Pair", _
  "Name:=", "LenRegion", "Value:=", "0mm"), Array("NAME:Pair", "Name:=", _
  "InfoCore", "Value:=", "0"))), Array("NAME:Attributes", "Name:=", "Rotor", _
  "Flags:=", "", "Color:=", "(132 132 193)", "Transparency:=", 0, _
  "PartCoordinateSystem:=", "Global", "MaterialName:=", "M19_24G_2DSF0.950", _
  "SolveInside:=", true) 
oEditor.Rotate Array("NAME:Selections", "Selections:=", "Rotor"), Array(_
  "NAME:RotateParameters", "CoordinateSystemID:=", -1, "RotateAxis:=", "Z", _
  "RotateAngle:=", "18deg")
oEditor.CreateUserDefinedPart Array("NAME:UserDefinedPrimitiveParameters", _
  "DllName:=", "RMxprt/IPMCore", "Version:=", "19.0", "NoOfParameters:=", 16, _
  "Library:=", "syslib", Array("NAME:ParamVector", Array("NAME:Pair", _
  "Name:=", "DiaGap", "Value:=", "74mm"), Array("NAME:Pair", "Name:=", _
  "DiaYoke", "Value:=", "26mm"), Array("NAME:Pair", "Name:=", "Length", _
  "Value:=", "0mm"), Array("NAME:Pair", "Name:=", "Poles", "Value:=", "10"), _
  Array("NAME:Pair", "Name:=", "PoleType", "Value:=", "3"), Array("NAME:Pair", _
  "Name:=", "D1", "Value:=", "72mm"), Array("NAME:Pair", "Name:=", "O1", _
  "Value:=", "1mm"), Array("NAME:Pair", "Name:=", "O2", "Value:=", "10mm"), _
  Array("NAME:Pair", "Name:=", "B1", "Value:=", "2mm"), Array("NAME:Pair", _
  "Name:=", "Rib", "Value:=", "2mm"), Array("NAME:Pair", "Name:=", "HRib", _
  "Value:=", "1mm"), Array("NAME:Pair", "Name:=", "DminMag", "Value:=", "0mm"), _
  Array("NAME:Pair", "Name:=", "ThickMag", "Value:=", "3mm"), Array(_
  "NAME:Pair", "Name:=", "WidthMag", "Value:=", "20mm"), Array("NAME:Pair", _
  "Name:=", "LenRegion", "Value:=", "0mm"), Array("NAME:Pair", "Name:=", _
  "InfoCore", "Value:=", "-1"))), Array("NAME:Attributes", "Name:=", "Mag1", _
  "Flags:=", "", "Color:=", "(0 255 128)", "Transparency:=", 0, _
  "PartCoordinateSystem:=", "Global", "MaterialName:=", _
  "XG196/96_2DSF1.000_X", "SolveInside:=", true) 
oEditor.Rotate Array("NAME:Selections", "Selections:=", "Mag1"), Array(_
  "NAME:RotateParameters", "CoordinateSystemID:=", -1, "RotateAxis:=", "Z", _
  "RotateAngle:=", "18deg")
oEditor.DuplicateAroundAxis Array("NAME:Selections", "Selections:=", "Mag1"), _
  Array("NAME:DuplicateAroundAxisParameters", "CoordinateSystemID:=", -1, _
  "CreateNewObjects:=", true, "WhichAxis:=", "Z", "AngleStr:=", "36deg", _
  "NumClones:=", "10"), Array("NAME:Options", "DuplicateBoundaries:=", false)
oEditor.ChangeProperty Array("NAME:AllTabs", Array(_
  "NAME:Geometry3DAttributeTab", Array("NAME:PropServers", "Mag1"), Array(_
  "NAME:ChangedProps", Array("NAME:Name", "Value:=", "Mag1_0"))))
On Error Resume Next
oEditor.ChangeProperty Array("NAME:AllTabs", Array(_
  "NAME:Geometry3DAttributeTab", Array("NAME:PropServers", "Mag1_0"), Array(_
  "NAME:ChangedProps", Array("NAME:Material", "Material:=", _
  "XG196/96_2DSF1.000_X"))))
On Error Goto 0
oEditor.CreateRelativeCS Array("NAME:RelativeCSParameters", _
  "CoordinateSystemID:=", -1, "OriginX:=", "0", "OriginY:=", "0", "OriginZ:=", _
  "0", "XAxisXvec:=", "0.86142954", "XAxisYvec:=", "-0.5078771", _
  "XAxisZvec:=", "0", "YAxisXvec:=", "0.5078771", "YAxisYvec:=", "0.86142954", _
  "YAxisZvec:=", "0"), Array("NAME:Attributes", "Name:=", "relativeCS1_0")
oEditor.SetWCS Array("NAME:RSetWCS Parameter", "Working Coordinate System:=", _
  "Global")
oEditor.ChangeProperty Array("NAME:AllTabs", Array(_
  "NAME:Geometry3DAttributeTab", Array("NAME:PropServers", "Mag1_0"), Array(_
  "NAME:ChangedProps", Array("NAME:Orientation", "Value:=", "relativeCS1_0"))))
On Error Resume Next
oEditor.ChangeProperty Array("NAME:AllTabs", Array(_
  "NAME:Geometry3DAttributeTab", Array("NAME:PropServers", "Mag1_1"), Array(_
  "NAME:ChangedProps", Array("NAME:Material", "Material:=", _
  "XG196/96_2DSF1.000_X"))))
On Error Goto 0
oEditor.CreateRelativeCS Array("NAME:RelativeCSParameters", _
  "CoordinateSystemID:=", -1, "OriginX:=", "0", "OriginY:=", "0", "OriginZ:=", _
  "0", "XAxisXvec:=", "-0.99543381", "XAxisYvec:=", "-0.095454373", _
  "XAxisZvec:=", "0", "YAxisXvec:=", "0.095454373", "YAxisYvec:=", _
  "-0.99543381", "YAxisZvec:=", "0"), Array("NAME:Attributes", "Name:=", _
  "relativeCS1_1")
oEditor.SetWCS Array("NAME:RSetWCS Parameter", "Working Coordinate System:=", _
  "Global")
oEditor.ChangeProperty Array("NAME:AllTabs", Array(_
  "NAME:Geometry3DAttributeTab", Array("NAME:PropServers", "Mag1_1"), Array(_
  "NAME:ChangedProps", Array("NAME:Orientation", "Value:=", "relativeCS1_1"))))
On Error Resume Next
oEditor.ChangeProperty Array("NAME:AllTabs", Array(_
  "NAME:Geometry3DAttributeTab", Array("NAME:PropServers", "Mag1_2"), Array(_
  "NAME:ChangedProps", Array("NAME:Material", "Material:=", _
  "XG196/96_2DSF1.000_X"))))
On Error Goto 0
oEditor.CreateRelativeCS Array("NAME:RelativeCSParameters", _
  "CoordinateSystemID:=", -1, "OriginX:=", "0", "OriginY:=", "0", "OriginZ:=", _
  "0", "XAxisXvec:=", "0.74921619", "XAxisYvec:=", "0.66232552", _
  "XAxisZvec:=", "0", "YAxisXvec:=", "-0.66232552", "YAxisYvec:=", _
  "0.74921619", "YAxisZvec:=", "0"), Array("NAME:Attributes", "Name:=", _
  "relativeCS1_2")
oEditor.SetWCS Array("NAME:RSetWCS Parameter", "Working Coordinate System:=", _
  "Global")
oEditor.ChangeProperty Array("NAME:AllTabs", Array(_
  "NAME:Geometry3DAttributeTab", Array("NAME:PropServers", "Mag1_2"), Array(_
  "NAME:ChangedProps", Array("NAME:Orientation", "Value:=", "relativeCS1_2"))))
On Error Resume Next
oEditor.ChangeProperty Array("NAME:AllTabs", Array(_
  "NAME:Geometry3DAttributeTab", Array("NAME:PropServers", "Mag1_3"), Array(_
  "NAME:ChangedProps", Array("NAME:Material", "Material:=", _
  "XG196/96_2DSF1.000_X"))))
On Error Goto 0
oEditor.CreateRelativeCS Array("NAME:RelativeCSParameters", _
  "CoordinateSystemID:=", -1, "OriginX:=", "0", "OriginY:=", "0", "OriginZ:=", _
  "0", "XAxisXvec:=", "-0.21682346", "XAxisYvec:=", "-0.97621083", _
  "XAxisZvec:=", "0", "YAxisXvec:=", "0.97621083", "YAxisYvec:=", _
  "-0.21682346", "YAxisZvec:=", "0"), Array("NAME:Attributes", "Name:=", _
  "relativeCS1_3")
oEditor.SetWCS Array("NAME:RSetWCS Parameter", "Working Coordinate System:=", _
  "Global")
oEditor.ChangeProperty Array("NAME:AllTabs", Array(_
  "NAME:Geometry3DAttributeTab", Array("NAME:PropServers", "Mag1_3"), Array(_
  "NAME:ChangedProps", Array("NAME:Orientation", "Value:=", "relativeCS1_3"))))
On Error Resume Next
oEditor.ChangeProperty Array("NAME:AllTabs", Array(_
  "NAME:Geometry3DAttributeTab", Array("NAME:PropServers", "Mag1_4"), Array(_
  "NAME:ChangedProps", Array("NAME:Material", "Material:=", _
  "XG196/96_2DSF1.000_X"))))
On Error Goto 0
oEditor.CreateRelativeCS Array("NAME:RelativeCSParameters", _
  "CoordinateSystemID:=", -1, "OriginX:=", "0", "OriginY:=", "0", "OriginZ:=", _
  "0", "XAxisXvec:=", "-0.39838847", "XAxisYvec:=", "0.91721678", _
  "XAxisZvec:=", "0", "YAxisXvec:=", "-0.91721678", "YAxisYvec:=", _
  "-0.39838847", "YAxisZvec:=", "0"), Array("NAME:Attributes", "Name:=", _
  "relativeCS1_4")
oEditor.SetWCS Array("NAME:RSetWCS Parameter", "Working Coordinate System:=", _
  "Global")
oEditor.ChangeProperty Array("NAME:AllTabs", Array(_
  "NAME:Geometry3DAttributeTab", Array("NAME:PropServers", "Mag1_4"), Array(_
  "NAME:ChangedProps", Array("NAME:Orientation", "Value:=", "relativeCS1_4"))))
On Error Resume Next
oEditor.ChangeProperty Array("NAME:AllTabs", Array(_
  "NAME:Geometry3DAttributeTab", Array("NAME:PropServers", "Mag1_5"), Array(_
  "NAME:ChangedProps", Array("NAME:Material", "Material:=", _
  "XG196/96_2DSF1.000_X"))))
On Error Goto 0
oEditor.CreateRelativeCS Array("NAME:RelativeCSParameters", _
  "CoordinateSystemID:=", -1, "OriginX:=", "0", "OriginY:=", "0", "OriginZ:=", _
  "0", "XAxisXvec:=", "0.86142954", "XAxisYvec:=", "-0.5078771", _
  "XAxisZvec:=", "0", "YAxisXvec:=", "0.5078771", "YAxisYvec:=", "0.86142954", _
  "YAxisZvec:=", "0"), Array("NAME:Attributes", "Name:=", "relativeCS1_5")
oEditor.SetWCS Array("NAME:RSetWCS Parameter", "Working Coordinate System:=", _
  "Global")
oEditor.ChangeProperty Array("NAME:AllTabs", Array(_
  "NAME:Geometry3DAttributeTab", Array("NAME:PropServers", "Mag1_5"), Array(_
  "NAME:ChangedProps", Array("NAME:Orientation", "Value:=", "relativeCS1_5"))))
On Error Resume Next
oEditor.ChangeProperty Array("NAME:AllTabs", Array(_
  "NAME:Geometry3DAttributeTab", Array("NAME:PropServers", "Mag1_6"), Array(_
  "NAME:ChangedProps", Array("NAME:Material", "Material:=", _
  "XG196/96_2DSF1.000_X"))))
On Error Goto 0
oEditor.CreateRelativeCS Array("NAME:RelativeCSParameters", _
  "CoordinateSystemID:=", -1, "OriginX:=", "0", "OriginY:=", "0", "OriginZ:=", _
  "0", "XAxisXvec:=", "-0.99543381", "XAxisYvec:=", "-0.095454373", _
  "XAxisZvec:=", "0", "YAxisXvec:=", "0.095454373", "YAxisYvec:=", _
  "-0.99543381", "YAxisZvec:=", "0"), Array("NAME:Attributes", "Name:=", _
  "relativeCS1_6")
oEditor.SetWCS Array("NAME:RSetWCS Parameter", "Working Coordinate System:=", _
  "Global")
oEditor.ChangeProperty Array("NAME:AllTabs", Array(_
  "NAME:Geometry3DAttributeTab", Array("NAME:PropServers", "Mag1_6"), Array(_
  "NAME:ChangedProps", Array("NAME:Orientation", "Value:=", "relativeCS1_6"))))
On Error Resume Next
oEditor.ChangeProperty Array("NAME:AllTabs", Array(_
  "NAME:Geometry3DAttributeTab", Array("NAME:PropServers", "Mag1_7"), Array(_
  "NAME:ChangedProps", Array("NAME:Material", "Material:=", _
  "XG196/96_2DSF1.000_X"))))
On Error Goto 0
oEditor.CreateRelativeCS Array("NAME:RelativeCSParameters", _
  "CoordinateSystemID:=", -1, "OriginX:=", "0", "OriginY:=", "0", "OriginZ:=", _
  "0", "XAxisXvec:=", "0.74921619", "XAxisYvec:=", "0.66232552", _
  "XAxisZvec:=", "0", "YAxisXvec:=", "-0.66232552", "YAxisYvec:=", _
  "0.74921619", "YAxisZvec:=", "0"), Array("NAME:Attributes", "Name:=", _
  "relativeCS1_7")
oEditor.SetWCS Array("NAME:RSetWCS Parameter", "Working Coordinate System:=", _
  "Global")
oEditor.ChangeProperty Array("NAME:AllTabs", Array(_
  "NAME:Geometry3DAttributeTab", Array("NAME:PropServers", "Mag1_7"), Array(_
  "NAME:ChangedProps", Array("NAME:Orientation", "Value:=", "relativeCS1_7"))))
On Error Resume Next
oEditor.ChangeProperty Array("NAME:AllTabs", Array(_
  "NAME:Geometry3DAttributeTab", Array("NAME:PropServers", "Mag1_8"), Array(_
  "NAME:ChangedProps", Array("NAME:Material", "Material:=", _
  "XG196/96_2DSF1.000_X"))))
On Error Goto 0
oEditor.CreateRelativeCS Array("NAME:RelativeCSParameters", _
  "CoordinateSystemID:=", -1, "OriginX:=", "0", "OriginY:=", "0", "OriginZ:=", _
  "0", "XAxisXvec:=", "-0.21682346", "XAxisYvec:=", "-0.97621083", _
  "XAxisZvec:=", "0", "YAxisXvec:=", "0.97621083", "YAxisYvec:=", _
  "-0.21682346", "YAxisZvec:=", "0"), Array("NAME:Attributes", "Name:=", _
  "relativeCS1_8")
oEditor.SetWCS Array("NAME:RSetWCS Parameter", "Working Coordinate System:=", _
  "Global")
oEditor.ChangeProperty Array("NAME:AllTabs", Array(_
  "NAME:Geometry3DAttributeTab", Array("NAME:PropServers", "Mag1_8"), Array(_
  "NAME:ChangedProps", Array("NAME:Orientation", "Value:=", "relativeCS1_8"))))
On Error Resume Next
oEditor.ChangeProperty Array("NAME:AllTabs", Array(_
  "NAME:Geometry3DAttributeTab", Array("NAME:PropServers", "Mag1_9"), Array(_
  "NAME:ChangedProps", Array("NAME:Material", "Material:=", _
  "XG196/96_2DSF1.000_X"))))
On Error Goto 0
oEditor.CreateRelativeCS Array("NAME:RelativeCSParameters", _
  "CoordinateSystemID:=", -1, "OriginX:=", "0", "OriginY:=", "0", "OriginZ:=", _
  "0", "XAxisXvec:=", "-0.39838847", "XAxisYvec:=", "0.91721678", _
  "XAxisZvec:=", "0", "YAxisXvec:=", "-0.91721678", "YAxisYvec:=", _
  "-0.39838847", "YAxisZvec:=", "0"), Array("NAME:Attributes", "Name:=", _
  "relativeCS1_9")
oEditor.SetWCS Array("NAME:RSetWCS Parameter", "Working Coordinate System:=", _
  "Global")
oEditor.ChangeProperty Array("NAME:AllTabs", Array(_
  "NAME:Geometry3DAttributeTab", Array("NAME:PropServers", "Mag1_9"), Array(_
  "NAME:ChangedProps", Array("NAME:Orientation", "Value:=", "relativeCS1_9"))))
oEditor.CreateUserDefinedPart Array("NAME:UserDefinedPrimitiveParameters", _
  "DllName:=", "RMxprt/IPMCore", "Version:=", "19.0", "NoOfParameters:=", 16, _
  "Library:=", "syslib", Array("NAME:ParamVector", Array("NAME:Pair", _
  "Name:=", "DiaGap", "Value:=", "74mm"), Array("NAME:Pair", "Name:=", _
  "DiaYoke", "Value:=", "26mm"), Array("NAME:Pair", "Name:=", "Length", _
  "Value:=", "0mm"), Array("NAME:Pair", "Name:=", "Poles", "Value:=", "10"), _
  Array("NAME:Pair", "Name:=", "PoleType", "Value:=", "3"), Array("NAME:Pair", _
  "Name:=", "D1", "Value:=", "72mm"), Array("NAME:Pair", "Name:=", "O1", _
  "Value:=", "1mm"), Array("NAME:Pair", "Name:=", "O2", "Value:=", "10mm"), _
  Array("NAME:Pair", "Name:=", "B1", "Value:=", "2mm"), Array("NAME:Pair", _
  "Name:=", "Rib", "Value:=", "2mm"), Array("NAME:Pair", "Name:=", "HRib", _
  "Value:=", "1mm"), Array("NAME:Pair", "Name:=", "DminMag", "Value:=", "0mm"), _
  Array("NAME:Pair", "Name:=", "ThickMag", "Value:=", "3mm"), Array(_
  "NAME:Pair", "Name:=", "WidthMag", "Value:=", "20mm"), Array("NAME:Pair", _
  "Name:=", "LenRegion", "Value:=", "0mm"), Array("NAME:Pair", "Name:=", _
  "InfoCore", "Value:=", "-2"))), Array("NAME:Attributes", "Name:=", "Mag2", _
  "Flags:=", "", "Color:=", "(0 255 128)", "Transparency:=", 0, _
  "PartCoordinateSystem:=", "Global", "MaterialName:=", _
  "XG196/96_2DSF1.000_X", "SolveInside:=", true) 
oEditor.Rotate Array("NAME:Selections", "Selections:=", "Mag2"), Array(_
  "NAME:RotateParameters", "CoordinateSystemID:=", -1, "RotateAxis:=", "Z", _
  "RotateAngle:=", "18deg")
oEditor.DuplicateAroundAxis Array("NAME:Selections", "Selections:=", "Mag2"), _
  Array("NAME:DuplicateAroundAxisParameters", "CoordinateSystemID:=", -1, _
  "CreateNewObjects:=", true, "WhichAxis:=", "Z", "AngleStr:=", "36deg", _
  "NumClones:=", "10"), Array("NAME:Options", "DuplicateBoundaries:=", false)
oEditor.ChangeProperty Array("NAME:AllTabs", Array(_
  "NAME:Geometry3DAttributeTab", Array("NAME:PropServers", "Mag2"), Array(_
  "NAME:ChangedProps", Array("NAME:Name", "Value:=", "Mag2_0"))))
On Error Resume Next
oEditor.ChangeProperty Array("NAME:AllTabs", Array(_
  "NAME:Geometry3DAttributeTab", Array("NAME:PropServers", "Mag2_0"), Array(_
  "NAME:ChangedProps", Array("NAME:Material", "Material:=", _
  "XG196/96_2DSF1.000_X"))))
On Error Goto 0
oEditor.CreateRelativeCS Array("NAME:RelativeCSParameters", _
  "CoordinateSystemID:=", -1, "OriginX:=", "0", "OriginY:=", "0", "OriginZ:=", _
  "0", "XAxisXvec:=", "0.39838847", "XAxisYvec:=", "0.91721678", _
  "XAxisZvec:=", "0", "YAxisXvec:=", "-0.91721678", "YAxisYvec:=", _
  "0.39838847", "YAxisZvec:=", "0"), Array("NAME:Attributes", "Name:=", _
  "relativeCS2_0")
oEditor.SetWCS Array("NAME:RSetWCS Parameter", "Working Coordinate System:=", _
  "Global")
oEditor.ChangeProperty Array("NAME:AllTabs", Array(_
  "NAME:Geometry3DAttributeTab", Array("NAME:PropServers", "Mag2_0"), Array(_
  "NAME:ChangedProps", Array("NAME:Orientation", "Value:=", "relativeCS2_0"))))
On Error Resume Next
oEditor.ChangeProperty Array("NAME:AllTabs", Array(_
  "NAME:Geometry3DAttributeTab", Array("NAME:PropServers", "Mag2_1"), Array(_
  "NAME:ChangedProps", Array("NAME:Material", "Material:=", _
  "XG196/96_2DSF1.000_X"))))
On Error Goto 0
oEditor.CreateRelativeCS Array("NAME:RelativeCSParameters", _
  "CoordinateSystemID:=", -1, "OriginX:=", "0", "OriginY:=", "0", "OriginZ:=", _
  "0", "XAxisXvec:=", "0.21682346", "XAxisYvec:=", "-0.97621083", _
  "XAxisZvec:=", "0", "YAxisXvec:=", "0.97621083", "YAxisYvec:=", _
  "0.21682346", "YAxisZvec:=", "0"), Array("NAME:Attributes", "Name:=", _
  "relativeCS2_1")
oEditor.SetWCS Array("NAME:RSetWCS Parameter", "Working Coordinate System:=", _
  "Global")
oEditor.ChangeProperty Array("NAME:AllTabs", Array(_
  "NAME:Geometry3DAttributeTab", Array("NAME:PropServers", "Mag2_1"), Array(_
  "NAME:ChangedProps", Array("NAME:Orientation", "Value:=", "relativeCS2_1"))))
On Error Resume Next
oEditor.ChangeProperty Array("NAME:AllTabs", Array(_
  "NAME:Geometry3DAttributeTab", Array("NAME:PropServers", "Mag2_2"), Array(_
  "NAME:ChangedProps", Array("NAME:Material", "Material:=", _
  "XG196/96_2DSF1.000_X"))))
On Error Goto 0
oEditor.CreateRelativeCS Array("NAME:RelativeCSParameters", _
  "CoordinateSystemID:=", -1, "OriginX:=", "0", "OriginY:=", "0", "OriginZ:=", _
  "0", "XAxisXvec:=", "-0.74921619", "XAxisYvec:=", "0.66232552", _
  "XAxisZvec:=", "0", "YAxisXvec:=", "-0.66232552", "YAxisYvec:=", _
  "-0.74921619", "YAxisZvec:=", "0"), Array("NAME:Attributes", "Name:=", _
  "relativeCS2_2")
oEditor.SetWCS Array("NAME:RSetWCS Parameter", "Working Coordinate System:=", _
  "Global")
oEditor.ChangeProperty Array("NAME:AllTabs", Array(_
  "NAME:Geometry3DAttributeTab", Array("NAME:PropServers", "Mag2_2"), Array(_
  "NAME:ChangedProps", Array("NAME:Orientation", "Value:=", "relativeCS2_2"))))
On Error Resume Next
oEditor.ChangeProperty Array("NAME:AllTabs", Array(_
  "NAME:Geometry3DAttributeTab", Array("NAME:PropServers", "Mag2_3"), Array(_
  "NAME:ChangedProps", Array("NAME:Material", "Material:=", _
  "XG196/96_2DSF1.000_X"))))
On Error Goto 0
oEditor.CreateRelativeCS Array("NAME:RelativeCSParameters", _
  "CoordinateSystemID:=", -1, "OriginX:=", "0", "OriginY:=", "0", "OriginZ:=", _
  "0", "XAxisXvec:=", "0.99543381", "XAxisYvec:=", "-0.095454373", _
  "XAxisZvec:=", "0", "YAxisXvec:=", "0.095454373", "YAxisYvec:=", _
  "0.99543381", "YAxisZvec:=", "0"), Array("NAME:Attributes", "Name:=", _
  "relativeCS2_3")
oEditor.SetWCS Array("NAME:RSetWCS Parameter", "Working Coordinate System:=", _
  "Global")
oEditor.ChangeProperty Array("NAME:AllTabs", Array(_
  "NAME:Geometry3DAttributeTab", Array("NAME:PropServers", "Mag2_3"), Array(_
  "NAME:ChangedProps", Array("NAME:Orientation", "Value:=", "relativeCS2_3"))))
On Error Resume Next
oEditor.ChangeProperty Array("NAME:AllTabs", Array(_
  "NAME:Geometry3DAttributeTab", Array("NAME:PropServers", "Mag2_4"), Array(_
  "NAME:ChangedProps", Array("NAME:Material", "Material:=", _
  "XG196/96_2DSF1.000_X"))))
On Error Goto 0
oEditor.CreateRelativeCS Array("NAME:RelativeCSParameters", _
  "CoordinateSystemID:=", -1, "OriginX:=", "0", "OriginY:=", "0", "OriginZ:=", _
  "0", "XAxisXvec:=", "-0.86142954", "XAxisYvec:=", "-0.5078771", _
  "XAxisZvec:=", "0", "YAxisXvec:=", "0.5078771", "YAxisYvec:=", _
  "-0.86142954", "YAxisZvec:=", "0"), Array("NAME:Attributes", "Name:=", _
  "relativeCS2_4")
oEditor.SetWCS Array("NAME:RSetWCS Parameter", "Working Coordinate System:=", _
  "Global")
oEditor.ChangeProperty Array("NAME:AllTabs", Array(_
  "NAME:Geometry3DAttributeTab", Array("NAME:PropServers", "Mag2_4"), Array(_
  "NAME:ChangedProps", Array("NAME:Orientation", "Value:=", "relativeCS2_4"))))
On Error Resume Next
oEditor.ChangeProperty Array("NAME:AllTabs", Array(_
  "NAME:Geometry3DAttributeTab", Array("NAME:PropServers", "Mag2_5"), Array(_
  "NAME:ChangedProps", Array("NAME:Material", "Material:=", _
  "XG196/96_2DSF1.000_X"))))
On Error Goto 0
oEditor.CreateRelativeCS Array("NAME:RelativeCSParameters", _
  "CoordinateSystemID:=", -1, "OriginX:=", "0", "OriginY:=", "0", "OriginZ:=", _
  "0", "XAxisXvec:=", "0.39838847", "XAxisYvec:=", "0.91721678", _
  "XAxisZvec:=", "0", "YAxisXvec:=", "-0.91721678", "YAxisYvec:=", _
  "0.39838847", "YAxisZvec:=", "0"), Array("NAME:Attributes", "Name:=", _
  "relativeCS2_5")
oEditor.SetWCS Array("NAME:RSetWCS Parameter", "Working Coordinate System:=", _
  "Global")
oEditor.ChangeProperty Array("NAME:AllTabs", Array(_
  "NAME:Geometry3DAttributeTab", Array("NAME:PropServers", "Mag2_5"), Array(_
  "NAME:ChangedProps", Array("NAME:Orientation", "Value:=", "relativeCS2_5"))))
On Error Resume Next
oEditor.ChangeProperty Array("NAME:AllTabs", Array(_
  "NAME:Geometry3DAttributeTab", Array("NAME:PropServers", "Mag2_6"), Array(_
  "NAME:ChangedProps", Array("NAME:Material", "Material:=", _
  "XG196/96_2DSF1.000_X"))))
On Error Goto 0
oEditor.CreateRelativeCS Array("NAME:RelativeCSParameters", _
  "CoordinateSystemID:=", -1, "OriginX:=", "0", "OriginY:=", "0", "OriginZ:=", _
  "0", "XAxisXvec:=", "0.21682346", "XAxisYvec:=", "-0.97621083", _
  "XAxisZvec:=", "0", "YAxisXvec:=", "0.97621083", "YAxisYvec:=", _
  "0.21682346", "YAxisZvec:=", "0"), Array("NAME:Attributes", "Name:=", _
  "relativeCS2_6")
oEditor.SetWCS Array("NAME:RSetWCS Parameter", "Working Coordinate System:=", _
  "Global")
oEditor.ChangeProperty Array("NAME:AllTabs", Array(_
  "NAME:Geometry3DAttributeTab", Array("NAME:PropServers", "Mag2_6"), Array(_
  "NAME:ChangedProps", Array("NAME:Orientation", "Value:=", "relativeCS2_6"))))
On Error Resume Next
oEditor.ChangeProperty Array("NAME:AllTabs", Array(_
  "NAME:Geometry3DAttributeTab", Array("NAME:PropServers", "Mag2_7"), Array(_
  "NAME:ChangedProps", Array("NAME:Material", "Material:=", _
  "XG196/96_2DSF1.000_X"))))
On Error Goto 0
oEditor.CreateRelativeCS Array("NAME:RelativeCSParameters", _
  "CoordinateSystemID:=", -1, "OriginX:=", "0", "OriginY:=", "0", "OriginZ:=", _
  "0", "XAxisXvec:=", "-0.74921619", "XAxisYvec:=", "0.66232552", _
  "XAxisZvec:=", "0", "YAxisXvec:=", "-0.66232552", "YAxisYvec:=", _
  "-0.74921619", "YAxisZvec:=", "0"), Array("NAME:Attributes", "Name:=", _
  "relativeCS2_7")
oEditor.SetWCS Array("NAME:RSetWCS Parameter", "Working Coordinate System:=", _
  "Global")
oEditor.ChangeProperty Array("NAME:AllTabs", Array(_
  "NAME:Geometry3DAttributeTab", Array("NAME:PropServers", "Mag2_7"), Array(_
  "NAME:ChangedProps", Array("NAME:Orientation", "Value:=", "relativeCS2_7"))))
On Error Resume Next
oEditor.ChangeProperty Array("NAME:AllTabs", Array(_
  "NAME:Geometry3DAttributeTab", Array("NAME:PropServers", "Mag2_8"), Array(_
  "NAME:ChangedProps", Array("NAME:Material", "Material:=", _
  "XG196/96_2DSF1.000_X"))))
On Error Goto 0
oEditor.CreateRelativeCS Array("NAME:RelativeCSParameters", _
  "CoordinateSystemID:=", -1, "OriginX:=", "0", "OriginY:=", "0", "OriginZ:=", _
  "0", "XAxisXvec:=", "0.99543381", "XAxisYvec:=", "-0.095454373", _
  "XAxisZvec:=", "0", "YAxisXvec:=", "0.095454373", "YAxisYvec:=", _
  "0.99543381", "YAxisZvec:=", "0"), Array("NAME:Attributes", "Name:=", _
  "relativeCS2_8")
oEditor.SetWCS Array("NAME:RSetWCS Parameter", "Working Coordinate System:=", _
  "Global")
oEditor.ChangeProperty Array("NAME:AllTabs", Array(_
  "NAME:Geometry3DAttributeTab", Array("NAME:PropServers", "Mag2_8"), Array(_
  "NAME:ChangedProps", Array("NAME:Orientation", "Value:=", "relativeCS2_8"))))
On Error Resume Next
oEditor.ChangeProperty Array("NAME:AllTabs", Array(_
  "NAME:Geometry3DAttributeTab", Array("NAME:PropServers", "Mag2_9"), Array(_
  "NAME:ChangedProps", Array("NAME:Material", "Material:=", _
  "XG196/96_2DSF1.000_X"))))
On Error Goto 0
oEditor.CreateRelativeCS Array("NAME:RelativeCSParameters", _
  "CoordinateSystemID:=", -1, "OriginX:=", "0", "OriginY:=", "0", "OriginZ:=", _
  "0", "XAxisXvec:=", "-0.86142954", "XAxisYvec:=", "-0.5078771", _
  "XAxisZvec:=", "0", "YAxisXvec:=", "0.5078771", "YAxisYvec:=", _
  "-0.86142954", "YAxisZvec:=", "0"), Array("NAME:Attributes", "Name:=", _
  "relativeCS2_9")
oEditor.SetWCS Array("NAME:RSetWCS Parameter", "Working Coordinate System:=", _
  "Global")
oEditor.ChangeProperty Array("NAME:AllTabs", Array(_
  "NAME:Geometry3DAttributeTab", Array("NAME:PropServers", "Mag2_9"), Array(_
  "NAME:ChangedProps", Array("NAME:Orientation", "Value:=", "relativeCS2_9"))))
On Error Resume Next
Set oModule = oDesign.GetModule("MeshSetup")
oModule.AssignTrueSurfOp Array("NAME:SurfApprox_Mag", "Objects:=", Array(_
  "Mag1_0", "Mag1_1", "Mag1_2", "Mag1_3", "Mag1_4", "Mag1_5", "Mag1_6", _
  "Mag1_7", "Mag1_8", "Mag1_9", "Mag2_0", "Mag2_1", "Mag2_2", "Mag2_3", _
  "Mag2_4", "Mag2_5", "Mag2_6", "Mag2_7", "Mag2_8", "Mag2_9"), _
  "SurfDevChoice:=", 2, "SurfDev:=", "0.037mm", "NormalDevChoice:=", 2, _
  "NormalDev:=", "15deg", "AspectRatioChoice:=", 1)
Set oModule = oDesign.GetModule("MeshSetup")
oModule.ReassignOp "SurfApprox_Mag", Array("Objects:=", Array("Mag1_0", _
  "Mag1_1", "Mag1_2", "Mag1_3", "Mag1_4", "Mag1_5", "Mag1_6", "Mag1_7", _
  "Mag1_8", "Mag1_9", "Mag2_0", "Mag2_1", "Mag2_2", "Mag2_3", "Mag2_4", _
  "Mag2_5", "Mag2_6", "Mag2_7", "Mag2_8", "Mag2_9"))
On Error Goto 0
oEditor.CreateUserDefinedPart Array("NAME:UserDefinedPrimitiveParameters", _
  "DllName:=", "RMxprt/IPMCore", "Version:=", "19.0", "NoOfParameters:=", 16, _
  "Library:=", "syslib", Array("NAME:ParamVector", Array("NAME:Pair", _
  "Name:=", "DiaGap", "Value:=", "74mm"), Array("NAME:Pair", "Name:=", _
  "DiaYoke", "Value:=", "26mm"), Array("NAME:Pair", "Name:=", "Length", _
  "Value:=", "0mm"), Array("NAME:Pair", "Name:=", "Poles", "Value:=", "10"), _
  Array("NAME:Pair", "Name:=", "PoleType", "Value:=", "3"), Array("NAME:Pair", _
  "Name:=", "D1", "Value:=", "72mm"), Array("NAME:Pair", "Name:=", "O1", _
  "Value:=", "1mm"), Array("NAME:Pair", "Name:=", "O2", "Value:=", "10mm"), _
  Array("NAME:Pair", "Name:=", "B1", "Value:=", "2mm"), Array("NAME:Pair", _
  "Name:=", "Rib", "Value:=", "2mm"), Array("NAME:Pair", "Name:=", "HRib", _
  "Value:=", "1mm"), Array("NAME:Pair", "Name:=", "DminMag", "Value:=", "0mm"), _
  Array("NAME:Pair", "Name:=", "ThickMag", "Value:=", "3mm"), Array(_
  "NAME:Pair", "Name:=", "WidthMag", "Value:=", "20mm"), Array("NAME:Pair", _
  "Name:=", "LenRegion", "Value:=", "0mm"), Array("NAME:Pair", "Name:=", _
  "InfoCore", "Value:=", "100"))), Array("NAME:Attributes", "Name:=", _
  "InnerRegion", "Flags:=", "", "Color:=", "(0 255 255)", "Transparency:=", 0, _
  "PartCoordinateSystem:=", "Global", "MaterialName:=", "vacuum", _
  "SolveInside:=", true) 
oEditor.Rotate Array("NAME:Selections", "Selections:=", "InnerRegion"), Array(_
  "NAME:RotateParameters", "CoordinateSystemID:=", -1, "RotateAxis:=", "Z", _
  "RotateAngle:=", "18deg")
On Error Resume Next
Set oModule = oDesign.GetModule("MeshSetup")
oModule.AssignTrueSurfOp Array("NAME:SurfApprox_Main", "Objects:=", Array(_
  "Stator", "Rotor", "Band", "OuterRegion", "InnerRegion", "Shaft"), _
  "SurfDevChoice:=", 2, "SurfDev:=", "0.06mm", "NormalDevChoice:=", 2, _
  "NormalDev:=", "15deg", "AspectRatioChoice:=", 1)
Set oModule = oDesign.GetModule("MeshSetup")
oModule.ReassignOp "SurfApprox_Main", Array("Objects:=", Array("Stator", _
  "Rotor", "Band", "OuterRegion", "InnerRegion", "Shaft"))
On Error Goto 0
oEditor.ChangeProperty Array("NAME:AllTabs", Array(_
  "NAME:Geometry3DAttributeTab", Array("NAME:PropServers", "Band", _
  "OuterRegion", "InnerRegion"), Array("NAME:ChangedProps", Array(_
  "NAME:Transparent", "Value:=", 0.75))))
oEditor.Subtract Array("NAME:Selections", "Blank Parts:=", "Band,InnerRegion" & _
  ",Shaft,Stator,Coil_0,Coil_1,Coil_2,Coil_3,Coil_4,Coil_5,Coil_6,Coil_7" & _
  ",Coil_8,Coil_9,Coil_10,Coil_11,Rotor,Mag1_0,Mag1_1,Mag1_2,Mag1_3,Mag1_4" & _
  ",Mag1_5,Mag1_6,Mag1_7,Mag1_8,Mag1_9,Mag2_0,Mag2_1,Mag2_2,Mag2_3,Mag2_4" & _
  ",Mag2_5,Mag2_6,Mag2_7,Mag2_8,Mag2_9", "Tool Parts:=", tool(0)), Array(_
  "NAME:SubtractParameters", "CoordinateSystemID:=", -1, "KeepOriginals:=", _
  false)
oEditor.FitAll
Set oModule = oDesign.GetModule("ModelSetup")
oModule.AssignBand Array("NAME:MotionSetup1", "Move Type:=", "Rotate", _
  "Coordinate System:=", "Global", "Axis:=", "Z", "Is Positive:=", true, _
  "InitPos:=", "18deg", "HasRotateLimit:=", false, "NonCylindrical:=", _
  false, "Consider Mechanical Transient:=", true, "Angular Velocity:=", _
  "3600rpm", "Moment of Inertia:=", 0.0014415584, "Damping:=", 0, _
  "Load Torque:=", "if(speed<339.292, -4.77766e-06*speed, -0.55/speed)", _
  "Objects:=", Array("Band"))
oModule.EditMotionSetup "MotionSetup1", Array("NAME:Data", _
  "Consider Mechanical Transient:=", false)
Set oModule = oDesign.GetModule("ReportSetup")
oModule.CreateReport "Torque", "Transient", "XY Plot", "Setup1 : Transient", _
  Array(), Array("Time:=", Array("All")), Array("X Component:=", "Time", _
  "Y Component:=", Array("Moving1.Torque")), Array()
oEditor.ShowWindow
Set oModule = oDesign.GetModule("OutputVariable")
oModule.CreateOutputVariable "pos", "(Moving1.Position -18 * PI/180) * 5 + PI", _
  "Setup1 : Transient", "Transient", Array() 
oModule.CreateOutputVariable "cos0", "cos(pos)", "Setup1 : Transient", _
  "Transient", Array() 
oModule.CreateOutputVariable "cos1", "cos(pos-2*PI/3)", "Setup1 : Transient", _
  "Transient", Array() 
oModule.CreateOutputVariable "cos2", "cos(pos-4*PI/3)", "Setup1 : Transient", _
  "Transient", Array() 
oModule.CreateOutputVariable "sin0", "sin(pos)", "Setup1 : Transient", _
  "Transient", Array() 
oModule.CreateOutputVariable "sin1", "sin(pos-2*PI/3)", "Setup1 : Transient", _
  "Transient", Array() 
oModule.CreateOutputVariable "sin2", "sin(pos-4*PI/3)", "Setup1 : Transient", _
  "Transient", Array() 
oModule.CreateOutputVariable "Lad", _
  "L(PhaseA,PhaseA)*cos0 + L(PhaseA,PhaseB)*cos1 + L(PhaseA,PhaseC)*cos2", _
  "Setup1 : Transient", "Transient", Array() 
oModule.CreateOutputVariable "Laq", _
  "L(PhaseA,PhaseA)*sin0 + L(PhaseA,PhaseB)*sin1 + L(PhaseA,PhaseC)*sin2", _
  "Setup1 : Transient", "Transient", Array() 
oModule.CreateOutputVariable "Lbd", _
  "L(PhaseB,PhaseA)*cos0 + L(PhaseB,PhaseB)*cos1 + L(PhaseB,PhaseC)*cos2", _
  "Setup1 : Transient", "Transient", Array() 
oModule.CreateOutputVariable "Lbq", _
  "L(PhaseB,PhaseA)*sin0 + L(PhaseB,PhaseB)*sin1 + L(PhaseB,PhaseC)*sin2", _
  "Setup1 : Transient", "Transient", Array() 
oModule.CreateOutputVariable "Lcd", _
  "L(PhaseC,PhaseA)*cos0 + L(PhaseC,PhaseB)*cos1 + L(PhaseC,PhaseC)*cos2", _
  "Setup1 : Transient", "Transient", Array() 
oModule.CreateOutputVariable "Lcq", _
  "L(PhaseC,PhaseA)*sin0 + L(PhaseC,PhaseB)*sin1 + L(PhaseC,PhaseC)*sin2", _
  "Setup1 : Transient", "Transient", Array() 
oModule.CreateOutputVariable "L_d", "(Lad*cos0 + Lbd*cos1 + Lcd*cos2) * 2/3", _
  "Setup1 : Transient", "Transient", Array() 
oModule.CreateOutputVariable "L_q", "(Laq*sin0 + Lbq*sin1 + Lcq*sin2) * 2/3", _
  "Setup1 : Transient", "Transient", Array() 
oModule.CreateOutputVariable "Flux_d", _
  "(FluxLinkage(PhaseA)*cos0+FluxLinkage(PhaseB)*cos1+FluxLinkage(PhaseC)*cos2)*2/3", _
  "Setup1 : Transient", "Transient", Array() 
oModule.CreateOutputVariable "Flux_q", _
  "(FluxLinkage(PhaseA)*sin0+FluxLinkage(PhaseB)*sin1+FluxLinkage(PhaseC)*sin2)*2/3", _
  "Setup1 : Transient", "Transient", Array() 
oModule.CreateOutputVariable "I_d", _
  "(Current(PhaseA)*cos0 + Current(PhaseB)*cos1 + Current(PhaseC)*cos2)*2/3", _
  "Setup1 : Transient", "Transient", Array() 
oModule.CreateOutputVariable "I_q", _
  "(Current(PhaseA)*sin0 + Current(PhaseB)*sin1 + Current(PhaseC)*sin2)*2/3", _
  "Setup1 : Transient", "Transient", Array() 
oModule.CreateOutputVariable "Irms", "sqrt(I_d^2+I_q^2)/sqrt(2)", _
  "Setup1 : Transient", "Transient", Array() 
oModule.CreateOutputVariable "Pcu", "3*Irms^2*R1", "Setup1 : Transient", _
  "Transient", Array() 
Set oModule = oDesign.GetModule("ReportSetup")
oModule.CreateReport "L_dq", "Transient", "XY Plot", "Setup1 : Transient", _
  Array(), Array("Time:=", Array("All")), Array("X Component:=", "Time", _
  "Y Component:=", Array("L_d", "L_q")), Array()
oModule.CreateReport "Flux_dq", "Transient", "XY Plot", "Setup1 : Transient", _
  Array(), Array("Time:=", Array("All")), Array("X Component:=", "Time", _
  "Y Component:=", Array("Flux_d", "Flux_q")), Array()
oModule.CreateReport "I_dq", "Transient", "XY Plot", "Setup1 : Transient", _
  Array(), Array("Time:=", Array("All")), Array("X Component:=", "Time", _
  "Y Component:=", Array("I_d", "I_q")), Array()
oDesign.SetDesignSettings Array("NAME:Design Settings Data", _
  "ComputeTransientInductance:=", true, "ComputeIncrementalMatrix:=", false)
oEditor.ShowWindow
Set oModule = oDesign.GetModule("AnalysisSetup")
oModule.EditSetup "Setup1", Array("NAME:Setup1", "StopTime:=", "0.033333333s")
