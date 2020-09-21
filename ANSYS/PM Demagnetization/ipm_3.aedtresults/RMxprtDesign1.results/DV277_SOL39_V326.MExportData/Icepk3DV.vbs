' ----------------------------------------------------------------------
' Script Created by RMxprt to generate Maxwell 3D Version 2016.0 design 
' Can specify one arg to setup external circuit                         
' ----------------------------------------------------------------------

On Error Resume Next
Set oAnsoftApp = CreateObject("AnsoftMaxwell.MaxwellScriptInterface")
On Error Goto 0
Set oDesktop = oAnsoftApp.GetAppDesktop()
Set oArgs = AnsoftScript.arguments
oDesktop.RestoreWindow
Set oProject = oDesktop.GetActiveProject()
if (oArgs.Count > 0) then 
  Set oDesign = oProject.GetDesign(oArgs(0))
else
  Set oDesign = oProject.GetActiveDesign()
end if
designName = oDesign.GetName
Set oEditor = oDesign.SetActiveEditor("3D Modeler")
oEditor.SetModelUnits Array("NAME:Units Parameter", "Units:=", "mm", _
  "Rescale:=", false)
oDesign.SetSolutionType "Transient"
Set oModule = oDesign.GetModule("BoundarySetup")
oEditor.SetModelValidationSettings Array("NAME:Validation Options", _
  "EntityCheckLevel:=", "Strict", "IgnoreUnclassifiedObjects:=", true)
oDesign.SetDesignSettings Array("NAME:Design Settings Data", _
  "InsulatorThreshold:=", 2500000)
On Error Resume Next
oDesign.ChangeProperty Array("NAME:AllTabs", Array("NAME:LocalVariableTab", _
  Array("NAME:PropServers", "LocalVariables"), Array("NAME:NewProps", Array(_
  "NAME:fractions", "PropType:=", "VariableProp", "UserDef:=", true, _
  "Value:=", "1"))))
oDesign.ChangeProperty Array("NAME:AllTabs", Array("NAME:LocalVariableTab", _
  Array("NAME:PropServers", "LocalVariables"), Array("NAME:ChangedProps", _
  Array("NAME:fractions", "Value:=", "1"))))
oDesign.ChangeProperty Array("NAME:AllTabs", Array("NAME:LocalVariableTab", _
  Array("NAME:PropServers", "LocalVariables"), Array("NAME:NewProps", Array(_
  "NAME:halfAxial", "PropType:=", "VariableProp", "UserDef:=", true, _
  "Value:=", "0"))))
oDesign.ChangeProperty Array("NAME:AllTabs", Array("NAME:LocalVariableTab", _
  Array("NAME:PropServers", "LocalVariables"), Array("NAME:ChangedProps", _
  Array("NAME:halfAxial", "Value:=", "0"))))
oDesign.ChangeProperty Array("NAME:AllTabs", Array("NAME:LocalVariableTab", _
  Array("NAME:PropServers", "LocalVariables"), Array("NAME:NewProps", Array(_
  "NAME:endRegion", "PropType:=", "VariableProp", "UserDef:=", true, _
  "Value:=", "19.299841663792254mm"))))
oDesign.ChangeProperty Array("NAME:AllTabs", Array("NAME:LocalVariableTab", _
  Array("NAME:PropServers", "LocalVariables"), Array("NAME:ChangedProps", _
  Array("NAME:endRegion", "Value:=", "19.299841663792254mm"))))
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
if (oDefinitionManager.DoesMaterialExist("M19_24G_3DSF0.950")) then
else
oDefinitionManager.AddMaterial Array("NAME:M19_24G_3DSF0.950", _
  "CoordinateSystemType:=", "Cartesian", Array("NAME:AttachedData"), Array(_
  "NAME:ModifierData"), Array("NAME:permeability", "property_type:=", _
  "nonlinear", "HUnit:=", "A_per_meter", "BUnit:=", "tesla", Array(_
  "NAME:BHCoordinates", Array("NAME:Coordinate", "X:=", 0, "Y:=", 0), Array(_
  "NAME:Coordinate", "X:=", 22.28, "Y:=", 0.05), Array("NAME:Coordinate", _
  "X:=", 25.46, "Y:=", 0.1), Array("NAME:Coordinate", "X:=", 31.83, "Y:=", _
  0.15), Array("NAME:Coordinate", "X:=", 47.74, "Y:=", 0.36), Array(_
  "NAME:Coordinate", "X:=", 63.66, "Y:=", 0.54), Array("NAME:Coordinate", _
  "X:=", 79.57, "Y:=", 0.65), Array("NAME:Coordinate", "X:=", 159.15, "Y:=", _
  0.99), Array("NAME:Coordinate", "X:=", 318.3, "Y:=", 1.2), Array(_
  "NAME:Coordinate", "X:=", 477.46, "Y:=", 1.28), Array("NAME:Coordinate", _
  "X:=", 636.61, "Y:=", 1.33), Array("NAME:Coordinate", "X:=", 795.77, "Y:=", _
  1.36), Array("NAME:Coordinate", "X:=", 1591.5, "Y:=", 1.44), Array(_
  "NAME:Coordinate", "X:=", 3183, "Y:=", 1.52), Array("NAME:Coordinate", _
  "X:=", 4774.6, "Y:=", 1.58), Array("NAME:Coordinate", "X:=", 6366.1, "Y:=", _
  1.63), Array("NAME:Coordinate", "X:=", 7957.7, "Y:=", 1.67), Array(_
  "NAME:Coordinate", "X:=", 15915, "Y:=", 1.8), Array("NAME:Coordinate", _
  "X:=", 31830, "Y:=", 1.9), Array("NAME:Coordinate", "X:=", 111407, "Y:=", 2), _
  Array("NAME:Coordinate", "X:=", 190984, "Y:=", 2.1), Array(_
  "NAME:Coordinate", "X:=", 350138, "Y:=", 2.3), Array("NAME:Coordinate", _
  "X:=", 509292, "Y:=", 2.5), Array("NAME:Coordinate", "X:=", 2100832, "Y:=", _
  4.5))), Array("NAME:magnetic_coercivity", "property_type:=", _
  "VectorProperty", "Magnitude:=", "0A_per_meter", "DirComp1:=", "0", _
  "DirComp2:=", "0", "DirComp3:=", "0"), Array("NAME:core_loss_type", _
  "property_type:=", "ChoiceProperty", "Choice:=", "Electrical Steel"), _
  "core_loss_kh:=", 164.2, "core_loss_kc:=", 1.3, "core_loss_ke:=", 1.72, _
  "conductivity:=", 1960000, "mass_density:=", 7650, Array(_
  "NAME:stacking_type", "property_type:=", "ChoiceProperty", "Choice:=", _
  "Lamination"), "stacking_factor:=", "0.95", Array("NAME:stacking_direction", _
  "property_type:=", "ChoiceProperty", "Choice:=", "V(3)"))
