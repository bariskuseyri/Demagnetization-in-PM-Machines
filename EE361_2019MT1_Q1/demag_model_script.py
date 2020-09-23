# ----------------------------------------------
# Script Recorded by ANSYS Electronics Desktop Version 2020.1.0
# 22:08:10  Sep 22, 2020
# ----------------------------------------------
import ScriptEnv
ScriptEnv.Initialize("Ansoft.ElectronicsDesktop")
oDesktop.RestoreWindow()
oProject = oDesktop.SetActiveProject("Project1")
oProject.SaveAs("C:\\Users\\bkuseyri\\Desktop\\METU\\EBostanci\\Demagnetization-in-PM-Machines\\EE361_2019MT1_Q1\\Demag_model.aedt", True)
oProject.Save()
oProject.InsertDesign("Maxwell 2D", "Maxwell2DDesign1", "Magnetostatic", "")
oProject.Save()
oDesign = oProject.SetActiveDesign("Maxwell2DDesign1")
oEditor = oDesign.SetActiveEditor("3D Modeler")
oEditor.SetModelUnits(
	[
		"NAME:Units Parameter",
		"Units:="		, "mm",
		"Rescale:="		, False
	])
oEditor.CreatePolyline(
	[
		"NAME:PolylineParameters",
		"IsPolylineCovered:="	, True,
		"IsPolylineClosed:="	, True,
		[
			"NAME:PolylinePoints",
			[
				"NAME:PLPoint",
				"X:="			, "-26.5mm",
				"Y:="			, "12mm",
				"Z:="			, "0mm"
			],
			[
				"NAME:PLPoint",
				"X:="			, "-26.5mm",
				"Y:="			, "-12mm",
				"Z:="			, "0mm"
			],
			[
				"NAME:PLPoint",
				"X:="			, "-2.5mm",
				"Y:="			, "-12mm",
				"Z:="			, "0mm"
			],
			[
				"NAME:PLPoint",
				"X:="			, "-2.5mm",
				"Y:="			, "-4mm",
				"Z:="			, "0mm"
			],
			[
				"NAME:PLPoint",
				"X:="			, "2.5mm",
				"Y:="			, "-4mm",
				"Z:="			, "0mm"
			],
			[
				"NAME:PLPoint",
				"X:="			, "2.5mm",
				"Y:="			, "-17mm",
				"Z:="			, "0mm"
			],
			[
				"NAME:PLPoint",
				"X:="			, "-31.5mm",
				"Y:="			, "-17mm",
				"Z:="			, "0mm"
			],
			[
				"NAME:PLPoint",
				"X:="			, "-31.5mm",
				"Y:="			, "17mm",
				"Z:="			, "0mm"
			],
			[
				"NAME:PLPoint",
				"X:="			, "2.5mm",
				"Y:="			, "17mm",
				"Z:="			, "0mm"
			],
			[
				"NAME:PLPoint",
				"X:="			, "2.5mm",
				"Y:="			, "4mm",
				"Z:="			, "0mm"
			],
			[
				"NAME:PLPoint",
				"X:="			, "-2.5mm",
				"Y:="			, "4mm",
				"Z:="			, "0mm"
			],
			[
				"NAME:PLPoint",
				"X:="			, "-2.5mm",
				"Y:="			, "12mm",
				"Z:="			, "0mm"
			],
			[
				"NAME:PLPoint",
				"X:="			, "-26.5mm",
				"Y:="			, "12mm",
				"Z:="			, "0mm"
			]
		],
		[
			"NAME:PolylineSegments",
			[
				"NAME:PLSegment",
				"SegmentType:="		, "Line",
				"StartIndex:="		, 0,
				"NoOfPoints:="		, 2
			],
			[
				"NAME:PLSegment",
				"SegmentType:="		, "Line",
				"StartIndex:="		, 1,
				"NoOfPoints:="		, 2
			],
			[
				"NAME:PLSegment",
				"SegmentType:="		, "Line",
				"StartIndex:="		, 2,
				"NoOfPoints:="		, 2
			],
			[
				"NAME:PLSegment",
				"SegmentType:="		, "Line",
				"StartIndex:="		, 3,
				"NoOfPoints:="		, 2
			],
			[
				"NAME:PLSegment",
				"SegmentType:="		, "Line",
				"StartIndex:="		, 4,
				"NoOfPoints:="		, 2
			],
			[
				"NAME:PLSegment",
				"SegmentType:="		, "Line",
				"StartIndex:="		, 5,
				"NoOfPoints:="		, 2
			],
			[
				"NAME:PLSegment",
				"SegmentType:="		, "Line",
				"StartIndex:="		, 6,
				"NoOfPoints:="		, 2
			],
			[
				"NAME:PLSegment",
				"SegmentType:="		, "Line",
				"StartIndex:="		, 7,
				"NoOfPoints:="		, 2
			],
			[
				"NAME:PLSegment",
				"SegmentType:="		, "Line",
				"StartIndex:="		, 8,
				"NoOfPoints:="		, 2
			],
			[
				"NAME:PLSegment",
				"SegmentType:="		, "Line",
				"StartIndex:="		, 9,
				"NoOfPoints:="		, 2
			],
			[
				"NAME:PLSegment",
				"SegmentType:="		, "Line",
				"StartIndex:="		, 10,
				"NoOfPoints:="		, 2
			],
			[
				"NAME:PLSegment",
				"SegmentType:="		, "Line",
				"StartIndex:="		, 11,
				"NoOfPoints:="		, 2
			]
		],
		[
			"NAME:PolylineXSection",
			"XSectionType:="	, "None",
			"XSectionOrient:="	, "Auto",
			"XSectionWidth:="	, "0mm",
			"XSectionTopWidth:="	, "0mm",
			"XSectionHeight:="	, "0mm",
			"XSectionNumSegments:="	, "0",
			"XSectionBendType:="	, "Corner"
		]
	], 
	[
		"NAME:Attributes",
		"Name:="		, "Polyline1",
		"Flags:="		, "",
		"Color:="		, "(143 175 143)",
		"Transparency:="	, 0,
		"PartCoordinateSystem:=", "Global",
		"UDMId:="		, "",
		"MaterialValue:="	, "\"vacuum\"",
		"SurfaceMaterialValue:=", "\"\"",
		"SolveInside:="		, True,
		"IsMaterialEditable:="	, True,
		"UseMaterialAppearance:=", False,
		"IsLightweight:="	, False
	])
oEditor.CreatePolyline(
	[
		"NAME:PolylineParameters",
		"IsPolylineCovered:="	, True,
		"IsPolylineClosed:="	, True,
		[
			"NAME:PolylinePoints",
			[
				"NAME:PLPoint",
				"X:="			, "-2.5mm",
				"Y:="			, "-2.5mm",
				"Z:="			, "0mm"
			],
			[
				"NAME:PLPoint",
				"X:="			, "2.5mm",
				"Y:="			, "-2.5mm",
				"Z:="			, "0mm"
			],
			[
				"NAME:PLPoint",
				"X:="			, "2.5mm",
				"Y:="			, "2.5mm",
				"Z:="			, "0mm"
			],
			[
				"NAME:PLPoint",
				"X:="			, "-2.5mm",
				"Y:="			, "2.5mm",
				"Z:="			, "0mm"
			],
			[
				"NAME:PLPoint",
				"X:="			, "-2.5mm",
				"Y:="			, "-2.5mm",
				"Z:="			, "0mm"
			]
		],
		[
			"NAME:PolylineSegments",
			[
				"NAME:PLSegment",
				"SegmentType:="		, "Line",
				"StartIndex:="		, 0,
				"NoOfPoints:="		, 2
			],
			[
				"NAME:PLSegment",
				"SegmentType:="		, "Line",
				"StartIndex:="		, 1,
				"NoOfPoints:="		, 2
			],
			[
				"NAME:PLSegment",
				"SegmentType:="		, "Line",
				"StartIndex:="		, 2,
				"NoOfPoints:="		, 2
			],
			[
				"NAME:PLSegment",
				"SegmentType:="		, "Line",
				"StartIndex:="		, 3,
				"NoOfPoints:="		, 2
			]
		],
		[
			"NAME:PolylineXSection",
			"XSectionType:="	, "None",
			"XSectionOrient:="	, "Auto",
			"XSectionWidth:="	, "0mm",
			"XSectionTopWidth:="	, "0mm",
			"XSectionHeight:="	, "0mm",
			"XSectionNumSegments:="	, "0",
			"XSectionBendType:="	, "Corner"
		]
	], 
	[
		"NAME:Attributes",
		"Name:="		, "Polyline2",
		"Flags:="		, "",
		"Color:="		, "(143 175 143)",
		"Transparency:="	, 0,
		"PartCoordinateSystem:=", "Global",
		"UDMId:="		, "",
		"MaterialValue:="	, "\"vacuum\"",
		"SurfaceMaterialValue:=", "\"\"",
		"SolveInside:="		, True,
		"IsMaterialEditable:="	, True,
		"UseMaterialAppearance:=", False,
		"IsLightweight:="	, False
	])
oProject.Save()
oEditor.ChangeProperty(
	[
		"NAME:AllTabs",
		[
			"NAME:Geometry3DAttributeTab",
			[
				"NAME:PropServers", 
				"Polyline1"
			],
			[
				"NAME:ChangedProps",
				[
					"NAME:Name",
					"Value:="		, "c-core"
				]
			]
		]
	])
oEditor.ChangeProperty(
	[
		"NAME:AllTabs",
		[
			"NAME:Geometry3DAttributeTab",
			[
				"NAME:PropServers", 
				"Polyline1"
			],
			[
				"NAME:ChangedProps",
				[
					"NAME:Name",
					"Value:="		, "c_core"
				]
			]
		]
	])
oEditor.ChangeProperty(
	[
		"NAME:AllTabs",
		[
			"NAME:Geometry3DAttributeTab",
			[
				"NAME:PropServers", 
				"Polyline2"
			],
			[
				"NAME:ChangedProps",
				[
					"NAME:Name",
					"Value:="		, "Plunger"
				]
			]
		]
	])
oEditor.ChangeProperty(
	[
		"NAME:AllTabs",
		[
			"NAME:Geometry3DAttributeTab",
			[
				"NAME:PropServers", 
				"Plunger"
			],
			[
				"NAME:ChangedProps",
				[
					"NAME:Name",
					"Value:="		, "plunger"
				]
			]
		]
	])
oEditor.ChangeProperty(
	[
		"NAME:AllTabs",
		[
			"NAME:Geometry3DAttributeTab",
			[
				"NAME:PropServers", 
				"plunger_1"
			],
			[
				"NAME:ChangedProps",
				[
					"NAME:Name",
					"Value:="		, "plunger"
				]
			]
		]
	])
oEditor.ChangeProperty(
	[
		"NAME:AllTabs",
		[
			"NAME:Geometry3DAttributeTab",
			[
				"NAME:PropServers", 
				"plunger"
			],
			[
				"NAME:ChangedProps",
				[
					"NAME:Material",
					"Value:="		, "\"iron\""
				]
			]
		]
	])