end if
if (oDefinitionManager.DoesMaterialExist("XG196/96_3DSF1.000_X")) then
else
oDefinitionManager.AddMaterial Array("NAME:XG196/96_3DSF1.000_X", _
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
  "Value:=", "103.5996833275845mm"), Array("NAME:Pair", "Name:=", "SegAngle", _
  "Value:=", "0deg"), Array("NAME:Pair", "Name:=", "Fractions", "Value:=", _
  "1"), Array("NAME:Pair", "Name:=", "HalfAxial", "Value:=", "0"), Array(_
  "NAME:Pair", "Name:=", "InfoCore", "Value:=", "100"))), Array(_
  "NAME:Attributes", "Name:=", "Shaft", "Flags:=", "", "Color:=", _
  "(0 255 255)", "Transparency:=", 0, "PartCoordinateSystem:=", "Global", _
  "MaterialName:=", "M19_24G_3DSF0.950", "SolveInside:=", true) 
On Error Resume Next
oEditor.SetPropertyValue "Geometry3DCmdTab", "Shaft:CreateUserDefinedPart:1", _
  "Length", "65mm + 2*endRegion"
On Error Goto 0
oEditor.CreateUserDefinedPart Array("NAME:UserDefinedPrimitiveParameters", _
  "DllName:=", "RMxprt/Band", "Version:=", "12.1", "NoOfParameters:=", 7, _
  "Library:=", "syslib", Array("NAME:ParamVector", Array("NAME:Pair", _
  "Name:=", "DiaGap", "Value:=", "74.5mm"), Array("NAME:Pair", "Name:=", _
  "DiaYoke", "Value:=", "120mm"), Array("NAME:Pair", "Name:=", "Length", _
  "Value:=", "103.5996833275845mm"), Array("NAME:Pair", "Name:=", "SegAngle", _
  "Value:=", "0deg"), Array("NAME:Pair", "Name:=", "Fractions", "Value:=", _
  "1"), Array("NAME:Pair", "Name:=", "HalfAxial", "Value:=", "0"), Array(_
  "NAME:Pair", "Name:=", "InfoCore", "Value:=", "100"))), Array(_
  "NAME:Attributes", "Name:=", "OuterRegion", "Flags:=", "", "Color:=", _
  "(0 255 255)", "Transparency:=", 0, "PartCoordinateSystem:=", "Global", _
  "MaterialName:=", "vacuum", "SolveInside:=", true) 
On Error Resume Next
oEditor.SetPropertyValue "Geometry3DCmdTab", _
  "OuterRegion:CreateUserDefinedPart:1", "Length", "65mm + 2*endRegion"
On Error Goto 0
oEditor.SetPropertyValue "Geometry3DCmdTab", _
  "OuterRegion:CreateUserDefinedPart:1", "Fractions", "fractions"
On Error Resume Next
oEditor.SetPropertyValue "Geometry3DCmdTab", _
  "OuterRegion:CreateUserDefinedPart:1", "HalfAxial", "halfAxial"
On Error Goto 0
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
oModule.SetSymmetryMultiplier "fractions*(1+halfAxial)"
Set oModule = oDesign.GetModule("BoundarySetup")
Set oModule = oDesign.GetModule("AnalysisSetup")
oModule.InsertSetup "Transient", Array("NAME:Setup1", "StopTime:=", "0.006s", _
  "TimeStep:=", "3e-05s")