oEditor.ChangeProperty(
	[
		"NAME:AllTabs",
		[
			"NAME:Geometry3DAttributeTab",
			[
				"NAME:PropServers", 
				"c_core"
			],
			[
				"NAME:ChangedProps",
				[
					"NAME:Material",
					"Value:="		, "\"iron\""
				]
			]
		]
	])
oProject.Save()
oEditor.CreatePolyline(
	[
		"NAME:PolylineParameters",
		"IsPolylineCovered:="	, True,
		"IsPolylineClosed:="	, True,
		[
			"NAME:PolylinePoints",
			[
				"NAME:PLPoint",
				"X:="			, "-31.5mm",
				"Y:="			, "8mm",
				"Z:="			, "0mm"
			],
			[
				"NAME:PLPoint",
				"X:="			, "-33.5mm",
				"Y:="			, "8mm",
				"Z:="			, "0mm"
			],
			[
				"NAME:PLPoint",
				"X:="			, "-33.5mm",
				"Y:="			, "-8mm",
				"Z:="			, "0mm"
			],
			[
				"NAME:PLPoint",
				"X:="			, "-31.5mm",
				"Y:="			, "-8mm",
				"Z:="			, "0mm"
			],
			[
				"NAME:PLPoint",
				"X:="			, "-31.5mm",
				"Y:="			, "8mm",
				"Z:="			, "0mm"
			]
		],
		[
			"NAME:PolylineSegments",
			[
				"NAME:PLSegment",
				"SegmentType:="		, "Line",
				"StartIndex:="		, 0,
				"NoOfPoints:="		, 2
			],
			[
				"NAME:PLSegment",
				"SegmentType:="		, "Line",
				"StartIndex:="		, 1,
				"NoOfPoints:="		, 2
			],
			[
				"NAME:PLSegment",
				"SegmentType:="		, "Line",
				"StartIndex:="		, 2,
				"NoOfPoints:="		, 2
			],
			[
				"NAME:PLSegment",
				"SegmentType:="		, "Line",
				"StartIndex:="		, 3,
				"NoOfPoints:="		, 2
			]
		],
		[
			"NAME:PolylineXSection",
			"XSectionType:="	, "None",
			"XSectionOrient:="	, "Auto",
			"XSectionWidth:="	, "0mm",
			"XSectionTopWidth:="	, "0mm",
			"XSectionHeight:="	, "0mm",
			"XSectionNumSegments:="	, "0",
			"XSectionBendType:="	, "Corner"
		]
	], 
	[
		"NAME:Attributes",
		"Name:="		, "Polyline1",
		"Flags:="		, "",
		"Color:="		, "(143 175 143)",
		"Transparency:="	, 0,
		"PartCoordinateSystem:=", "Global",
		"UDMId:="		, "",
		"MaterialValue:="	, "\"vacuum\"",
		"SurfaceMaterialValue:=", "\"\"",
		"SolveInside:="		, True,
		"IsMaterialEditable:="	, True,
		"UseMaterialAppearance:=", False,
		"IsLightweight:="	, False
	])
oEditor.CreatePolyline(
	[
		"NAME:PolylineParameters",
		"IsPolylineCovered:="	, True,
		"IsPolylineClosed:="	, True,
		[
			"NAME:PolylinePoints",
			[
				"NAME:PLPoint",
				"X:="			, "-24.5mm",
				"Y:="			, "8mm",
				"Z:="			, "0mm"
			],
			[
				"NAME:PLPoint",
				"X:="			, "-26.5mm",
				"Y:="			, "8mm",
				"Z:="			, "0mm"
			],
			[
				"NAME:PLPoint",
				"X:="			, "-26.5mm",
				"Y:="			, "-8mm",
				"Z:="			, "0mm"
			],
			[
				"NAME:PLPoint",
				"X:="			, "-24.5mm",
				"Y:="			, "-8mm",
				"Z:="			, "0mm"
			],
			[
				"NAME:PLPoint",
				"X:="			, "-24.5mm",
				"Y:="			, "8mm",
				"Z:="			, "0mm"
			]
		],
		[
			"NAME:PolylineSegments",
			[
				"NAME:PLSegment",
				"SegmentType:="		, "Line",
				"StartIndex:="		, 0,
				"NoOfPoints:="		, 2
			],
			[
				"NAME:PLSegment",
				"SegmentType:="		, "Line",
				"StartIndex:="		, 1,
				"NoOfPoints:="		, 2
			],
			[
				"NAME:PLSegment",
				"SegmentType:="		, "Line",
				"StartIndex:="		, 2,
				"NoOfPoints:="		, 2
			],
			[
				"NAME:PLSegment",
				"SegmentType:="		, "Line",
				"StartIndex:="		, 3,
				"NoOfPoints:="		, 2
			]
		],
		[
			"NAME:PolylineXSection",
			"XSectionType:="	, "None",
			"XSectionOrient:="	, "Auto",
			"XSectionWidth:="	, "0mm",
			"XSectionTopWidth:="	, "0mm",
			"XSectionHeight:="	, "0mm",
			"XSectionNumSegments:="	, "0",
			"XSectionBendType:="	, "Corner"
		]
	], 
	[
		"NAME:Attributes",
		"Name:="		, "Polyline2",
		"Flags:="		, "",
		"Color:="		, "(143 175 143)",
		"Transparency:="	, 0,
		"PartCoordinateSystem:=", "Global",
		"UDMId:="		, "",
		"MaterialValue:="	, "\"vacuum\"",
		"SurfaceMaterialValue:=", "\"\"",
		"SolveInside:="		, True,
		"IsMaterialEditable:="	, True,
		"UseMaterialAppearance:=", False,
		"IsLightweight:="	, False
	])
oEditor.ChangeProperty(
	[
		"NAME:AllTabs",
		[
			"NAME:Geometry3DAttributeTab",
			[
				"NAME:PropServers", 
				"Polyline1"
			],
			[
				"NAME:ChangedProps",
				[
					"NAME:Name",
					"Value:="		, "Coil_pos"
				]
			]
		]
	])
oEditor.ChangeProperty(
	[
		"NAME:AllTabs",
		[
			"NAME:Geometry3DAttributeTab",
			[
				"NAME:PropServers", 
				"Coil_pos"
			],
			[
				"NAME:ChangedProps",
				[
					"NAME:Material",
					"Value:="		, "\"copper\""
				]
			]
		]
	])
oEditor.ChangeProperty(
	[
		"NAME:AllTabs",
		[
			"NAME:Geometry3DAttributeTab",
			[
				"NAME:PropServers", 
				"Polyline2"
			],
			[
				"NAME:ChangedProps",
				[
					"NAME:Name",
					"Value:="		, "Coil_neg"
				]
			]
		]
	])
oEditor.ChangeProperty(
	[
		"NAME:AllTabs",
		[
			"NAME:Geometry3DAttributeTab",
			[
				"NAME:PropServers", 
				"Coil_neg"
			],
			[
				"NAME:ChangedProps",
				[
					"NAME:Material",
					"Value:="		, "\"copper\""
				]
			]
		]
	])
oProject.Save()
oDesign.ChangeProperty(
	[
		"NAME:AllTabs",
		[
			"NAME:LocalVariableTab",
			[
				"NAME:PropServers", 
				"LocalVariables"
			],
			[
				"NAME:NewProps",
				[
					"NAME:I_exc",
					"PropType:="		, "VariableProp",
					"UserDef:="		, True,
					"Value:="		, "12.85A"
				],
				[
					"NAME:N_turns",
					"PropType:="		, "VariableProp",
					"UserDef:="		, True,
					"Value:="		, "130"
				]
			]
		]
	])
oModule = oDesign.GetModule("BoundarySetup")
oModule.AssignCurrent(
	[
		"NAME:Current1",
		"Objects:="		, ["Coil_pos"],
		"Current:="		, "I_exc*N_turns",
		"IsPositive:="		, True
	])
oModule.AssignCurrent(
	[
		"NAME:Current2",
		"Objects:="		, ["Coil_neg"],
		"Current:="		, "I_exc*N_turns",
		"IsPositive:="		, False
	])
oProject.Save()
oModule = oDesign.GetModule("MaxwellParameterSetup")
oModule.AssignMatrix(
	[
		"NAME:Matrix1",
		[
			"NAME:MatrixEntry",
			[
				"NAME:MatrixEntry",
				"Source:="		, "Current1",
				"NumberOfTurns:="	, "130",
				"ReturnPath:="		, "infinite"
			],
			[
				"NAME:MatrixEntry",
				"Source:="		, "Current2",
				"NumberOfTurns:="	, "130",
				"ReturnPath:="		, "infinite"
			]
		],
		[
			"NAME:MatrixGroup",
			[
				"NAME:MatrixGroup",
				"GroupName:="		, "Group1",
				"NumberOfBranches:="	, "1",
				"Sources:="		, "Current1,Current2"
			]
		]
	])
oProject.Save()
oProject.Save()
oEditor.CreateRegion(
	[
		"NAME:RegionParameters",
		"+XPaddingType:="	, "Percentage Offset",
		"+XPadding:="		, "100",
		"-XPaddingType:="	, "Percentage Offset",
		"-XPadding:="		, "100",
		"+YPaddingType:="	, "Percentage Offset",
		"+YPadding:="		, "100",
		"-YPaddingType:="	, "Percentage Offset",
		"-YPadding:="		, "100",
		"+ZPaddingType:="	, "Percentage Offset",
		"+ZPadding:="		, "0",
		"-ZPaddingType:="	, "Percentage Offset",
		"-ZPadding:="		, "0"
	], 
	[
		"NAME:Attributes",
		"Name:="		, "Region",
		"Flags:="		, "Wireframe#",
		"Color:="		, "(143 175 143)",
		"Transparency:="	, 0,
		"PartCoordinateSystem:=", "Global",
		"UDMId:="		, "",
		"MaterialValue:="	, "\"vacuum\"",
		"SurfaceMaterialValue:=", "\"\"",
		"SolveInside:="		, True,
		"IsMaterialEditable:="	, True,
		"UseMaterialAppearance:=", False,
		"IsLightweight:="	, False
	])