Set oModule = oDesign.GetModule("BoundarySetup")
oModule.SetMinimumTimeStep "0.0003ms" 
oEditor.CreateUserDefinedPart Array("NAME:UserDefinedPrimitiveParameters", _
  "DllName:=", "RMxprt/SlotCore", "Version:=", "12.1", "NoOfParameters:=", 19, _
  "Library:=", "syslib", Array("NAME:ParamVector", Array("NAME:Pair", _
  "Name:=", "DiaGap", "Value:=", "75mm"), Array("NAME:Pair", "Name:=", _
  "DiaYoke", "Value:=", "120mm"), Array("NAME:Pair", "Name:=", "Length", _
  "Value:=", "65mm"), Array("NAME:Pair", "Name:=", "Skew", "Value:=", "0deg"), _
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
  "Value:=", "30deg"), Array("NAME:Pair", "Name:=", "LenRegion", "Value:=", _
  "103.5996833275845mm"), Array("NAME:Pair", "Name:=", "InfoCore", "Value:=", _
  "0"))), Array("NAME:Attributes", "Name:=", "Stator", "Flags:=", "", _
  "Color:=", "(132 132 193)", "Transparency:=", 0, "PartCoordinateSystem:=", _
  "Global", "MaterialName:=", "M19_24G_3DSF0.950", "SolveInside:=", true) 
On Error Resume Next
oEditor.SetPropertyValue "Geometry3DCmdTab", "Stator:CreateUserDefinedPart:1", _
  "LenRegion", "65mm + 2*endRegion"
On Error Goto 0
oEditor.CreateUserDefinedPart Array("NAME:UserDefinedPrimitiveParameters", _
  "DllName:=", "RMxprt/SlotCore", "Version:=", "12.1", "NoOfParameters:=", 19, _
  "Library:=", "syslib", Array("NAME:ParamVector", Array("NAME:Pair", _
  "Name:=", "DiaGap", "Value:=", "75mm"), Array("NAME:Pair", "Name:=", _
  "DiaYoke", "Value:=", "120mm"), Array("NAME:Pair", "Name:=", "Length", _
  "Value:=", "65mm"), Array("NAME:Pair", "Name:=", "Skew", "Value:=", "0deg"), _
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
  "Value:=", "30deg"), Array("NAME:Pair", "Name:=", "LenRegion", "Value:=", _
  "103.5996833275845mm"), Array("NAME:Pair", "Name:=", "InfoCore", "Value:=", _
  "1"))), Array("NAME:Attributes", "Name:=", "StatorSlotInsu", "Flags:=", "", _
  "Color:=", "(132 132 193)", "Transparency:=", 0, "PartCoordinateSystem:=", _
  "Global", "MaterialName:=", "vacuum", "SolveInside:=", true) 
On Error Resume Next
oEditor.SetPropertyValue "Geometry3DCmdTab", _
  "StatorSlotInsu:CreateUserDefinedPart:1", "LenRegion", "65mm + 2*endRegion"
On Error Goto 0
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
  "Value:=", "65mm"), Array("NAME:Pair", "Name:=", "Skew", "Value:=", "0deg"), _
  Array("NAME:Pair", "Name:=", "Slots", "Value:=", "12"), Array("NAME:Pair", _
  "Name:=", "SlotType", "Value:=", "2"), Array("NAME:Pair", "Name:=", "Hs0", _
  "Value:=", "0.5mm"), Array("NAME:Pair", "Name:=", "Hs1", "Value:=", "1mm"), _
  Array("NAME:Pair", "Name:=", "Hs2", "Value:=", "8.199999999999999mm"), _
  Array("NAME:Pair", "Name:=", "Bs0", "Value:=", "2.5mm"), Array("NAME:Pair", _
  "Name:=", "Bs1", "Value:=", "5.6mm"), Array("NAME:Pair", "Name:=", "Bs2", _
  "Value:=", "7.6mm"), Array("NAME:Pair", "Name:=", "Rs", "Value:=", "3.8mm"), _
  Array("NAME:Pair", "Name:=", "FilletType", "Value:=", "0"), Array(_
  "NAME:Pair", "Name:=", "Layers", "Value:=", "1"), Array("NAME:Pair", _
  "Name:=", "CoilPitch", "Value:=", "1"), Array("NAME:Pair", "Name:=", _
  "EndExt", "Value:=", "0mm"), Array("NAME:Pair", "Name:=", "SpanExt", _
  "Value:=", "0.1mm"), Array("NAME:Pair", "Name:=", "SegAngle", "Value:=", _
  "10deg"), Array("NAME:Pair", "Name:=", "LenRegion", "Value:=", _
  "103.5996833275845mm"), Array("NAME:Pair", "Name:=", "InfoCoil", "Value:=", _
  "1"))), Array("NAME:Attributes", "Name:=", "Coil_0", "Flags:=", "", _
  "Color:=", "(250 167 14)", "Transparency:=", 0, "PartCoordinateSystem:=", _
  "Global", "MaterialName:=", "copper_75C", "SolveInside:=", true) 
On Error Resume Next
oEditor.SetPropertyValue "Geometry3DCmdTab", "Coil_0:CreateUserDefinedPart:1", _
  "LenRegion", "65mm + 2*endRegion"
On Error Goto 0
oEditor.Rotate Array("NAME:Selections", "Selections:=", "Coil_0"), Array(_
  "NAME:RotateParameters", "CoordinateSystemID:=", -1, "RotateAxis:=", "Z", _
  "RotateAngle:=", "330deg")