oProject.Save()
oEditor.CreatePolyline(
	[
		"NAME:PolylineParameters",
		"IsPolylineCovered:="	, True,
		"IsPolylineClosed:="	, True,
		[
			"NAME:PolylinePoints",
			[
				"NAME:PLPoint",
				"X:="			, "-6mm",
				"Y:="			, "-6mm",
				"Z:="			, "0mm"
			],
			[
				"NAME:PLPoint",
				"X:="			, "6mm",
				"Y:="			, "-6mm",
				"Z:="			, "0mm"
			],
			[
				"NAME:PLPoint",
				"X:="			, "6mm",
				"Y:="			, "6mm",
				"Z:="			, "0mm"
			],
			[
				"NAME:PLPoint",
				"X:="			, "-6mm",
				"Y:="			, "6mm",
				"Z:="			, "0mm"
			],
			[
				"NAME:PLPoint",
				"X:="			, "-6mm",
				"Y:="			, "-6mm",
				"Z:="			, "0mm"
			]
		],
		[
			"NAME:PolylineSegments",
			[
				"NAME:PLSegment",
				"SegmentType:="		, "Line",
				"StartIndex:="		, 0,
				"NoOfPoints:="		, 2
			],
			[
				"NAME:PLSegment",
				"SegmentType:="		, "Line",
				"StartIndex:="		, 1,
				"NoOfPoints:="		, 2
			],
			[
				"NAME:PLSegment",
				"SegmentType:="		, "Line",
				"StartIndex:="		, 2,
				"NoOfPoints:="		, 2
			],
			[
				"NAME:PLSegment",
				"SegmentType:="		, "Line",
				"StartIndex:="		, 3,
				"NoOfPoints:="		, 2
			]
		],
		[
			"NAME:PolylineXSection",
			"XSectionType:="	, "None",
			"XSectionOrient:="	, "Auto",
			"XSectionWidth:="	, "0mm",
			"XSectionTopWidth:="	, "0mm",
			"XSectionHeight:="	, "0mm",
			"XSectionNumSegments:="	, "0",
			"XSectionBendType:="	, "Corner"
		]
	], 
	[
		"NAME:Attributes",
		"Name:="		, "Polyline1",
		"Flags:="		, "",
		"Color:="		, "(143 175 143)",
		"Transparency:="	, 0,
		"PartCoordinateSystem:=", "Global",
		"UDMId:="		, "",
		"MaterialValue:="	, "\"vacuum\"",
		"SurfaceMaterialValue:=", "\"\"",
		"SolveInside:="		, True,
		"IsMaterialEditable:="	, True,
		"UseMaterialAppearance:=", False,
		"IsLightweight:="	, False
	])
oModule = oDesign.GetModule("MeshSetup")
oModule.AssignLengthOp(
	[
		"NAME:Length1",
		"RefineInside:="	, True,
		"Enabled:="		, True,
		"Objects:="		, ["Polyline1"],
		"RestrictElem:="	, True,
		"NumMaxElem:="		, "1000",
		"RestrictLength:="	, False,
		"MaxLength:="		, "2.4mm"
	])
oEditor.ChangeProperty(
	[
		"NAME:AllTabs",
		[
			"NAME:Geometry3DAttributeTab",
			[
				"NAME:PropServers", 
				"Polyline1"
			],
			[
				"NAME:ChangedProps",
				[
					"NAME:Name",
					"Value:="		, "Band"
				]
			]
		]
	])
oEditor.ChangeProperty(
	[
		"NAME:AllTabs",
		[
			"NAME:Geometry3DAttributeTab",
			[
				"NAME:PropServers", 
				"Band"
			],
			[
				"NAME:ChangedProps",
				[
					"NAME:Transparent",
					"Value:="		, 0.8
				]
			]
		]
	])
oProject.Save()
oModule = oDesign.GetModule("AnalysisSetup")
oModule.InsertSetup("Magnetostatic", 
	[
		"NAME:Setup1",
		"Enabled:="		, True,
		[
			"NAME:MeshLink",
			"ImportMesh:="		, False
		],
		"MaximumPasses:="	, 15,
		"MinimumPasses:="	, 2,
		"MinimumConvergedPasses:=", 1,
		"PercentRefinement:="	, 30,
		"SolveFieldOnly:="	, False,
		"PercentError:="	, 1,
		"SolveMatrixAtLast:="	, True,
		"PercentError:="	, 1,
		"CacheSaveKind:="	, "Delta",
		"ConstantDelta:="	, "0s",
		"NonLinearResidual:="	, 0.0001,
		"SmoothBHCurve:="	, False,
		[
			"NAME:MuOption",
			"MuNonLinearBH:="	, True
		]
	])
oModule.EditSetup("Setup1", 
	[
		"NAME:Setup1",
		"Enabled:="		, True,
		[
			"NAME:MeshLink",
			"ImportMesh:="		, False
		],
		"MaximumPasses:="	, 15,
		"MinimumPasses:="	, 2,
		"MinimumConvergedPasses:=", 1,
		"PercentRefinement:="	, 30,
		"SolveFieldOnly:="	, False,
		"PercentError:="	, 1,
		"SolveMatrixAtLast:="	, True,
		"PercentError:="	, 1,
		"CacheSaveKind:="	, "Delta",
		"ConstantDelta:="	, "0s",
		"NonLinearResidual:="	, 0.0001,
		"SmoothBHCurve:="	, False,
		[
			"NAME:MuOption",
			"MuNonLinearBH:="	, True
		]
	])
oProject.Save()
oDesign.Analyze("Setup1")
oEditor.Delete(
	[
		"NAME:Selections",
		"Selections:="		, "Band"
	])
oProject.Save()
oDesign.Analyze("Setup1")
oModule = oDesign.GetModule("BoundarySetup")
oModule.AssignVectorPotential(
	[
		"NAME:VectorPotential1",
		"Edges:="		, [72,73,74,75],
		"Value:="		, "0",
		"CoordinateSystem:="	, ""
	])