oEditor.CreateUserDefinedPart Array("NAME:UserDefinedPrimitiveParameters", _
  "DllName:=", "RMxprt/LapCoil", "Version:=", "12.0", "NoOfParameters:=", 21, _
  "Library:=", "syslib", Array("NAME:ParamVector", Array("NAME:Pair", _
  "Name:=", "DiaGap", "Value:=", "75mm"), Array("NAME:Pair", "Name:=", _
  "DiaYoke", "Value:=", "120mm"), Array("NAME:Pair", "Name:=", "Length", _
  "Value:=", "65mm"), Array("NAME:Pair", "Name:=", "Skew", "Value:=", "0deg"), _
  Array("NAME:Pair", "Name:=", "Slots", "Value:=", "12"), Array("NAME:Pair", _
  "Name:=", "SlotType", "Value:=", "2"), Array("NAME:Pair", "Name:=", "Hs0", _
  "Value:=", "0.5mm"), Array("NAME:Pair", "Name:=", "Hs1", "Value:=", "1mm"), _
  Array("NAME:Pair", "Name:=", "Hs2", "Value:=", "8.199999999999999mm"), _
  Array("NAME:Pair", "Name:=", "Bs0", "Value:=", "2.5mm"), Array("NAME:Pair", _
  "Name:=", "Bs1", "Value:=", "5.6mm"), Array("NAME:Pair", "Name:=", "Bs2", _
  "Value:=", "7.6mm"), Array("NAME:Pair", "Name:=", "Rs", "Value:=", "3.8mm"), _
  Array("NAME:Pair", "Name:=", "FilletType", "Value:=", "0"), Array(_
  "NAME:Pair", "Name:=", "Layers", "Value:=", "1"), Array("NAME:Pair", _
  "Name:=", "CoilPitch", "Value:=", "1"), Array("NAME:Pair", "Name:=", _
  "EndExt", "Value:=", "0mm"), Array("NAME:Pair", "Name:=", "SpanExt", _
  "Value:=", "0.1mm"), Array("NAME:Pair", "Name:=", "SegAngle", "Value:=", _
  "10deg"), Array("NAME:Pair", "Name:=", "LenRegion", "Value:=", _
  "103.5996833275845mm"), Array("NAME:Pair", "Name:=", "InfoCoil", "Value:=", _
  "1"))), Array("NAME:Attributes", "Name:=", "Coil_1", "Flags:=", "", _
  "Color:=", "(250 167 14)", "Transparency:=", 0, "PartCoordinateSystem:=", _
  "Global", "MaterialName:=", "copper_75C", "SolveInside:=", true) 
On Error Resume Next
oEditor.SetPropertyValue "Geometry3DCmdTab", "Coil_1:CreateUserDefinedPart:1", _
  "LenRegion", "65mm + 2*endRegion"
On Error Goto 0
oEditor.Rotate Array("NAME:Selections", "Selections:=", "Coil_1"), Array(_
  "NAME:RotateParameters", "CoordinateSystemID:=", -1, "RotateAxis:=", "Z", _
  "RotateAngle:=", "30deg")
oEditor.CreateUserDefinedPart Array("NAME:UserDefinedPrimitiveParameters", _
  "DllName:=", "RMxprt/LapCoil", "Version:=", "12.0", "NoOfParameters:=", 21, _
  "Library:=", "syslib", Array("NAME:ParamVector", Array("NAME:Pair", _
  "Name:=", "DiaGap", "Value:=", "75mm"), Array("NAME:Pair", "Name:=", _
  "DiaYoke", "Value:=", "120mm"), Array("NAME:Pair", "Name:=", "Length", _
  "Value:=", "65mm"), Array("NAME:Pair", "Name:=", "Skew", "Value:=", "0deg"), _
  Array("NAME:Pair", "Name:=", "Slots", "Value:=", "12"), Array("NAME:Pair", _
  "Name:=", "SlotType", "Value:=", "2"), Array("NAME:Pair", "Name:=", "Hs0", _
  "Value:=", "0.5mm"), Array("NAME:Pair", "Name:=", "Hs1", "Value:=", "1mm"), _
  Array("NAME:Pair", "Name:=", "Hs2", "Value:=", "8.199999999999999mm"), _
  Array("NAME:Pair", "Name:=", "Bs0", "Value:=", "2.5mm"), Array("NAME:Pair", _
  "Name:=", "Bs1", "Value:=", "5.6mm"), Array("NAME:Pair", "Name:=", "Bs2", _
  "Value:=", "7.6mm"), Array("NAME:Pair", "Name:=", "Rs", "Value:=", "3.8mm"), _
  Array("NAME:Pair", "Name:=", "FilletType", "Value:=", "0"), Array(_
  "NAME:Pair", "Name:=", "Layers", "Value:=", "1"), Array("NAME:Pair", _
  "Name:=", "CoilPitch", "Value:=", "1"), Array("NAME:Pair", "Name:=", _
  "EndExt", "Value:=", "0mm"), Array("NAME:Pair", "Name:=", "SpanExt", _
  "Value:=", "0.1mm"), Array("NAME:Pair", "Name:=", "SegAngle", "Value:=", _
  "10deg"), Array("NAME:Pair", "Name:=", "LenRegion", "Value:=", _
  "103.5996833275845mm"), Array("NAME:Pair", "Name:=", "InfoCoil", "Value:=", _
  "1"))), Array("NAME:Attributes", "Name:=", "Coil_2", "Flags:=", "", _
  "Color:=", "(250 167 14)", "Transparency:=", 0, "PartCoordinateSystem:=", _
  "Global", "MaterialName:=", "copper_75C", "SolveInside:=", true) 
On Error Resume Next
oEditor.SetPropertyValue "Geometry3DCmdTab", "Coil_2:CreateUserDefinedPart:1", _
  "LenRegion", "65mm + 2*endRegion"
On Error Goto 0
oEditor.Rotate Array("NAME:Selections", "Selections:=", "Coil_2"), Array(_
  "NAME:RotateParameters", "CoordinateSystemID:=", -1, "RotateAxis:=", "Z", _
  "RotateAngle:=", "90deg")
oEditor.CreateUserDefinedPart Array("NAME:UserDefinedPrimitiveParameters", _
  "DllName:=", "RMxprt/LapCoil", "Version:=", "12.0", "NoOfParameters:=", 21, _
  "Library:=", "syslib", Array("NAME:ParamVector", Array("NAME:Pair", _
  "Name:=", "DiaGap", "Value:=", "75mm"), Array("NAME:Pair", "Name:=", _
  "DiaYoke", "Value:=", "120mm"), Array("NAME:Pair", "Name:=", "Length", _
  "Value:=", "65mm"), Array("NAME:Pair", "Name:=", "Skew", "Value:=", "0deg"), _
  Array("NAME:Pair", "Name:=", "Slots", "Value:=", "12"), Array("NAME:Pair", _
  "Name:=", "SlotType", "Value:=", "2"), Array("NAME:Pair", "Name:=", "Hs0", _
  "Value:=", "0.5mm"), Array("NAME:Pair", "Name:=", "Hs1", "Value:=", "1mm"), _
  Array("NAME:Pair", "Name:=", "Hs2", "Value:=", "8.199999999999999mm"), _
  Array("NAME:Pair", "Name:=", "Bs0", "Value:=", "2.5mm"), Array("NAME:Pair", _
  "Name:=", "Bs1", "Value:=", "5.6mm"), Array("NAME:Pair", "Name:=", "Bs2", _
  "Value:=", "7.6mm"), Array("NAME:Pair", "Name:=", "Rs", "Value:=", "3.8mm"), _
  Array("NAME:Pair", "Name:=", "FilletType", "Value:=", "0"), Array(_
  "NAME:Pair", "Name:=", "Layers", "Value:=", "1"), Array("NAME:Pair", _
  "Name:=", "CoilPitch", "Value:=", "1"), Array("NAME:Pair", "Name:=", _
  "EndExt", "Value:=", "0mm"), Array("NAME:Pair", "Name:=", "SpanExt", _
  "Value:=", "0.1mm"), Array("NAME:Pair", "Name:=", "SegAngle", "Value:=", _
  "10deg"), Array("NAME:Pair", "Name:=", "LenRegion", "Value:=", _
  "103.5996833275845mm"), Array("NAME:Pair", "Name:=", "InfoCoil", "Value:=", _
  "1"))), Array("NAME:Attributes", "Name:=", "Coil_3", "Flags:=", "", _
  "Color:=", "(250 167 14)", "Transparency:=", 0, "PartCoordinateSystem:=", _
  "Global", "MaterialName:=", "copper_75C", "SolveInside:=", true) 
On Error Resume Next
oEditor.SetPropertyValue "Geometry3DCmdTab", "Coil_3:CreateUserDefinedPart:1", _
  "LenRegion", "65mm + 2*endRegion"
On Error Goto 0
oEditor.Rotate Array("NAME:Selections", "Selections:=", "Coil_3"), Array(_
  "NAME:RotateParameters", "CoordinateSystemID:=", -1, "RotateAxis:=", "Z", _
  "RotateAngle:=", "150deg")
oEditor.CreateUserDefinedPart Array("NAME:UserDefinedPrimitiveParameters", _
  "DllName:=", "RMxprt/LapCoil", "Version:=", "12.0", "NoOfParameters:=", 21, _
  "Library:=", "syslib", Array("NAME:ParamVector", Array("NAME:Pair", _
  "Name:=", "DiaGap", "Value:=", "75mm"), Array("NAME:Pair", "Name:=", _
  "DiaYoke", "Value:=", "120mm"), Array("NAME:Pair", "Name:=", "Length", _
  "Value:=", "65mm"), Array("NAME:Pair", "Name:=", "Skew", "Value:=", "0deg"), _
  Array("NAME:Pair", "Name:=", "Slots", "Value:=", "12"), Array("NAME:Pair", _
  "Name:=", "SlotType", "Value:=", "2"), Array("NAME:Pair", "Name:=", "Hs0", _
  "Value:=", "0.5mm"), Array("NAME:Pair", "Name:=", "Hs1", "Value:=", "1mm"), _
  Array("NAME:Pair", "Name:=", "Hs2", "Value:=", "8.199999999999999mm"), _
  Array("NAME:Pair", "Name:=", "Bs0", "Value:=", "2.5mm"), Array("NAME:Pair", _
  "Name:=", "Bs1", "Value:=", "5.6mm"), Array("NAME:Pair", "Name:=", "Bs2", _
  "Value:=", "7.6mm"), Array("NAME:Pair", "Name:=", "Rs", "Value:=", "3.8mm"), _
  Array("NAME:Pair", "Name:=", "FilletType", "Value:=", "0"), Array(_
  "NAME:Pair", "Name:=", "Layers", "Value:=", "1"), Array("NAME:Pair", _
  "Name:=", "CoilPitch", "Value:=", "1"), Array("NAME:Pair", "Name:=", _
  "EndExt", "Value:=", "0mm"), Array("NAME:Pair", "Name:=", "SpanExt", _
  "Value:=", "0.1mm"), Array("NAME:Pair", "Name:=", "SegAngle", "Value:=", _
  "10deg"), Array("NAME:Pair", "Name:=", "LenRegion", "Value:=", _
  "103.5996833275845mm"), Array("NAME:Pair", "Name:=", "InfoCoil", "Value:=", _
  "1"))), Array("NAME:Attributes", "Name:=", "Coil_4", "Flags:=", "", _
  "Color:=", "(250 167 14)", "Transparency:=", 0, "PartCoordinateSystem:=", _
  "Global", "MaterialName:=", "copper_75C", "SolveInside:=", true) 