oProject.Save()
oDesign.Analyze("Setup1")
oModule = oDesign.GetModule("FieldsReporter")
oModule.CreateFieldPlot(
	[
		"NAME:Mesh1",
		"SolutionName:="	, "Setup1 : LastAdaptive",
		"UserSpecifyName:="	, 0,
		"UserSpecifyFolder:="	, 0,
		"QuantityName:="	, "Mesh",
		"PlotFolder:="		, "MeshPlots",
		"FieldType:="		, "Fields",
		"StreamlinePlot:="	, False,
		"AdjacentSidePlot:="	, False,
		"FullModelPlot:="	, False,
		"IntrinsicVar:="	, "",
		"PlotGeomInfo:="	, [1,"Surface","FacesList",4,"6","58","46","34"],
		"FilterBoxes:="		, [0],
		"Real time mode:="	, True,
		[
			"NAME:MeshSettings",
			"Scale factor:="	, 100,
			"Transparency:="	, 0,
			"Mesh type:="		, "Shaded",
			"Surface only:="	, True,
			"Add grid:="		, True,
			"Refinement:="		, 0,
			"Use geometry color:="	, True,
			"Mesh line color:="	, [0,0,255],
			"Filled color:="	, [255,255,255]
		],
		"EnableGaussianSmoothing:=", False
	], "Field")
oModule.CreateFieldPlot(
	[
		"NAME:Mag_H1",
		"SolutionName:="	, "Setup1 : LastAdaptive",
		"UserSpecifyName:="	, 0,
		"UserSpecifyFolder:="	, 0,
		"QuantityName:="	, "Mag_H",
		"PlotFolder:="		, "H",
		"StreamlinePlot:="	, False,
		"AdjacentSidePlot:="	, False,
		"FullModelPlot:="	, False,
		"IntrinsicVar:="	, "",
		"PlotGeomInfo:="	, [1,"Surface","FacesList",5,"6","34","46","58","70"],
		"FilterBoxes:="		, [0],
		[
			"NAME:PlotOnSurfaceSettings",
			"Filled:="		, False,
			"IsoValType:="		, "Fringe",
			"SmoothShade:="		, True,
			"AddGrid:="		, False,
			"MapTransparency:="	, True,
			"Refinement:="		, 0,
			"Transparency:="	, 0,
			"SmoothingLevel:="	, 0,
			[
				"NAME:Arrow3DSpacingSettings",
				"ArrowUniform:="	, True,
				"ArrowSpacing:="	, 0,
				"MinArrowSpacing:="	, 0,
				"MaxArrowSpacing:="	, 0
			],
			"GridColor:="		, [255,255,255]
		],
		"EnableGaussianSmoothing:=", False
	], "Field")
oModule.SetFieldPlotSettings("Mag_H1", 
	[
		"NAME:FieldsPlotItemSettings",
		[
			"NAME:PlotOnSurfaceSettings",
			"Filled:="		, True,
			"IsoValType:="		, "Fringe",
			"SmoothShade:="		, True,
			"AddGrid:="		, False,
			"MapTransparency:="	, True,
			"Refinement:="		, 0,
			"Transparency:="	, 0,
			"SmoothingLevel:="	, 0,
			[
				"NAME:Arrow3DSpacingSettings",
				"ArrowUniform:="	, True,
				"ArrowSpacing:="	, 3.71382522583008,
				"MinArrowSpacing:="	, 1.48553001880646,
				"MaxArrowSpacing:="	, 5.94212007522583
			],
			"GridColor:="		, [255,255,255]
		]
	])
oProject.Save()
oProject.InsertDesign("Maxwell 2D", "Maxwell2DDesign2", "Magnetostatic", "")
oDesign.RenameDesignInstance("Maxwell2DDesign1", "coil_model_MS")
oDesign = oProject.SetActiveDesign("Maxwell2DDesign2")
oDesign.RenameDesignInstance("Maxwell2DDesign2", "coil_model_trans")
oProject.Save()
oProject.InsertDesign("Maxwell 2D", "Maxwell2DDesign1", "Magnetostatic", "")
oProject.InsertDesign("Maxwell 2D", "Maxwell2DDesign2", "Magnetostatic", "")
oDesign = oProject.SetActiveDesign("Maxwell2DDesign1")
oDesign.RenameDesignInstance("Maxwell2DDesign1", "PM_model_MS")
oDesign = oProject.SetActiveDesign("Maxwell2DDesign2")
oDesign.RenameDesignInstance("Maxwell2DDesign2", "PM_model_trans")
oProject.Save()
oProject.Save()
oDesign = oProject.SetActiveDesign("coil_model_trans")
oDesign.SetSolutionType("Transient", "XY")
oDesign = oProject.SetActiveDesign("PM_model_trans")
oDesign.SetSolutionType("Transient", "XY")
oProject.Save()
oDesign = oProject.SetActiveDesign("coil_model_trans")
oEditor = oDesign.SetActiveEditor("3D Modeler")
oEditor.SetModelUnits(
	[
		"NAME:Units Parameter",
		"Units:="		, "mm",
		"Rescale:="		, False
	])