On Error Resume Next
oEditor.SetPropertyValue "Geometry3DCmdTab", "Coil_4:CreateUserDefinedPart:1", _
  "LenRegion", "65mm + 2*endRegion"
On Error Goto 0
oEditor.Rotate Array("NAME:Selections", "Selections:=", "Coil_4"), Array(_
  "NAME:RotateParameters", "CoordinateSystemID:=", -1, "RotateAxis:=", "Z", _
  "RotateAngle:=", "210deg")
oEditor.CreateUserDefinedPart Array("NAME:UserDefinedPrimitiveParameters", _
  "DllName:=", "RMxprt/LapCoil", "Version:=", "12.0", "NoOfParameters:=", 21, _
  "Library:=", "syslib", Array("NAME:ParamVector", Array("NAME:Pair", _
  "Name:=", "DiaGap", "Value:=", "75mm"), Array("NAME:Pair", "Name:=", _
  "DiaYoke", "Value:=", "120mm"), Array("NAME:Pair", "Name:=", "Length", _
  "Value:=", "65mm"), Array("NAME:Pair", "Name:=", "Skew", "Value:=", "0deg"), _
  Array("NAME:Pair", "Name:=", "Slots", "Value:=", "12"), Array("NAME:Pair", _
  "Name:=", "SlotType", "Value:=", "2"), Array("NAME:Pair", "Name:=", "Hs0", _
  "Value:=", "0.5mm"), Array("NAME:Pair", "Name:=", "Hs1", "Value:=", "1mm"), _
  Array("NAME:Pair", "Name:=", "Hs2", "Value:=", "8.199999999999999mm"), _
  Array("NAME:Pair", "Name:=", "Bs0", "Value:=", "2.5mm"), Array("NAME:Pair", _
  "Name:=", "Bs1", "Value:=", "5.6mm"), Array("NAME:Pair", "Name:=", "Bs2", _
  "Value:=", "7.6mm"), Array("NAME:Pair", "Name:=", "Rs", "Value:=", "3.8mm"), _
  Array("NAME:Pair", "Name:=", "FilletType", "Value:=", "0"), Array(_
  "NAME:Pair", "Name:=", "Layers", "Value:=", "1"), Array("NAME:Pair", _
  "Name:=", "CoilPitch", "Value:=", "1"), Array("NAME:Pair", "Name:=", _
  "EndExt", "Value:=", "0mm"), Array("NAME:Pair", "Name:=", "SpanExt", _
  "Value:=", "0.1mm"), Array("NAME:Pair", "Name:=", "SegAngle", "Value:=", _
  "10deg"), Array("NAME:Pair", "Name:=", "LenRegion", "Value:=", _
  "103.5996833275845mm"), Array("NAME:Pair", "Name:=", "InfoCoil", "Value:=", _
  "1"))), Array("NAME:Attributes", "Name:=", "Coil_5", "Flags:=", "", _
  "Color:=", "(250 167 14)", "Transparency:=", 0, "PartCoordinateSystem:=", _
  "Global", "MaterialName:=", "copper_75C", "SolveInside:=", true) 
On Error Resume Next
oEditor.SetPropertyValue "Geometry3DCmdTab", "Coil_5:CreateUserDefinedPart:1", _
  "LenRegion", "65mm + 2*endRegion"
On Error Goto 0
oEditor.Rotate Array("NAME:Selections", "Selections:=", "Coil_5"), Array(_
  "NAME:RotateParameters", "CoordinateSystemID:=", -1, "RotateAxis:=", "Z", _
  "RotateAngle:=", "270deg")
oEditor.ChangeProperty Array("NAME:AllTabs", Array(_
  "NAME:Geometry3DAttributeTab", Array("NAME:PropServers", "Coil_3"), Array(_
  "NAME:ChangedProps", Array("NAME:Color", "R:=", 255, "G:=", 0, "B:=", 0))))
oEditor.ChangeProperty Array("NAME:AllTabs", Array(_
  "NAME:Geometry3DAttributeTab", Array("NAME:PropServers", "Coil_1"), Array(_
  "NAME:ChangedProps", Array("NAME:Color", "R:=", 0, "G:=", 128, "B:=", 0))))
oEditor.ChangeProperty Array("NAME:AllTabs", Array(_
  "NAME:Geometry3DAttributeTab", Array("NAME:PropServers", "Coil_5"), Array(_
  "NAME:ChangedProps", Array("NAME:Color", "R:=", 0, "G:=", 0, "B:=", 255))))
oEditor.ChangeProperty Array("NAME:AllTabs", Array(_
  "NAME:Geometry3DAttributeTab", Array("NAME:PropServers", "Coil_0"), Array(_
  "NAME:ChangedProps", Array("NAME:Color", "R:=", 255, "G:=", 128, "B:=", 128))))
oEditor.ChangeProperty Array("NAME:AllTabs", Array(_
  "NAME:Geometry3DAttributeTab", Array("NAME:PropServers", "Coil_4"), Array(_
  "NAME:ChangedProps", Array("NAME:Color", "R:=", 0, "G:=", 255, "B:=", 0))))
oEditor.ChangeProperty Array("NAME:AllTabs", Array(_
  "NAME:Geometry3DAttributeTab", Array("NAME:PropServers", "Coil_2"), Array(_
  "NAME:ChangedProps", Array("NAME:Color", "R:=", 0, "G:=", 128, "B:=", 255))))
On Error Resume Next
oEditor.Subtract Array("NAME:Selections", "Blank Parts:=", "StatorSlotInsu", _
  "Tool Parts:=", "Coil_0,Coil_1,Coil_2,Coil_3,Coil_4,Coil_5"), Array(_
  "NAME:SubtractParameters", "CoordinateSystemID:=", -1, "KeepOriginals:=", _
  true)
oEditor.Subtract Array("NAME:Selections", "Blank Parts:=", "StatorSlotInsu", _
  "Tool Parts:=", "Stator"), Array("NAME:SubtractParameters", _
  "CoordinateSystemID:=", -1, "KeepOriginals:=", true)
On Error Goto 0
oEditor.CreateUserDefinedPart Array("NAME:UserDefinedPrimitiveParameters", _
  "DllName:=", "RMxprt/IPMCore", "Version:=", "19.0", "NoOfParameters:=", 16, _
  "Library:=", "syslib", Array("NAME:ParamVector", Array("NAME:Pair", _
  "Name:=", "DiaGap", "Value:=", "74mm"), Array("NAME:Pair", "Name:=", _
  "DiaYoke", "Value:=", "26mm"), Array("NAME:Pair", "Name:=", "Length", _
  "Value:=", "65mm"), Array("NAME:Pair", "Name:=", "Poles", "Value:=", "10"), _
  Array("NAME:Pair", "Name:=", "PoleType", "Value:=", "3"), Array("NAME:Pair", _
  "Name:=", "D1", "Value:=", "72mm"), Array("NAME:Pair", "Name:=", "O1", _
  "Value:=", "1mm"), Array("NAME:Pair", "Name:=", "O2", "Value:=", "10mm"), _
  Array("NAME:Pair", "Name:=", "B1", "Value:=", "2mm"), Array("NAME:Pair", _
  "Name:=", "Rib", "Value:=", "2mm"), Array("NAME:Pair", "Name:=", "HRib", _
  "Value:=", "1mm"), Array("NAME:Pair", "Name:=", "DminMag", "Value:=", "0mm"), _
  Array("NAME:Pair", "Name:=", "ThickMag", "Value:=", "3mm"), Array(_
  "NAME:Pair", "Name:=", "WidthMag", "Value:=", "20mm"), Array("NAME:Pair", _
  "Name:=", "LenRegion", "Value:=", "103.5996833275845mm"), Array("NAME:Pair", _
  "Name:=", "InfoCore", "Value:=", "0"))), Array("NAME:Attributes", "Name:=", _
  "Rotor", "Flags:=", "", "Color:=", "(132 132 193)", "Transparency:=", 0, _
  "PartCoordinateSystem:=", "Global", "MaterialName:=", "M19_24G_3DSF0.950", _
  "SolveInside:=", true) 
On Error Resume Next
oEditor.SetPropertyValue "Geometry3DCmdTab", "Rotor:CreateUserDefinedPart:1", _
  "LenRegion", "65mm + 2*endRegion"
On Error Goto 0
oEditor.Rotate Array("NAME:Selections", "Selections:=", "Rotor"), Array(_
  "NAME:RotateParameters", "CoordinateSystemID:=", -1, "RotateAxis:=", "Z", _
  "RotateAngle:=", "18deg")
oEditor.CreateUserDefinedPart Array("NAME:UserDefinedPrimitiveParameters", _
  "DllName:=", "RMxprt/IPMCore", "Version:=", "19.0", "NoOfParameters:=", 16, _
  "Library:=", "syslib", Array("NAME:ParamVector", Array("NAME:Pair", _
  "Name:=", "DiaGap", "Value:=", "74mm"), Array("NAME:Pair", "Name:=", _
  "DiaYoke", "Value:=", "26mm"), Array("NAME:Pair", "Name:=", "Length", _
  "Value:=", "65mm"), Array("NAME:Pair", "Name:=", "Poles", "Value:=", "10"), _
  Array("NAME:Pair", "Name:=", "PoleType", "Value:=", "3"), Array("NAME:Pair", _
  "Name:=", "D1", "Value:=", "72mm"), Array("NAME:Pair", "Name:=", "O1", _
  "Value:=", "1mm"), Array("NAME:Pair", "Name:=", "O2", "Value:=", "10mm"), _
  Array("NAME:Pair", "Name:=", "B1", "Value:=", "2mm"), Array("NAME:Pair", _
  "Name:=", "Rib", "Value:=", "2mm"), Array("NAME:Pair", "Name:=", "HRib", _
  "Value:=", "1mm"), Array("NAME:Pair", "Name:=", "DminMag", "Value:=", "0mm"), _
  Array("NAME:Pair", "Name:=", "ThickMag", "Value:=", "3mm"), Array(_
  "NAME:Pair", "Name:=", "WidthMag", "Value:=", "20mm"), Array("NAME:Pair", _
  "Name:=", "LenRegion", "Value:=", "103.5996833275845mm"), Array("NAME:Pair", _
  "Name:=", "InfoCore", "Value:=", "-1"))), Array("NAME:Attributes", "Name:=", _
  "Mag1", "Flags:=", "", "Color:=", "(0 255 128)", "Transparency:=", 0, _
  "PartCoordinateSystem:=", "Global", "MaterialName:=", _
  "XG196/96_3DSF1.000_X", "SolveInside:=", true) 