oProject.Save()
oDesign = oProject.SetActiveDesign("PM_model_MS")
oEditor = oDesign.SetActiveEditor("3D Modeler")
oEditor.CreatePolyline(
	[
		"NAME:PolylineParameters",
		"IsPolylineCovered:="	, True,
		"IsPolylineClosed:="	, False,
		[
			"NAME:PolylinePoints",
			[
				"NAME:PLPoint",
				"X:="			, "-26.5mm",
				"Y:="			, "12mm",
				"Z:="			, "0mm"
			],
			[
				"NAME:PLPoint",
				"X:="			, "-2.5mm",
				"Y:="			, "12mm",
				"Z:="			, "0mm"
			],
			[
				"NAME:PLPoint",
				"X:="			, "-2.5mm",
				"Y:="			, "4mm",
				"Z:="			, "0mm"
			],
			[
				"NAME:PLPoint",
				"X:="			, "2.5mm",
				"Y:="			, "4mm",
				"Z:="			, "0mm"
			],
			[
				"NAME:PLPoint",
				"X:="			, "2.5mm",
				"Y:="			, "17mm",
				"Z:="			, "0mm"
			],
			[
				"NAME:PLPoint",
				"X:="			, "-31.5mm",
				"Y:="			, "17mm",
				"Z:="			, "0mm"
			],
			[
				"NAME:PLPoint",
				"X:="			, "-31.5mm",
				"Y:="			, "12mm",
				"Z:="			, "0mm"
			],
			[
				"NAME:PLPoint",
				"X:="			, "-34mm",
				"Y:="			, "4mm",
				"Z:="			, "0mm"
			],
			[
				"NAME:PLPoint",
				"X:="			, "-24mm",
				"Y:="			, "4mm",
				"Z:="			, "0mm"
			],
			[
				"NAME:PLPoint",
				"X:="			, "-24mm",
				"Y:="			, "12mm",
				"Z:="			, "0mm"
			]
		],
		[
			"NAME:PolylineSegments",
			[
				"NAME:PLSegment",
				"SegmentType:="		, "Line",
				"StartIndex:="		, 0,
				"NoOfPoints:="		, 2
			],
			[
				"NAME:PLSegment",
				"SegmentType:="		, "Line",
				"StartIndex:="		, 1,
				"NoOfPoints:="		, 2
			],
			[
				"NAME:PLSegment",
				"SegmentType:="		, "Line",
				"StartIndex:="		, 2,
				"NoOfPoints:="		, 2
			],
			[
				"NAME:PLSegment",
				"SegmentType:="		, "Line",
				"StartIndex:="		, 3,
				"NoOfPoints:="		, 2
			],
			[
				"NAME:PLSegment",
				"SegmentType:="		, "Line",
				"StartIndex:="		, 4,
				"NoOfPoints:="		, 2
			],
			[
				"NAME:PLSegment",
				"SegmentType:="		, "Line",
				"StartIndex:="		, 5,
				"NoOfPoints:="		, 2
			],
			[
				"NAME:PLSegment",
				"SegmentType:="		, "Line",
				"StartIndex:="		, 6,
				"NoOfPoints:="		, 2
			],
			[
				"NAME:PLSegment",
				"SegmentType:="		, "Line",
				"StartIndex:="		, 7,
				"NoOfPoints:="		, 2
			],
			[
				"NAME:PLSegment",
				"SegmentType:="		, "Line",
				"StartIndex:="		, 8,
				"NoOfPoints:="		, 2
			]
		],
		[
			"NAME:PolylineXSection",
			"XSectionType:="	, "None",
			"XSectionOrient:="	, "Auto",
			"XSectionWidth:="	, "0mm",
			"XSectionTopWidth:="	, "0mm",
			"XSectionHeight:="	, "0mm",
			"XSectionNumSegments:="	, "0",
			"XSectionBendType:="	, "Corner"
		]
	], 
	[
		"NAME:Attributes",
		"Name:="		, "Polyline1",
		"Flags:="		, "",
		"Color:="		, "(143 175 143)",
		"Transparency:="	, 0,
		"PartCoordinateSystem:=", "Global",
		"UDMId:="		, "",
		"MaterialValue:="	, "\"vacuum\"",
		"SurfaceMaterialValue:=", "\"\"",
		"SolveInside:="		, True,
		"IsMaterialEditable:="	, True,
		"UseMaterialAppearance:=", False,
		"IsLightweight:="	, False
	])
oEditor.ChangeProperty(
	[
		"NAME:AllTabs",
		[
			"NAME:Geometry3DPolylineTab",
			[
				"NAME:PropServers", 
				"Polyline1:CreatePolyline:2:Segment8"
			],
			[
				"NAME:ChangedProps",
				[
					"NAME:Point2",
					"X:="			, "-26.5mm",
					"Y:="			, "12mm",
					"Z:="			, "0mm"
				]
			]
		]
	])
oEditor.CoverLines(
	[
		"NAME:Selections",
		"Selections:="		, "Polyline1",
		"NewPartsModelFlag:="	, "Model"
	])