On Error Resume Next
oEditor.SetPropertyValue "Geometry3DCmdTab", "Mag1:CreateUserDefinedPart:1", _
  "LenRegion", "65mm + 2*endRegion"
On Error Goto 0
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
  "XG196/96_3DSF1.000_X"))))
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
  "XG196/96_3DSF1.000_X"))))
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
  "XG196/96_3DSF1.000_X"))))
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
  "XG196/96_3DSF1.000_X"))))
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
  "XG196/96_3DSF1.000_X"))))
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
  "XG196/96_3DSF1.000_X"))))
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
  "XG196/96_3DSF1.000_X"))))
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
  "XG196/96_3DSF1.000_X"))))
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
  "XG196/96_3DSF1.000_X"))))
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
  "XG196/96_3DSF1.000_X"))))
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
  "Value:=", "65mm"), Array("NAME:Pair", "Name:=", "Poles", "Value:=", "10"), _
  Array("NAME:Pair", "Name:=", "PoleType", "Value:=", "3"), Array("NAME:Pair", _
  "Name:=", "D1", "Value:=", "72mm"), Array("NAME:Pair", "Name:=", "O1", _
  "Value:=", "1mm"), Array("NAME:Pair", "Name:=", "O2", "Value:=", "10mm"), _
  Array("NAME:Pair", "Name:=", "B1", "Value:=", "2mm"), Array("NAME:Pair", _
  "Name:=", "Rib", "Value:=", "2mm"), Array("NAME:Pair", "Name:=", "HRib", _
  "Value:=", "1mm"), Array("NAME:Pair", "Name:=", "DminMag", "Value:=", "0mm"), _
  Array("NAME:Pair", "Name:=", "ThickMag", "Value:=", "3mm"), Array(_
  "NAME:Pair", "Name:=", "WidthMag", "Value:=", "20mm"), Array("NAME:Pair", _
  "Name:=", "LenRegion", "Value:=", "103.5996833275845mm"), Array("NAME:Pair", _
  "Name:=", "InfoCore", "Value:=", "-2"))), Array("NAME:Attributes", "Name:=", _
  "Mag2", "Flags:=", "", "Color:=", "(0 255 128)", "Transparency:=", 0, _
  "PartCoordinateSystem:=", "Global", "MaterialName:=", _
  "XG196/96_3DSF1.000_X", "SolveInside:=", true) 
On Error Resume Next
oEditor.SetPropertyValue "Geometry3DCmdTab", "Mag2:CreateUserDefinedPart:1", _
  "LenRegion", "65mm + 2*endRegion"
On Error Goto 0
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
  "XG196/96_3DSF1.000_X"))))
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
  "XG196/96_3DSF1.000_X"))))
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
  "XG196/96_3DSF1.000_X"))))
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
  "XG196/96_3DSF1.000_X"))))
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
  "XG196/96_3DSF1.000_X"))))
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
  "XG196/96_3DSF1.000_X"))))
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
  "XG196/96_3DSF1.000_X"))))
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
  "XG196/96_3DSF1.000_X"))))
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
  "XG196/96_3DSF1.000_X"))))
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
  "XG196/96_3DSF1.000_X"))))
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
oEditor.ChangeProperty Array("NAME:AllTabs", Array(_
  "NAME:Geometry3DAttributeTab", Array("NAME:PropServers", "OuterRegion"), _
  Array("NAME:ChangedProps", Array("NAME:Transparent", "Value:=", 0.75))))
oEditor.Subtract Array("NAME:Selections", "Blank Parts:=", "Shaft,Stator,Coil_0" & _
  ",Coil_1,Coil_2,Coil_3,Coil_4,Coil_5,Rotor,Mag1_0,Mag1_1,Mag1_2,Mag1_3" & _
  ",Mag1_4,Mag1_5,Mag1_6,Mag1_7,Mag1_8,Mag1_9,Mag2_0,Mag2_1,Mag2_2,Mag2_3" & _
  ",Mag2_4,Mag2_5,Mag2_6,Mag2_7,Mag2_8,Mag2_9", "Tool Parts:=", tool(0)), _
  Array("NAME:SubtractParameters", "CoordinateSystemID:=", -1, _
  "KeepOriginals:=", false)
oEditor.FitAll
Set oModule = oDesign.GetModule("AnalysisSetup")
oModule.EditSetup "Setup1", Array("NAME:Setup1", "StopTime:=", "0.033333333s")