oProject.Save()
oEditor.CreatePolyline(
	[
		"NAME:PolylineParameters",
		"IsPolylineCovered:="	, True,
		"IsPolylineClosed:="	, True,
		[
			"NAME:PolylinePoints",
			[
				"NAME:PLPoint",
				"X:="			, "-2.5mm",
				"Y:="			, "-12mm",
				"Z:="			, "0mm"
			],
			[
				"NAME:PLPoint",
				"X:="			, "-2.5mm",
				"Y:="			, "-4mm",
				"Z:="			, "0mm"
			],
			[
				"NAME:PLPoint",
				"X:="			, "2.5mm",
				"Y:="			, "-4mm",
				"Z:="			, "0mm"
			],
			[
				"NAME:PLPoint",
				"X:="			, "2.5mm",
				"Y:="			, "-17mm",
				"Z:="			, "0mm"
			],
			[
				"NAME:PLPoint",
				"X:="			, "-31.5mm",
				"Y:="			, "-17mm",
				"Z:="			, "0mm"
			],
			[
				"NAME:PLPoint",
				"X:="			, "-31.5mm",
				"Y:="			, "-12mm",
				"Z:="			, "0mm"
			],
			[
				"NAME:PLPoint",
				"X:="			, "-34mm",
				"Y:="			, "-4mm",
				"Z:="			, "0mm"
			],
			[
				"NAME:PLPoint",
				"X:="			, "-24mm",
				"Y:="			, "-4mm",
				"Z:="			, "0mm"
			],
			[
				"NAME:PLPoint",
				"X:="			, "-26.5mm",
				"Y:="			, "-12mm",
				"Z:="			, "0mm"
			],
			[
				"NAME:PLPoint",
				"X:="			, "-2.5mm",
				"Y:="			, "-12mm",
				"Z:="			, "0mm"
			]
		],
		[
			"NAME:PolylineSegments",
			[
				"NAME:PLSegment",
				"SegmentType:="		, "Line",
				"StartIndex:="		, 0,
				"NoOfPoints:="		, 2
			],
			[
				"NAME:PLSegment",
				"SegmentType:="		, "Line",
				"StartIndex:="		, 1,
				"NoOfPoints:="		, 2
			],
			[
				"NAME:PLSegment",
				"SegmentType:="		, "Line",
				"StartIndex:="		, 2,
				"NoOfPoints:="		, 2
			],
			[
				"NAME:PLSegment",
				"SegmentType:="		, "Line",
				"StartIndex:="		, 3,
				"NoOfPoints:="		, 2
			],
			[
				"NAME:PLSegment",
				"SegmentType:="		, "Line",
				"StartIndex:="		, 4,
				"NoOfPoints:="		, 2
			],
			[
				"NAME:PLSegment",
				"SegmentType:="		, "Line",
				"StartIndex:="		, 5,
				"NoOfPoints:="		, 2
			],
			[
				"NAME:PLSegment",
				"SegmentType:="		, "Line",
				"StartIndex:="		, 6,
				"NoOfPoints:="		, 2
			],
			[
				"NAME:PLSegment",
				"SegmentType:="		, "Line",
				"StartIndex:="		, 7,
				"NoOfPoints:="		, 2
			],
			[
				"NAME:PLSegment",
				"SegmentType:="		, "Line",
				"StartIndex:="		, 8,
				"NoOfPoints:="		, 2
			]
		],
		[
			"NAME:PolylineXSection",
			"XSectionType:="	, "None",
			"XSectionOrient:="	, "Auto",
			"XSectionWidth:="	, "0mm",
			"XSectionTopWidth:="	, "0mm",
			"XSectionHeight:="	, "0mm",
			"XSectionNumSegments:="	, "0",
			"XSectionBendType:="	, "Corner"
		]
	], 
	[
		"NAME:Attributes",
		"Name:="		, "Polyline2",
		"Flags:="		, "",
		"Color:="		, "(143 175 143)",
		"Transparency:="	, 0,
		"PartCoordinateSystem:=", "Global",
		"UDMId:="		, "",
		"MaterialValue:="	, "\"vacuum\"",
		"SurfaceMaterialValue:=", "\"\"",
		"SolveInside:="		, True,
		"IsMaterialEditable:="	, True,
		"UseMaterialAppearance:=", False,
		"IsLightweight:="	, False
	])
oEditor.CreatePolyline(
	[
		"NAME:PolylineParameters",
		"IsPolylineCovered:="	, True,
		"IsPolylineClosed:="	, True,
		[
			"NAME:PolylinePoints",
			[
				"NAME:PLPoint",
				"X:="			, "-34mm",
				"Y:="			, "-4mm",
				"Z:="			, "0mm"
			],
			[
				"NAME:PLPoint",
				"X:="			, "-24mm",
				"Y:="			, "-4mm",
				"Z:="			, "0mm"
			],
			[
				"NAME:PLPoint",
				"X:="			, "-24mm",
				"Y:="			, "4mm",
				"Z:="			, "0mm"
			],
			[
				"NAME:PLPoint",
				"X:="			, "-34mm",
				"Y:="			, "4mm",
				"Z:="			, "0mm"
			],
			[
				"NAME:PLPoint",
				"X:="			, "-34mm",
				"Y:="			, "-4mm",
				"Z:="			, "0mm"
			]
		],
		[
			"NAME:PolylineSegments",
			[
				"NAME:PLSegment",
				"SegmentType:="		, "Line",
				"StartIndex:="		, 0,
				"NoOfPoints:="		, 2
			],
			[
				"NAME:PLSegment",
				"SegmentType:="		, "Line",
				"StartIndex:="		, 1,
				"NoOfPoints:="		, 2
			],
			[
				"NAME:PLSegment",
				"SegmentType:="		, "Line",
				"StartIndex:="		, 2,
				"NoOfPoints:="		, 2
			],
			[
				"NAME:PLSegment",
				"SegmentType:="		, "Line",
				"StartIndex:="		, 3,
				"NoOfPoints:="		, 2
			]
		],
		[
			"NAME:PolylineXSection",
			"XSectionType:="	, "None",
			"XSectionOrient:="	, "Auto",
			"XSectionWidth:="	, "0mm",
			"XSectionTopWidth:="	, "0mm",
			"XSectionHeight:="	, "0mm",
			"XSectionNumSegments:="	, "0",
			"XSectionBendType:="	, "Corner"
		]
	], 
	[
		"NAME:Attributes",
		"Name:="		, "Polyline3",
		"Flags:="		, "",
		"Color:="		, "(143 175 143)",
		"Transparency:="	, 0,
		"PartCoordinateSystem:=", "Global",
		"UDMId:="		, "",
		"MaterialValue:="	, "\"vacuum\"",
		"SurfaceMaterialValue:=", "\"\"",
		"SolveInside:="		, True,
		"IsMaterialEditable:="	, True,
		"UseMaterialAppearance:=", False,
		"IsLightweight:="	, False
	])
oProject.Save()
