//Maya ASCII 2015 scene
//Name: L02Greybox.ma
//Last modified: Wed, Jan 21, 2015 09:45:40 PM
//Codeset: 1252
requires maya "2015";
requires -nodeType "HIKCharacterNode" -nodeType "HIKProperty2State" -dataType "HIKCharacter"
		 -dataType "HIKCharacterState" -dataType "HIKEffectorState" -dataType "HIKPropertySetState"
		 "mayaHIK" "1.0_HIK_2014.2";
currentUnit -l centimeter -a degree -t film;
fileInfo "application" "maya";
fileInfo "product" "Maya 2015";
fileInfo "version" "2015";
fileInfo "cutIdentifier" "201407071530-922714";
fileInfo "osv" "Microsoft Windows 7 Home Premium Edition, 64-bit Windows 7 Service Pack 1 (Build 7601)\n";
fileInfo "license" "student";
createNode transform -s -n "persp";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 11173.85412019401 7765.8920367606461 -11618.636860535864 ;
	setAttr ".r" -type "double3" -26.738352730448341 868.59999999955699 0 ;
createNode camera -s -n "perspShape" -p "persp";
	setAttr -k off ".v" no;
	setAttr ".fl" 34.999999999999993;
	setAttr ".fcp" 100000;
	setAttr ".coi" 21759.109682026785;
	setAttr ".imn" -type "string" "persp";
	setAttr ".den" -type "string" "persp_depth";
	setAttr ".man" -type "string" "persp_mask";
	setAttr ".tp" -type "double3" 4059.7618103044783 792.15107719462867 9684.9672941462886 ;
	setAttr ".hc" -type "string" "viewSet -p %camera";
createNode transform -s -n "top";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 0 100.1 0 ;
	setAttr ".r" -type "double3" -89.999999999999986 0 0 ;
createNode camera -s -n "topShape" -p "top";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".coi" 100.1;
	setAttr ".ow" 30;
	setAttr ".imn" -type "string" "top";
	setAttr ".den" -type "string" "top_depth";
	setAttr ".man" -type "string" "top_mask";
	setAttr ".hc" -type "string" "viewSet -t %camera";
	setAttr ".o" yes;
createNode transform -s -n "front";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 0 0 100.1 ;
createNode camera -s -n "frontShape" -p "front";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".coi" 100.1;
	setAttr ".ow" 30;
	setAttr ".imn" -type "string" "front";
	setAttr ".den" -type "string" "front_depth";
	setAttr ".man" -type "string" "front_mask";
	setAttr ".hc" -type "string" "viewSet -f %camera";
	setAttr ".o" yes;
createNode transform -s -n "side";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 100.1 0 0 ;
	setAttr ".r" -type "double3" 0 89.999999999999986 0 ;
createNode camera -s -n "sideShape" -p "side";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".coi" 100.1;
	setAttr ".ow" 30;
	setAttr ".imn" -type "string" "side";
	setAttr ".den" -type "string" "side_depth";
	setAttr ".man" -type "string" "side_mask";
	setAttr ".hc" -type "string" "viewSet -s %camera";
	setAttr ".o" yes;
createNode transform -n "zenRefSize";
	setAttr ".t" -type "double3" 6444.4730722361646 -213.83038443396316 4294.6405280929885 ;
	setAttr ".s" -type "double3" 34.144275024968557 12.7504929205992 34.144275024968557 ;
createNode mesh -n "zenRefSizeShape" -p "zenRefSize";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".pv" -type "double2" 0.5 0.125 ;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 8 ".pt[0:7]" -type "float3"  -0.12052232 0 0.05866681 
		0.12052232 0 0.05866681 -0.12052232 12.9312 0.05866681 0.12052232 12.9312 0.05866681 
		-0.12052232 12.9312 0 0.12052232 12.9312 0 -0.12052232 0 0 0.12052232 0 0;
createNode transform -n "pCube1";
	setAttr ".s" -type "double3" 151.6017315499096 1 151.6017315499096 ;
createNode mesh -n "pCubeShape1" -p "pCube1";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".pv" -type "double2" 0.5 0.875 ;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 8 ".pt[0:7]" -type "float3"  -10.6703 -4365.6255 9.5490875 
		21.4946 -4365.6255 9.5490875 -10.6703 0 9.5490875 21.4946 0 9.5490875 -10.6703 0 
		-5.9794784 21.4946 0 -5.9794784 -10.6703 -4365.6255 -5.9794784 21.4946 -4365.6255 
		-5.9794784;
createNode transform -n "pCube2";
	setAttr ".t" -type "double3" 0 249.09762158838544 0 ;
	setAttr ".s" -type "double3" 151.6017315499096 1 151.6017315499096 ;
createNode mesh -n "pCubeShape2" -p "pCube2";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".pv" -type "double2" 0.5 0.375 ;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 14 ".uvst[0].uvsp[0:13]" -type "float2" 0.375 0 0.625 0 0.375
		 0.25 0.625 0.25 0.375 0.5 0.625 0.5 0.375 0.75 0.625 0.75 0.375 1 0.625 1 0.875 0
		 0.875 0.25 0.125 0 0.125 0.25;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 8 ".pt[0:7]" -type "float3"  1.5940489 -253.87677 2.0920331 
		21.530027 -253.87685 2.0920331 1.5940489 1289.463 2.0920331 21.530027 1289.463 2.0920331 
		1.5940489 1289.463 -5.9956493 21.530027 1289.463 -5.9956493 1.5940489 -253.87677 
		-5.9956493 21.530027 -253.87685 -5.9956493;
	setAttr -s 8 ".vt[0:7]"  -0.5 -0.5 0.5 0.5 -0.5 0.5 -0.5 0.5 0.5 0.5 0.5 0.5
		 -0.5 0.5 -0.5 0.5 0.5 -0.5 -0.5 -0.5 -0.5 0.5 -0.5 -0.5;
	setAttr -s 12 ".ed[0:11]"  0 1 0 2 3 0 4 5 0 6 7 0 0 2 0 1 3 0 2 4 0
		 3 5 0 4 6 0 5 7 0 6 0 0 7 1 0;
	setAttr -s 6 -ch 24 ".fc[0:5]" -type "polyFaces" 
		f 4 0 5 -2 -5
		mu 0 4 0 1 3 2
		f 4 1 7 -3 -7
		mu 0 4 2 3 5 4
		f 4 2 9 -4 -9
		mu 0 4 4 5 7 6
		f 4 3 11 -1 -11
		mu 0 4 6 7 9 8
		f 4 -12 -10 -8 -6
		mu 0 4 1 10 11 3
		f 4 10 4 6 8
		mu 0 4 12 0 2 13;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "pCube3";
	setAttr ".t" -type "double3" -1761.410011805046 249.09762158838544 0 ;
	setAttr ".s" -type "double3" 151.6017315499096 1 151.6017315499096 ;
createNode mesh -n "pCubeShape3" -p "pCube3";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".pv" -type "double2" 0.5 0.375 ;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 14 ".uvst[0].uvsp[0:13]" -type "float2" 0.375 0 0.625 0 0.375
		 0.25 0.625 0.25 0.375 0.5 0.625 0.5 0.375 0.75 0.625 0.75 0.375 1 0.625 1 0.875 0
		 0.875 0.25 0.125 0 0.125 0.25;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 8 ".pt[0:7]" -type "float3"  0.88278186 -253.87677 2.0920331 
		10.186791 -253.87685 2.0920331 0.88278186 1345.1062 2.0920331 10.186791 1345.1062 
		2.0920331 0.88278186 1345.1062 -5.9956493 10.186791 1345.1062 -5.9956493 0.88278186 
		-253.87677 -5.9956493 10.186791 -253.87685 -5.9956493;
	setAttr -s 8 ".vt[0:7]"  -0.5 -0.5 0.5 0.5 -0.5 0.5 -0.5 0.5 0.5 0.5 0.5 0.5
		 -0.5 0.5 -0.5 0.5 0.5 -0.5 -0.5 -0.5 -0.5 0.5 -0.5 -0.5;
	setAttr -s 12 ".ed[0:11]"  0 1 0 2 3 0 4 5 0 6 7 0 0 2 0 1 3 0 2 4 0
		 3 5 0 4 6 0 5 7 0 6 0 0 7 1 0;
	setAttr -s 6 -ch 24 ".fc[0:5]" -type "polyFaces" 
		f 4 0 5 -2 -5
		mu 0 4 0 1 3 2
		f 4 1 7 -3 -7
		mu 0 4 2 3 5 4
		f 4 2 9 -4 -9
		mu 0 4 4 5 7 6
		f 4 3 11 -1 -11
		mu 0 4 6 7 9 8
		f 4 -12 -10 -8 -6
		mu 0 4 1 10 11 3
		f 4 10 4 6 8
		mu 0 4 12 0 2 13;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "pSphere1";
	setAttr ".t" -type "double3" 1746.8956085392306 143.41864963415054 561.68620049244907 ;
	setAttr ".s" -type "double3" 163.83740141626828 163.83740141626828 163.83740141626828 ;
createNode mesh -n "pSphereShape1" -p "pSphere1";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
createNode transform -n "pSphere2";
	setAttr ".t" -type "double3" 1692.8598723519876 143.41864963415054 786.14003321130895 ;
	setAttr ".s" -type "double3" 163.83740141626828 163.83740141626828 163.83740141626828 ;
createNode mesh -n "pSphereShape2" -p "pSphere2";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 23 ".uvst[0].uvsp[0:22]" -type "float2" 0 0.25 0.25 0.25
		 0.5 0.25 0.75 0.25 1 0.25 0 0.5 0.25 0.5 0.5 0.5 0.75 0.5 1 0.5 0 0.75 0.25 0.75
		 0.5 0.75 0.75 0.75 1 0.75 0.125 0 0.375 0 0.625 0 0.875 0 0.125 1 0.375 1 0.625 1
		 0.875 1;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 14 ".vt[0:13]"  9.2725848e-008 -0.70710677 -0.70710677 -0.70710677 -0.70710677 -6.1817239e-008
		 -3.090862e-008 -0.70710677 0.70710677 0.70710677 -0.70710677 0 1.3113416e-007 0 -1
		 -1 0 -8.7422777e-008 -4.3711388e-008 0 1 1 0 0 9.2725848e-008 0.70710677 -0.70710677
		 -0.70710677 0.70710677 -6.1817239e-008 -3.090862e-008 0.70710677 0.70710677 0.70710677 0.70710677 0
		 0 -1 0 0 1 0;
	setAttr -s 28 ".ed[0:27]"  0 1 0 1 2 0 2 3 0 3 0 0 4 5 0 5 6 0 6 7 0
		 7 4 0 8 9 0 9 10 0 10 11 0 11 8 0 0 4 0 1 5 0 2 6 0 3 7 0 4 8 0 5 9 0 6 10 0 7 11 0
		 12 0 0 12 1 0 12 2 0 12 3 0 8 13 0 9 13 0 10 13 0 11 13 0;
	setAttr -s 16 -ch 56 ".fc[0:15]" -type "polyFaces" 
		f 4 0 13 -5 -13
		mu 0 4 0 1 6 5
		f 4 1 14 -6 -14
		mu 0 4 1 2 7 6
		f 4 2 15 -7 -15
		mu 0 4 2 3 8 7
		f 4 3 12 -8 -16
		mu 0 4 3 4 9 8
		f 4 4 17 -9 -17
		mu 0 4 5 6 11 10
		f 4 5 18 -10 -18
		mu 0 4 6 7 12 11
		f 4 6 19 -11 -19
		mu 0 4 7 8 13 12
		f 4 7 16 -12 -20
		mu 0 4 8 9 14 13
		f 3 -1 -21 21
		mu 0 3 1 0 15
		f 3 -2 -22 22
		mu 0 3 2 1 16
		f 3 -3 -23 23
		mu 0 3 3 2 17
		f 3 -4 -24 20
		mu 0 3 4 3 18
		f 3 8 25 -25
		mu 0 3 10 11 19
		f 3 9 26 -26
		mu 0 3 11 12 20
		f 3 10 27 -27
		mu 0 3 12 13 21
		f 3 11 24 -28
		mu 0 3 13 14 22;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "pSphere3";
	setAttr ".t" -type "double3" 1774.4569979590062 143.41864963415054 1024.0833052020648 ;
	setAttr ".s" -type "double3" 163.83740141626828 163.83740141626828 163.83740141626828 ;
createNode mesh -n "pSphereShape3" -p "pSphere3";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 23 ".uvst[0].uvsp[0:22]" -type "float2" 0 0.25 0.25 0.25
		 0.5 0.25 0.75 0.25 1 0.25 0 0.5 0.25 0.5 0.5 0.5 0.75 0.5 1 0.5 0 0.75 0.25 0.75
		 0.5 0.75 0.75 0.75 1 0.75 0.125 0 0.375 0 0.625 0 0.875 0 0.125 1 0.375 1 0.625 1
		 0.875 1;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 14 ".vt[0:13]"  9.2725848e-008 -0.70710677 -0.70710677 -0.70710677 -0.70710677 -6.1817239e-008
		 -3.090862e-008 -0.70710677 0.70710677 0.70710677 -0.70710677 0 1.3113416e-007 0 -1
		 -1 0 -8.7422777e-008 -4.3711388e-008 0 1 1 0 0 9.2725848e-008 0.70710677 -0.70710677
		 -0.70710677 0.70710677 -6.1817239e-008 -3.090862e-008 0.70710677 0.70710677 0.70710677 0.70710677 0
		 0 -1 0 0 1 0;
	setAttr -s 28 ".ed[0:27]"  0 1 0 1 2 0 2 3 0 3 0 0 4 5 0 5 6 0 6 7 0
		 7 4 0 8 9 0 9 10 0 10 11 0 11 8 0 0 4 0 1 5 0 2 6 0 3 7 0 4 8 0 5 9 0 6 10 0 7 11 0
		 12 0 0 12 1 0 12 2 0 12 3 0 8 13 0 9 13 0 10 13 0 11 13 0;
	setAttr -s 16 -ch 56 ".fc[0:15]" -type "polyFaces" 
		f 4 0 13 -5 -13
		mu 0 4 0 1 6 5
		f 4 1 14 -6 -14
		mu 0 4 1 2 7 6
		f 4 2 15 -7 -15
		mu 0 4 2 3 8 7
		f 4 3 12 -8 -16
		mu 0 4 3 4 9 8
		f 4 4 17 -9 -17
		mu 0 4 5 6 11 10
		f 4 5 18 -10 -18
		mu 0 4 6 7 12 11
		f 4 6 19 -11 -19
		mu 0 4 7 8 13 12
		f 4 7 16 -12 -20
		mu 0 4 8 9 14 13
		f 3 -1 -21 21
		mu 0 3 1 0 15
		f 3 -2 -22 22
		mu 0 3 2 1 16
		f 3 -3 -23 23
		mu 0 3 3 2 17
		f 3 -4 -24 20
		mu 0 3 4 3 18
		f 3 8 25 -25
		mu 0 3 10 11 19
		f 3 9 26 -26
		mu 0 3 11 12 20
		f 3 10 27 -27
		mu 0 3 12 13 21
		f 3 11 24 -28
		mu 0 3 13 14 22;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "pSphere4";
	setAttr ".t" -type "double3" 1702.7718613475565 143.41864963415054 1226.1562797228289 ;
	setAttr ".s" -type "double3" 163.83740141626828 163.83740141626828 163.83740141626828 ;
createNode mesh -n "pSphereShape4" -p "pSphere4";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 23 ".uvst[0].uvsp[0:22]" -type "float2" 0 0.25 0.25 0.25
		 0.5 0.25 0.75 0.25 1 0.25 0 0.5 0.25 0.5 0.5 0.5 0.75 0.5 1 0.5 0 0.75 0.25 0.75
		 0.5 0.75 0.75 0.75 1 0.75 0.125 0 0.375 0 0.625 0 0.875 0 0.125 1 0.375 1 0.625 1
		 0.875 1;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 14 ".vt[0:13]"  9.2725848e-008 -0.70710677 -0.70710677 -0.70710677 -0.70710677 -6.1817239e-008
		 -3.090862e-008 -0.70710677 0.70710677 0.70710677 -0.70710677 0 1.3113416e-007 0 -1
		 -1 0 -8.7422777e-008 -4.3711388e-008 0 1 1 0 0 9.2725848e-008 0.70710677 -0.70710677
		 -0.70710677 0.70710677 -6.1817239e-008 -3.090862e-008 0.70710677 0.70710677 0.70710677 0.70710677 0
		 0 -1 0 0 1 0;
	setAttr -s 28 ".ed[0:27]"  0 1 0 1 2 0 2 3 0 3 0 0 4 5 0 5 6 0 6 7 0
		 7 4 0 8 9 0 9 10 0 10 11 0 11 8 0 0 4 0 1 5 0 2 6 0 3 7 0 4 8 0 5 9 0 6 10 0 7 11 0
		 12 0 0 12 1 0 12 2 0 12 3 0 8 13 0 9 13 0 10 13 0 11 13 0;
	setAttr -s 16 -ch 56 ".fc[0:15]" -type "polyFaces" 
		f 4 0 13 -5 -13
		mu 0 4 0 1 6 5
		f 4 1 14 -6 -14
		mu 0 4 1 2 7 6
		f 4 2 15 -7 -15
		mu 0 4 2 3 8 7
		f 4 3 12 -8 -16
		mu 0 4 3 4 9 8
		f 4 4 17 -9 -17
		mu 0 4 5 6 11 10
		f 4 5 18 -10 -18
		mu 0 4 6 7 12 11
		f 4 6 19 -11 -19
		mu 0 4 7 8 13 12
		f 4 7 16 -12 -20
		mu 0 4 8 9 14 13
		f 3 -1 -21 21
		mu 0 3 1 0 15
		f 3 -2 -22 22
		mu 0 3 2 1 16
		f 3 -3 -23 23
		mu 0 3 3 2 17
		f 3 -4 -24 20
		mu 0 3 4 3 18
		f 3 8 25 -25
		mu 0 3 10 11 19
		f 3 9 26 -26
		mu 0 3 11 12 20
		f 3 10 27 -27
		mu 0 3 12 13 21
		f 3 11 24 -28
		mu 0 3 13 14 22;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "pCube4";
	setAttr ".t" -type "double3" 73.237609957932492 -86.500113140883698 1759.0957718207283 ;
	setAttr ".s" -type "double3" 2.4197112143170063 1 1.4337180316053189 ;
createNode mesh -n "pCubeShape4" -p "pCube4";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
createNode transform -n "pCube5";
	setAttr ".t" -type "double3" 3999.1111097061066 -86.500113140883627 1340.2159970820749 ;
	setAttr ".s" -type "double3" 2.4197112143170063 1 1.4337180316053189 ;
createNode mesh -n "pCubeShape5" -p "pCube5";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".pv" -type "double2" 0.75 0.125 ;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 14 ".uvst[0].uvsp[0:13]" -type "float2" 0.375 0 0.625 0 0.375
		 0.25 0.625 0.25 0.375 0.5 0.625 0.5 0.375 0.75 0.625 0.75 0.375 1 0.625 1 0.875 0
		 0.875 0.25 0.125 0 0.125 0.25;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 8 ".pt[0:7]" -type "float3"  0 -4221.8242 486.15054 295.58154 
		-4221.8242 486.15054 0 0 486.15054 295.58154 0 486.15054 0 0 -96.458008 295.58154 
		0 -96.458008 0 -4221.8242 -96.458008 295.58154 -4221.8242 -96.458008;
	setAttr -s 8 ".vt[0:7]"  -159.027389526 -85.52788544 171.84742737
		 159.027389526 -85.52788544 171.84742737 -159.027389526 85.52788544 171.84742737 159.027389526 85.52788544 171.84742737
		 -159.027389526 85.52788544 -171.84742737 159.027389526 85.52788544 -171.84742737
		 -159.027389526 -85.52788544 -171.84742737 159.027389526 -85.52788544 -171.84742737;
	setAttr -s 12 ".ed[0:11]"  0 1 0 2 3 0 4 5 0 6 7 0 0 2 0 1 3 0 2 4 0
		 3 5 0 4 6 0 5 7 0 6 0 0 7 1 0;
	setAttr -s 6 -ch 24 ".fc[0:5]" -type "polyFaces" 
		f 4 0 5 -2 -5
		mu 0 4 0 1 3 2
		f 4 1 7 -3 -7
		mu 0 4 2 3 5 4
		f 4 2 9 -4 -9
		mu 0 4 4 5 7 6
		f 4 3 11 -1 -11
		mu 0 4 6 7 9 8
		f 4 -12 -10 -8 -6
		mu 0 4 1 10 11 3
		f 4 10 4 6 8
		mu 0 4 12 0 2 13;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "pCube6";
	setAttr ".t" -type "double3" 3175.395249042796 249.09762158838544 0 ;
	setAttr ".s" -type "double3" 151.6017315499096 1 151.6017315499096 ;
createNode mesh -n "pCubeShape6" -p "pCube6";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".pv" -type "double2" 0.5 0.375 ;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 14 ".uvst[0].uvsp[0:13]" -type "float2" 0.375 0 0.625 0 0.375
		 0.25 0.625 0.25 0.375 0.5 0.625 0.5 0.375 0.75 0.625 0.75 0.375 1 0.625 1 0.875 0
		 0.875 0.25 0.125 0 0.125 0.25;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 8 ".pt[0:7]" -type "float3"  1.5940489 -4663.25 2.0920331 
		10.518441 -4663.25 2.0920331 1.5940489 1284.8461 2.0920331 10.518441 1284.8461 2.0920331 
		1.5940489 1284.8461 -5.9956493 10.518441 1284.8461 -5.9956493 1.5940489 -4663.25 
		-5.9956493 10.518441 -4663.25 -5.9956493;
	setAttr -s 8 ".vt[0:7]"  -0.5 -0.5 0.5 0.5 -0.5 0.5 -0.5 0.5 0.5 0.5 0.5 0.5
		 -0.5 0.5 -0.5 0.5 0.5 -0.5 -0.5 -0.5 -0.5 0.5 -0.5 -0.5;
	setAttr -s 12 ".ed[0:11]"  0 1 0 2 3 0 4 5 0 6 7 0 0 2 0 1 3 0 2 4 0
		 3 5 0 4 6 0 5 7 0 6 0 0 7 1 0;
	setAttr -s 6 -ch 24 ".fc[0:5]" -type "polyFaces" 
		f 4 0 5 -2 -5
		mu 0 4 0 1 3 2
		f 4 1 7 -3 -7
		mu 0 4 2 3 5 4
		f 4 2 9 -4 -9
		mu 0 4 4 5 7 6
		f 4 3 11 -1 -11
		mu 0 4 6 7 9 8
		f 4 -12 -10 -8 -6
		mu 0 4 1 10 11 3
		f 4 10 4 6 8
		mu 0 4 12 0 2 13;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "pCube7";
	setAttr ".t" -type "double3" 308.29853713110828 -3335.842054457989 1942.3008157005297 ;
createNode mesh -n "pCubeShape7" -p "pCube7";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".pv" -type "double2" 0.5 0.625 ;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 8 ".pt[0:7]" -type "float3"  -8227.001 0 12248.181 13215.686 
		0 12248.181 -8227 -2249.6741 12248.181 13215.686 -2249.6741 12248.181 -8227 -2249.6741 
		-2399.6257 13215.686 -2249.6741 -2399.6257 -8227.001 0 -2399.6257 13215.686 0 -2399.6257;
createNode transform -n "pSphere5";
	setAttr ".t" -type "double3" 1782.6082073715882 143.41864963415054 1410.6260192304239 ;
	setAttr ".s" -type "double3" 163.83740141626828 163.83740141626828 163.83740141626828 ;
createNode mesh -n "pSphereShape5" -p "pSphere5";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 23 ".uvst[0].uvsp[0:22]" -type "float2" 0 0.25 0.25 0.25
		 0.5 0.25 0.75 0.25 1 0.25 0 0.5 0.25 0.5 0.5 0.5 0.75 0.5 1 0.5 0 0.75 0.25 0.75
		 0.5 0.75 0.75 0.75 1 0.75 0.125 0 0.375 0 0.625 0 0.875 0 0.125 1 0.375 1 0.625 1
		 0.875 1;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 14 ".vt[0:13]"  9.2725848e-008 -0.70710677 -0.70710677 -0.70710677 -0.70710677 -6.1817239e-008
		 -3.090862e-008 -0.70710677 0.70710677 0.70710677 -0.70710677 0 1.3113416e-007 0 -1
		 -1 0 -8.7422777e-008 -4.3711388e-008 0 1 1 0 0 9.2725848e-008 0.70710677 -0.70710677
		 -0.70710677 0.70710677 -6.1817239e-008 -3.090862e-008 0.70710677 0.70710677 0.70710677 0.70710677 0
		 0 -1 0 0 1 0;
	setAttr -s 28 ".ed[0:27]"  0 1 0 1 2 0 2 3 0 3 0 0 4 5 0 5 6 0 6 7 0
		 7 4 0 8 9 0 9 10 0 10 11 0 11 8 0 0 4 0 1 5 0 2 6 0 3 7 0 4 8 0 5 9 0 6 10 0 7 11 0
		 12 0 0 12 1 0 12 2 0 12 3 0 8 13 0 9 13 0 10 13 0 11 13 0;
	setAttr -s 16 -ch 56 ".fc[0:15]" -type "polyFaces" 
		f 4 0 13 -5 -13
		mu 0 4 0 1 6 5
		f 4 1 14 -6 -14
		mu 0 4 1 2 7 6
		f 4 2 15 -7 -15
		mu 0 4 2 3 8 7
		f 4 3 12 -8 -16
		mu 0 4 3 4 9 8
		f 4 4 17 -9 -17
		mu 0 4 5 6 11 10
		f 4 5 18 -10 -18
		mu 0 4 6 7 12 11
		f 4 6 19 -11 -19
		mu 0 4 7 8 13 12
		f 4 7 16 -12 -20
		mu 0 4 8 9 14 13
		f 3 -1 -21 21
		mu 0 3 1 0 15
		f 3 -2 -22 22
		mu 0 3 2 1 16
		f 3 -3 -23 23
		mu 0 3 3 2 17
		f 3 -4 -24 20
		mu 0 3 4 3 18
		f 3 8 25 -25
		mu 0 3 10 11 19
		f 3 9 26 -26
		mu 0 3 11 12 20
		f 3 10 27 -27
		mu 0 3 12 13 21
		f 3 11 24 -28
		mu 0 3 13 14 22;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "pSphere6";
	setAttr ".t" -type "double3" 4395.5808749534535 143.41864963415256 2123.2117706889894 ;
	setAttr ".s" -type "double3" 163.83740141626828 163.83740141626828 163.83740141626828 ;
createNode mesh -n "pSphereShape6" -p "pSphere6";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 23 ".uvst[0].uvsp[0:22]" -type "float2" 0 0.25 0.25 0.25
		 0.5 0.25 0.75 0.25 1 0.25 0 0.5 0.25 0.5 0.5 0.5 0.75 0.5 1 0.5 0 0.75 0.25 0.75
		 0.5 0.75 0.75 0.75 1 0.75 0.125 0 0.375 0 0.625 0 0.875 0 0.125 1 0.375 1 0.625 1
		 0.875 1;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 14 ".vt[0:13]"  9.2725848e-008 -0.70710677 -0.70710677 -0.70710677 -0.70710677 -6.1817239e-008
		 -3.090862e-008 -0.70710677 0.70710677 0.70710677 -0.70710677 0 1.3113416e-007 0 -1
		 -1 0 -8.7422777e-008 -4.3711388e-008 0 1 1 0 0 9.2725848e-008 0.70710677 -0.70710677
		 -0.70710677 0.70710677 -6.1817239e-008 -3.090862e-008 0.70710677 0.70710677 0.70710677 0.70710677 0
		 0 -1 0 0 1 0;
	setAttr -s 28 ".ed[0:27]"  0 1 0 1 2 0 2 3 0 3 0 0 4 5 0 5 6 0 6 7 0
		 7 4 0 8 9 0 9 10 0 10 11 0 11 8 0 0 4 0 1 5 0 2 6 0 3 7 0 4 8 0 5 9 0 6 10 0 7 11 0
		 12 0 0 12 1 0 12 2 0 12 3 0 8 13 0 9 13 0 10 13 0 11 13 0;
	setAttr -s 16 -ch 56 ".fc[0:15]" -type "polyFaces" 
		f 4 0 13 -5 -13
		mu 0 4 0 1 6 5
		f 4 1 14 -6 -14
		mu 0 4 1 2 7 6
		f 4 2 15 -7 -15
		mu 0 4 2 3 8 7
		f 4 3 12 -8 -16
		mu 0 4 3 4 9 8
		f 4 4 17 -9 -17
		mu 0 4 5 6 11 10
		f 4 5 18 -10 -18
		mu 0 4 6 7 12 11
		f 4 6 19 -11 -19
		mu 0 4 7 8 13 12
		f 4 7 16 -12 -20
		mu 0 4 8 9 14 13
		f 3 -1 -21 21
		mu 0 3 1 0 15
		f 3 -2 -22 22
		mu 0 3 2 1 16
		f 3 -3 -23 23
		mu 0 3 3 2 17
		f 3 -4 -24 20
		mu 0 3 4 3 18
		f 3 8 25 -25
		mu 0 3 10 11 19
		f 3 9 26 -26
		mu 0 3 11 12 20
		f 3 10 27 -27
		mu 0 3 12 13 21
		f 3 11 24 -28
		mu 0 3 13 14 22;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "pCube8";
	setAttr ".t" -type "double3" 4430.8661220376716 607.58851615947219 2116.6606598092035 ;
	setAttr ".s" -type "double3" 0.59184691039520954 1 0.59184691039520954 ;
	setAttr ".rp" -type "double3" 9.0949470177292814e-013 -400.2649637938369 -4.5474735088646407e-013 ;
	setAttr ".sp" -type "double3" 1.5367060058919751e-012 -400.2649637938369 -7.6835300294598756e-013 ;
	setAttr ".spt" -type "double3" -6.2721130411904699e-013 0 3.1360565205952349e-013 ;
createNode mesh -n "pCubeShape8" -p "pCube8";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".pv" -type "double2" 0.5 0.375 ;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 4 ".pt[2:5]" -type "float3"  0 369.12512 -1.1368684e-013 
		0 369.12512 -1.1368684e-013 0 369.12512 -1.1368684e-013 0 369.12512 -1.1368684e-013;
createNode transform -n "pCube9";
	setAttr ".t" -type "double3" 3999.1111097061071 61.621724171179764 3429.3767268774195 ;
	setAttr ".s" -type "double3" 2.4197112143170063 1 1.4337180316053189 ;
createNode mesh -n "pCubeShape9" -p "pCube9";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".pv" -type "double2" 0.75 0.125 ;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 14 ".uvst[0].uvsp[0:13]" -type "float2" 0.375 0 0.625 0 0.375
		 0.25 0.625 0.25 0.375 0.5 0.625 0.5 0.375 0.75 0.625 0.75 0.375 1 0.625 1 0.875 0
		 0.875 0.25 0.125 0 0.125 0.25;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 8 ".pt[0:7]" -type "float3"  0 -4221.8242 486.15054 295.58154 
		-4221.8242 486.15054 0 0 486.15054 295.58154 0 486.15054 0 0 -96.458008 295.58154 
		0 -96.458008 0 -4221.8242 -96.458008 295.58154 -4221.8242 -96.458008;
	setAttr -s 8 ".vt[0:7]"  -159.027389526 -85.52788544 171.84742737
		 159.027389526 -85.52788544 171.84742737 -159.027389526 85.52788544 171.84742737 159.027389526 85.52788544 171.84742737
		 -159.027389526 85.52788544 -171.84742737 159.027389526 85.52788544 -171.84742737
		 -159.027389526 -85.52788544 -171.84742737 159.027389526 -85.52788544 -171.84742737;
	setAttr -s 12 ".ed[0:11]"  0 1 0 2 3 0 4 5 0 6 7 0 0 2 0 1 3 0 2 4 0
		 3 5 0 4 6 0 5 7 0 6 0 0 7 1 0;
	setAttr -s 6 -ch 24 ".fc[0:5]" -type "polyFaces" 
		f 4 0 5 -2 -5
		mu 0 4 0 1 3 2
		f 4 1 7 -3 -7
		mu 0 4 2 3 5 4
		f 4 2 9 -4 -9
		mu 0 4 4 5 7 6
		f 4 3 11 -1 -11
		mu 0 4 6 7 9 8
		f 4 -12 -10 -8 -6
		mu 0 4 1 10 11 3
		f 4 10 4 6 8
		mu 0 4 12 0 2 13;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "pCube10";
	setAttr ".t" -type "double3" -1894.7723009891827 249.09762158840684 13399.555365744787 ;
	setAttr ".s" -type "double3" 151.6017315499096 1 151.6017315499096 ;
	setAttr ".rp" -type "double3" 3169.1733893433588 -2943.62841796875 -295.8974868518456 ;
	setAttr ".sp" -type "double3" 20.904598891735077 -2943.62841796875 -1.9518080949783325 ;
	setAttr ".spt" -type "double3" 3148.2687904516238 0 -293.94567875686727 ;
createNode mesh -n "pCubeShape10" -p "pCube10";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".pv" -type "double2" 0.5 0.125 ;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 14 ".uvst[0].uvsp[0:13]" -type "float2" 0.375 0 0.625 0 0.375
		 0.25 0.625 0.25 0.375 0.5 0.625 0.5 0.375 0.75 0.625 0.75 0.375 1 0.625 1 0.875 0
		 0.875 0.25 0.125 0 0.125 0.25;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 8 ".pt[0:7]" -type "float3"  1.5940489 -4663.25 7.0675759 
		40.215149 -4663.25 7.0675759 1.5940489 -1653.0432 7.0675759 40.215149 -1653.0432 
		7.0675759 1.5940489 -1653.0432 -5.9956493 40.215149 -1653.0432 -5.9956493 1.5940489 
		-4663.25 -5.9956493 40.215149 -4663.25 -5.9956493;
	setAttr -s 8 ".vt[0:7]"  -0.5 -0.5 0.5 0.5 -0.5 0.5 -0.5 0.5 0.5 0.5 0.5 0.5
		 -0.5 0.5 -0.5 0.5 0.5 -0.5 -0.5 -0.5 -0.5 0.5 -0.5 -0.5;
	setAttr -s 12 ".ed[0:11]"  0 1 0 2 3 0 4 5 0 6 7 0 0 2 0 1 3 0 2 4 0
		 3 5 0 4 6 0 5 7 0 6 0 0 7 1 0;
	setAttr -s 6 -ch 24 ".fc[0:5]" -type "polyFaces" 
		f 4 0 5 -2 -5
		mu 0 4 0 1 3 2
		f 4 1 7 -3 -7
		mu 0 4 2 3 5 4
		f 4 2 9 -4 -9
		mu 0 4 4 5 7 6
		f 4 3 11 -1 -11
		mu 0 4 6 7 9 8
		f 4 -12 -10 -8 -6
		mu 0 4 1 10 11 3
		f 4 10 4 6 8
		mu 0 4 12 0 2 13;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "pCube11";
	setAttr ".t" -type "double3" -1960.6177910632687 249.09762158840684 11416.576933342218 ;
	setAttr ".s" -type "double3" 151.6017315499096 1 151.6017315499096 ;
createNode mesh -n "pCubeShape11" -p "pCube11";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".pv" -type "double2" 0.5 0.125 ;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 14 ".uvst[0].uvsp[0:13]" -type "float2" 0.375 0 0.625 0 0.375
		 0.25 0.625 0.25 0.375 0.5 0.625 0.5 0.375 0.75 0.625 0.75 0.375 1 0.625 1 0.875 0
		 0.875 0.25 0.125 0 0.125 0.25;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 8 ".pt[0:7]" -type "float3"  1.5940489 -4663.25 6.9925413 
		21.923073 -4663.25 6.9925413 1.5940489 2567.3628 6.9925413 21.923073 2567.3628 6.9925413 
		1.5940489 2567.3628 -10.70265 21.923073 2567.3628 -10.70265 1.5940489 -4663.25 -10.70265 
		21.923073 -4663.25 -10.70265;
	setAttr -s 8 ".vt[0:7]"  -0.5 -0.5 0.5 0.5 -0.5 0.5 -0.5 0.5 0.5 0.5 0.5 0.5
		 -0.5 0.5 -0.5 0.5 0.5 -0.5 -0.5 -0.5 -0.5 0.5 -0.5 -0.5;
	setAttr -s 12 ".ed[0:11]"  0 1 0 2 3 0 4 5 0 6 7 0 0 2 0 1 3 0 2 4 0
		 3 5 0 4 6 0 5 7 0 6 0 0 7 1 0;
	setAttr -s 6 -ch 24 ".fc[0:5]" -type "polyFaces" 
		f 4 0 5 -2 -5
		mu 0 4 0 1 3 2
		f 4 1 7 -3 -7
		mu 0 4 2 3 5 4
		f 4 2 9 -4 -9
		mu 0 4 4 5 7 6
		f 4 3 11 -1 -11
		mu 0 4 6 7 9 8
		f 4 -12 -10 -8 -6
		mu 0 4 1 10 11 3
		f 4 10 4 6 8
		mu 0 4 12 0 2 13;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "pCube12";
	setAttr ".t" -type "double3" 1171.410045282365 249.09762158841968 6089.4495915293101 ;
	setAttr ".s" -type "double3" 151.6017315499096 1 151.6017315499096 ;
createNode mesh -n "pCubeShape12" -p "pCube12";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".pv" -type "double2" 0.5 0.125 ;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 14 ".uvst[0].uvsp[0:13]" -type "float2" 0.375 0 0.625 0 0.375
		 0.25 0.625 0.25 0.375 0.5 0.625 0.5 0.375 0.75 0.625 0.75 0.375 1 0.625 1 0.875 0
		 0.875 0.25 0.125 0 0.125 0.25;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 8 ".pt[0:7]" -type "float3"  12.084187 -4663.25 5.3723526 
		35.929718 -4663.25 5.3723526 12.084187 2567.3628 5.3723526 35.929718 2567.3628 5.3723526 
		12.084187 2567.3628 -10.70265 35.929718 2567.3628 -10.70265 12.084187 -4663.25 -10.70265 
		35.929718 -4663.25 -10.70265;
	setAttr -s 8 ".vt[0:7]"  -0.5 -0.5 0.5 0.5 -0.5 0.5 -0.5 0.5 0.5 0.5 0.5 0.5
		 -0.5 0.5 -0.5 0.5 0.5 -0.5 -0.5 -0.5 -0.5 0.5 -0.5 -0.5;
	setAttr -s 12 ".ed[0:11]"  0 1 0 2 3 0 4 5 0 6 7 0 0 2 0 1 3 0 2 4 0
		 3 5 0 4 6 0 5 7 0 6 0 0 7 1 0;
	setAttr -s 6 -ch 24 ".fc[0:5]" -type "polyFaces" 
		f 4 0 5 -2 -5
		mu 0 4 0 1 3 2
		f 4 1 7 -3 -7
		mu 0 4 2 3 5 4
		f 4 2 9 -4 -9
		mu 0 4 4 5 7 6
		f 4 3 11 -1 -11
		mu 0 4 6 7 9 8
		f 4 -12 -10 -8 -6
		mu 0 4 1 10 11 3
		f 4 10 4 6 8
		mu 0 4 12 0 2 13;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "pCube13";
	setAttr ".t" -type "double3" 5607.4387028197807 -86.500113140883641 3456.7341534439106 ;
	setAttr ".s" -type "double3" 2.4197112143170063 1 1.4337180316053189 ;
createNode mesh -n "pCubeShape13" -p "pCube13";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".pv" -type "double2" 0.5 0.625 ;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 14 ".uvst[0].uvsp[0:13]" -type "float2" 0.375 0 0.625 0 0.375
		 0.25 0.625 0.25 0.375 0.5 0.625 0.5 0.375 0.75 0.625 0.75 0.375 1 0.625 1 0.875 0
		 0.875 0.25 0.125 0 0.125 0.25;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 8 ".pt[0:7]" -type "float3"  0 -4221.8242 486.15054 295.58154 
		-4221.8242 486.15054 0 -211.91428 486.15054 295.58154 -211.91428 486.15054 0 -211.91428 
		167.56078 295.58154 -211.91428 167.56078 0 -4221.8242 167.56078 295.58154 -4221.8242 
		167.56078;
	setAttr -s 8 ".vt[0:7]"  -159.027389526 -85.52788544 171.84742737
		 159.027389526 -85.52788544 171.84742737 -159.027389526 85.52788544 171.84742737 159.027389526 85.52788544 171.84742737
		 -159.027389526 85.52788544 -171.84742737 159.027389526 85.52788544 -171.84742737
		 -159.027389526 -85.52788544 -171.84742737 159.027389526 -85.52788544 -171.84742737;
	setAttr -s 12 ".ed[0:11]"  0 1 0 2 3 0 4 5 0 6 7 0 0 2 0 1 3 0 2 4 0
		 3 5 0 4 6 0 5 7 0 6 0 0 7 1 0;
	setAttr -s 6 -ch 24 ".fc[0:5]" -type "polyFaces" 
		f 4 0 5 -2 -5
		mu 0 4 0 1 3 2
		f 4 1 7 -3 -7
		mu 0 4 2 3 5 4
		f 4 2 9 -4 -9
		mu 0 4 4 5 7 6
		f 4 3 11 -1 -11
		mu 0 4 6 7 9 8
		f 4 -12 -10 -8 -6
		mu 0 4 1 10 11 3
		f 4 10 4 6 8
		mu 0 4 12 0 2 13;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "pCube14";
	setAttr ".t" -type "double3" 6520.866176602025 72.311431589932283 4342.120403454669 ;
createNode mesh -n "pCubeShape14" -p "pCube14";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".pv" -type "double2" 0.75 0.125 ;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 6 ".pt";
	setAttr ".pt[1]" -type "float3" 97.715668 0 0 ;
	setAttr ".pt[2]" -type "float3" 0 -62.922607 0 ;
	setAttr ".pt[3]" -type "float3" 97.715668 -62.922607 0 ;
	setAttr ".pt[4]" -type "float3" 0 -62.922607 0 ;
	setAttr ".pt[5]" -type "float3" 97.715668 -62.922607 0 ;
	setAttr ".pt[7]" -type "float3" 97.715668 0 0 ;
createNode transform -n "pCube15";
	setAttr ".t" -type "double3" 6899.6827629766958 72.311431589932511 4439.3794811488133 ;
	setAttr ".r" -type "double3" 0 -36.01230066028959 0 ;
createNode mesh -n "pCubeShape15" -p "pCube15";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".pv" -type "double2" 0.5 0.625 ;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 14 ".uvst[0].uvsp[0:13]" -type "float2" 0.375 0 0.625 0 0.375
		 0.25 0.625 0.25 0.375 0.5 0.625 0.5 0.375 0.75 0.625 0.75 0.375 1 0.625 1 0.875 0
		 0.875 0.25 0.125 0 0.125 0.25;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 6 ".pt";
	setAttr ".pt[1]" -type "float3" 815.30237 0 -9.094947e-013 ;
	setAttr ".pt[2]" -type "float3" 0 -62.922607 0 ;
	setAttr ".pt[3]" -type "float3" 815.30237 -62.922607 -9.094947e-013 ;
	setAttr ".pt[4]" -type "float3" 0 -62.922607 0 ;
	setAttr ".pt[5]" -type "float3" 815.30237 -62.922607 -9.094947e-013 ;
	setAttr ".pt[7]" -type "float3" 815.30237 0 -9.094947e-013 ;
	setAttr -s 8 ".vt[0:7]"  -200.81402588 -44.30101013 67.25222778 200.81402588 -44.30101013 67.25222778
		 -200.81402588 44.30101013 67.25222778 200.81402588 44.30101013 67.25222778 -200.81402588 44.30101013 -67.25222778
		 200.81402588 44.30101013 -67.25222778 -200.81402588 -44.30101013 -67.25222778 200.81402588 -44.30101013 -67.25222778;
	setAttr -s 12 ".ed[0:11]"  0 1 0 2 3 0 4 5 0 6 7 0 0 2 0 1 3 0 2 4 0
		 3 5 0 4 6 0 5 7 0 6 0 0 7 1 0;
	setAttr -s 6 -ch 24 ".fc[0:5]" -type "polyFaces" 
		f 4 0 5 -2 -5
		mu 0 4 0 1 3 2
		f 4 1 7 -3 -7
		mu 0 4 2 3 5 4
		f 4 2 9 -4 -9
		mu 0 4 4 5 7 6
		f 4 3 11 -1 -11
		mu 0 4 6 7 9 8
		f 4 -12 -10 -8 -6
		mu 0 4 1 10 11 3
		f 4 10 4 6 8
		mu 0 4 12 0 2 13;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "pCube16";
	setAttr ".t" -type "double3" 3368.2575047365099 249.09762158842059 6455.7042443733217 ;
	setAttr ".r" -type "double3" 0 54.085261307513214 0 ;
	setAttr ".s" -type "double3" 151.6017315499096 1 151.6017315499096 ;
	setAttr ".rp" -type "double3" 3520.8100317607509 -1047.943603515625 -1081.0516588119849 ;
	setAttr ".rpt" -type "double3" -48.383938977184748 0 -146.56106469781088 ;
	setAttr ".sp" -type "double3" 23.224075317382812 -1047.943603515625 -7.1308661699295044 ;
	setAttr ".spt" -type "double3" 3497.5859564433681 0 -1073.9207926420554 ;
createNode mesh -n "pCubeShape16" -p "pCube16";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".pv" -type "double2" 0.5 0.125 ;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 14 ".uvst[0].uvsp[0:13]" -type "float2" 0.375 0 0.625 0 0.375
		 0.25 0.625 0.25 0.375 0.5 0.625 0.5 0.375 0.75 0.625 0.75 0.375 1 0.625 1 0.875 0
		 0.875 0.25 0.125 0 0.125 0.25;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 8 ".pt[0:7]" -type "float3"  19.628298 -4663.25 -3.5590823 
		26.819853 -4663.25 -3.5590823 19.628298 2567.3628 -3.5590823 26.819853 2567.3628 
		-3.5590823 19.628298 2567.3628 -10.70265 26.819853 2567.3628 -10.70265 19.628298 
		-4663.25 -10.70265 26.819853 -4663.25 -10.70265;
	setAttr -s 8 ".vt[0:7]"  -0.5 -0.5 0.5 0.5 -0.5 0.5 -0.5 0.5 0.5 0.5 0.5 0.5
		 -0.5 0.5 -0.5 0.5 0.5 -0.5 -0.5 -0.5 -0.5 0.5 -0.5 -0.5;
	setAttr -s 12 ".ed[0:11]"  0 1 0 2 3 0 4 5 0 6 7 0 0 2 0 1 3 0 2 4 0
		 3 5 0 4 6 0 5 7 0 6 0 0 7 1 0;
	setAttr -s 6 -ch 24 ".fc[0:5]" -type "polyFaces" 
		f 4 0 5 -2 -5
		mu 0 4 0 1 3 2
		f 4 1 7 -3 -7
		mu 0 4 2 3 5 4
		f 4 2 9 -4 -9
		mu 0 4 4 5 7 6
		f 4 3 11 -1 -11
		mu 0 4 6 7 9 8
		f 4 -12 -10 -8 -6
		mu 0 4 1 10 11 3
		f 4 10 4 6 8
		mu 0 4 12 0 2 13;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "pCube17";
	setAttr ".t" -type "double3" 7691.24171324709 72.311431589932511 5189.0503116245773 ;
	setAttr ".r" -type "double3" 0 -126.0627843823636 0 ;
createNode mesh -n "pCubeShape17" -p "pCube17";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".pv" -type "double2" 0.75 0.125 ;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 14 ".uvst[0].uvsp[0:13]" -type "float2" 0.375 0 0.625 0 0.375
		 0.25 0.625 0.25 0.375 0.5 0.625 0.5 0.375 0.75 0.625 0.75 0.375 1 0.625 1 0.875 0
		 0.875 0.25 0.125 0 0.125 0.25;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 6 ".pt";
	setAttr ".pt[1]" -type "float3" 945.01428 0 0 ;
	setAttr ".pt[2]" -type "float3" 0 -62.922607 0 ;
	setAttr ".pt[3]" -type "float3" 945.01428 -62.922607 0 ;
	setAttr ".pt[4]" -type "float3" 0 -62.922607 0 ;
	setAttr ".pt[5]" -type "float3" 945.01428 -62.922607 0 ;
	setAttr ".pt[7]" -type "float3" 945.01428 0 0 ;
	setAttr -s 8 ".vt[0:7]"  -200.81402588 -44.30101013 67.25222778 200.81402588 -44.30101013 67.25222778
		 -200.81402588 44.30101013 67.25222778 200.81402588 44.30101013 67.25222778 -200.81402588 44.30101013 -67.25222778
		 200.81402588 44.30101013 -67.25222778 -200.81402588 -44.30101013 -67.25222778 200.81402588 -44.30101013 -67.25222778;
	setAttr -s 12 ".ed[0:11]"  0 1 0 2 3 0 4 5 0 6 7 0 0 2 0 1 3 0 2 4 0
		 3 5 0 4 6 0 5 7 0 6 0 0 7 1 0;
	setAttr -s 6 -ch 24 ".fc[0:5]" -type "polyFaces" 
		f 4 0 5 -2 -5
		mu 0 4 0 1 3 2
		f 4 1 7 -3 -7
		mu 0 4 2 3 5 4
		f 4 2 9 -4 -9
		mu 0 4 4 5 7 6
		f 4 3 11 -1 -11
		mu 0 4 6 7 9 8
		f 4 -12 -10 -8 -6
		mu 0 4 1 10 11 3
		f 4 10 4 6 8
		mu 0 4 12 0 2 13;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "pCube18";
	setAttr ".t" -type "double3" 7216.5501276978985 -86.500113140883869 6168.8305632925367 ;
	setAttr ".r" -type "double3" 0 -87.267864352666152 0 ;
	setAttr ".s" -type "double3" 2.4197112143170063 1 1.4337180316053189 ;
createNode mesh -n "pCubeShape18" -p "pCube18";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".pv" -type "double2" 0.5 0.625 ;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 14 ".uvst[0].uvsp[0:13]" -type "float2" 0.375 0 0.625 0 0.375
		 0.25 0.625 0.25 0.375 0.5 0.625 0.5 0.375 0.75 0.625 0.75 0.375 1 0.625 1 0.875 0
		 0.875 0.25 0.125 0 0.125 0.25;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 8 ".pt[0:7]" -type "float3"  0 -4221.8242 486.15054 295.58154 
		-4221.8242 486.15054 0 -211.91428 486.15054 295.58154 -211.91428 486.15054 0 -211.91428 
		167.56078 295.58154 -211.91428 167.56078 0 -4221.8242 167.56078 295.58154 -4221.8242 
		167.56078;
	setAttr -s 8 ".vt[0:7]"  -159.027389526 -85.52788544 171.84742737
		 159.027389526 -85.52788544 171.84742737 -159.027389526 85.52788544 171.84742737 159.027389526 85.52788544 171.84742737
		 -159.027389526 85.52788544 -171.84742737 159.027389526 85.52788544 -171.84742737
		 -159.027389526 -85.52788544 -171.84742737 159.027389526 -85.52788544 -171.84742737;
	setAttr -s 12 ".ed[0:11]"  0 1 0 2 3 0 4 5 0 6 7 0 0 2 0 1 3 0 2 4 0
		 3 5 0 4 6 0 5 7 0 6 0 0 7 1 0;
	setAttr -s 6 -ch 24 ".fc[0:5]" -type "polyFaces" 
		f 4 0 5 -2 -5
		mu 0 4 0 1 3 2
		f 4 1 7 -3 -7
		mu 0 4 2 3 5 4
		f 4 2 9 -4 -9
		mu 0 4 4 5 7 6
		f 4 3 11 -1 -11
		mu 0 4 6 7 9 8
		f 4 -12 -10 -8 -6
		mu 0 4 1 10 11 3
		f 4 10 4 6 8
		mu 0 4 12 0 2 13;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "pCube19";
	setAttr ".t" -type "double3" 6976.0437453315608 -301.48609909024282 7044.6976469326928 ;
	setAttr ".r" -type "double3" 0 -178.44969114740164 0 ;
	setAttr ".s" -type "double3" 2.4197112143170063 1 1.4337180316053189 ;
	setAttr ".rp" -type "double3" 357.61100559423573 -2216.8692207336426 468.61886367409704 ;
	setAttr ".rpt" -type "double3" -808.65105466549517 0 -89.076843803940321 ;
	setAttr ".sp" -type "double3" 147.79077911376953 -2216.8692207336426 326.85566711425781 ;
	setAttr ".spt" -type "double3" 209.8202264804662 0 141.76319655983923 ;
createNode mesh -n "pCubeShape19" -p "pCube19";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".pv" -type "double2" 0.5 0.625 ;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 14 ".uvst[0].uvsp[0:13]" -type "float2" 0.375 0 0.625 0 0.375
		 0.25 0.625 0.25 0.375 0.5 0.625 0.5 0.375 0.75 0.625 0.75 0.375 1 0.625 1 0.875 0
		 0.875 0.25 0.125 0 0.125 0.25;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 8 ".pt[0:7]" -type "float3"  0 -4221.8242 486.15054 295.58154 
		-4221.8242 486.15054 0 -211.91428 486.15054 295.58154 -211.91428 486.15054 4.5474735e-013 
		-211.91428 -69.560898 295.58154 -211.91428 -69.560898 4.5474735e-013 -4221.8242 -69.560898 
		295.58154 -4221.8242 -69.560898;
	setAttr -s 8 ".vt[0:7]"  -159.027389526 -85.52788544 171.84742737
		 159.027389526 -85.52788544 171.84742737 -159.027389526 85.52788544 171.84742737 159.027389526 85.52788544 171.84742737
		 -159.027389526 85.52788544 -171.84742737 159.027389526 85.52788544 -171.84742737
		 -159.027389526 -85.52788544 -171.84742737 159.027389526 -85.52788544 -171.84742737;
	setAttr -s 12 ".ed[0:11]"  0 1 0 2 3 0 4 5 0 6 7 0 0 2 0 1 3 0 2 4 0
		 3 5 0 4 6 0 5 7 0 6 0 0 7 1 0;
	setAttr -s 6 -ch 24 ".fc[0:5]" -type "polyFaces" 
		f 4 0 5 -2 -5
		mu 0 4 0 1 3 2
		f 4 1 7 -3 -7
		mu 0 4 2 3 5 4
		f 4 2 9 -4 -9
		mu 0 4 4 5 7 6
		f 4 3 11 -1 -11
		mu 0 4 6 7 9 8
		f 4 -12 -10 -8 -6
		mu 0 4 1 10 11 3
		f 4 10 4 6 8
		mu 0 4 12 0 2 13;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "pCube20";
	setAttr ".t" -type "double3" 2352.4761505763927 249.09762158841968 10861.986163187528 ;
	setAttr ".s" -type "double3" 151.6017315499096 1 151.6017315499096 ;
createNode mesh -n "pCubeShape20" -p "pCube20";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".pv" -type "double2" 0.75 0.125 ;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 14 ".uvst[0].uvsp[0:13]" -type "float2" 0.375 0 0.625 0 0.375
		 0.25 0.625 0.25 0.375 0.5 0.625 0.5 0.375 0.75 0.625 0.75 0.375 1 0.625 1 0.875 0
		 0.875 0.25 0.125 0 0.125 0.25;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 8 ".pt[0:7]" -type "float3"  12.084184 -4663.25 -4.788641 
		20.107758 -4663.25 -4.788641 12.084184 2567.3628 -4.788641 20.107758 2567.3628 -4.788641 
		12.084187 2567.3628 -10.70265 20.10775 2567.3628 -10.70265 12.084187 -4663.25 -10.70265 
		20.10775 -4663.25 -10.70265;
	setAttr -s 8 ".vt[0:7]"  -0.5 -0.5 0.5 0.5 -0.5 0.5 -0.5 0.5 0.5 0.5 0.5 0.5
		 -0.5 0.5 -0.5 0.5 0.5 -0.5 -0.5 -0.5 -0.5 0.5 -0.5 -0.5;
	setAttr -s 12 ".ed[0:11]"  0 1 0 2 3 0 4 5 0 6 7 0 0 2 0 1 3 0 2 4 0
		 3 5 0 4 6 0 5 7 0 6 0 0 7 1 0;
	setAttr -s 6 -ch 24 ".fc[0:5]" -type "polyFaces" 
		f 4 0 5 -2 -5
		mu 0 4 0 1 3 2
		f 4 1 7 -3 -7
		mu 0 4 2 3 5 4
		f 4 2 9 -4 -9
		mu 0 4 4 5 7 6
		f 4 3 11 -1 -11
		mu 0 4 6 7 9 8
		f 4 -12 -10 -8 -6
		mu 0 4 1 10 11 3
		f 4 10 4 6 8
		mu 0 4 12 0 2 13;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "pCube21";
	setAttr ".t" -type "double3" 4872.5276422524148 72.311431589932027 8729.6899992441449 ;
	setAttr ".r" -type "double3" 0 -178.86972969164043 0 ;
	setAttr ".rp" -type "double3" 472.50717163085937 -31.4613037109375 0 ;
	setAttr ".rpt" -type "double3" -750.65863711406985 0 381.9617644374066 ;
	setAttr ".sp" -type "double3" 472.50717163085937 -31.4613037109375 0 ;
createNode mesh -n "pCubeShape21" -p "pCube21";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".pv" -type "double2" 0.25 0.125 ;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 14 ".uvst[0].uvsp[0:13]" -type "float2" 0.375 0 0.625 0 0.375
		 0.25 0.625 0.25 0.375 0.5 0.625 0.5 0.375 0.75 0.625 0.75 0.375 1 0.625 1 0.875 0
		 0.875 0.25 0.125 0 0.125 0.25;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 8 ".pt[0:7]" -type "float3"  -273.68521 0 1.8189894e-012 
		945.01428 0 0 -273.68521 -62.922607 1.8189894e-012 945.01428 -62.922607 0 -273.68521 
		-62.922607 1.8189894e-012 945.01428 -62.922607 0 -273.68521 0 1.8189894e-012 945.01428 
		0 0;
	setAttr -s 8 ".vt[0:7]"  -200.81402588 -44.30101013 67.25222778 200.81402588 -44.30101013 67.25222778
		 -200.81402588 44.30101013 67.25222778 200.81402588 44.30101013 67.25222778 -200.81402588 44.30101013 -67.25222778
		 200.81402588 44.30101013 -67.25222778 -200.81402588 -44.30101013 -67.25222778 200.81402588 -44.30101013 -67.25222778;
	setAttr -s 12 ".ed[0:11]"  0 1 0 2 3 0 4 5 0 6 7 0 0 2 0 1 3 0 2 4 0
		 3 5 0 4 6 0 5 7 0 6 0 0 7 1 0;
	setAttr -s 6 -ch 24 ".fc[0:5]" -type "polyFaces" 
		f 4 0 5 -2 -5
		mu 0 4 0 1 3 2
		f 4 1 7 -3 -7
		mu 0 4 2 3 5 4
		f 4 2 9 -4 -9
		mu 0 4 4 5 7 6
		f 4 3 11 -1 -11
		mu 0 4 6 7 9 8
		f 4 -12 -10 -8 -6
		mu 0 4 1 10 11 3
		f 4 10 4 6 8
		mu 0 4 12 0 2 13;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "pCube22";
	setAttr ".t" -type "double3" 1168.7418647474433 249.09762158841968 10861.986163187526 ;
	setAttr ".s" -type "double3" 151.6017315499096 1 151.6017315499096 ;
	setAttr ".rp" -type "double3" 2337.9655320155994 -1047.943603515625 -1174.2532732694128 ;
	setAttr ".sp" -type "double3" 15.421760082244873 -1047.943603515625 -7.7456455230712891 ;
	setAttr ".spt" -type "double3" 2322.5437719333545 0 -1166.5076277463415 ;
createNode mesh -n "pCubeShape22" -p "pCube22";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".pv" -type "double2" 0.5 0.625 ;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 14 ".uvst[0].uvsp[0:13]" -type "float2" 0.375 0 0.625 0 0.375
		 0.25 0.625 0.25 0.375 0.5 0.625 0.5 0.375 0.75 0.625 0.75 0.375 1 0.625 1 0.875 0
		 0.875 0.25 0.125 0 0.125 0.25;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 8 ".pt[0:7]" -type "float3"  14.042612 -4663.25 -4.788641 
		18.759336 -4663.25 -4.788641 14.042612 -729.8999 -4.788641 18.759336 -729.8999 -4.788641 
		14.042615 -729.8999 -12.167239 18.759329 -729.8999 -12.167239 14.042615 -4663.25 
		-12.167239 18.759329 -4663.25 -12.167239;
	setAttr -s 8 ".vt[0:7]"  -0.5 -0.5 0.5 0.5 -0.5 0.5 -0.5 0.5 0.5 0.5 0.5 0.5
		 -0.5 0.5 -0.5 0.5 0.5 -0.5 -0.5 -0.5 -0.5 0.5 -0.5 -0.5;
	setAttr -s 12 ".ed[0:11]"  0 1 0 2 3 0 4 5 0 6 7 0 0 2 0 1 3 0 2 4 0
		 3 5 0 4 6 0 5 7 0 6 0 0 7 1 0;
	setAttr -s 6 -ch 24 ".fc[0:5]" -type "polyFaces" 
		f 4 0 5 -2 -5
		mu 0 4 0 1 3 2
		f 4 1 7 -3 -7
		mu 0 4 2 3 5 4
		f 4 2 9 -4 -9
		mu 0 4 4 5 7 6
		f 4 3 11 -1 -11
		mu 0 4 6 7 9 8
		f 4 -12 -10 -8 -6
		mu 0 4 1 10 11 3
		f 4 10 4 6 8
		mu 0 4 12 0 2 13;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "pSphere7";
	setAttr ".t" -type "double3" 6276.4785828016493 -300.94970807226906 8032.7949398757992 ;
	setAttr ".s" -type "double3" 163.83740141626828 163.83740141626828 163.83740141626828 ;
createNode mesh -n "pSphereShape7" -p "pSphere7";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 23 ".uvst[0].uvsp[0:22]" -type "float2" 0 0.25 0.25 0.25
		 0.5 0.25 0.75 0.25 1 0.25 0 0.5 0.25 0.5 0.5 0.5 0.75 0.5 1 0.5 0 0.75 0.25 0.75
		 0.5 0.75 0.75 0.75 1 0.75 0.125 0 0.375 0 0.625 0 0.875 0 0.125 1 0.375 1 0.625 1
		 0.875 1;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 14 ".vt[0:13]"  9.2725848e-008 -0.70710677 -0.70710677 -0.70710677 -0.70710677 -6.1817239e-008
		 -3.090862e-008 -0.70710677 0.70710677 0.70710677 -0.70710677 0 1.3113416e-007 0 -1
		 -1 0 -8.7422777e-008 -4.3711388e-008 0 1 1 0 0 9.2725848e-008 0.70710677 -0.70710677
		 -0.70710677 0.70710677 -6.1817239e-008 -3.090862e-008 0.70710677 0.70710677 0.70710677 0.70710677 0
		 0 -1 0 0 1 0;
	setAttr -s 28 ".ed[0:27]"  0 1 0 1 2 0 2 3 0 3 0 0 4 5 0 5 6 0 6 7 0
		 7 4 0 8 9 0 9 10 0 10 11 0 11 8 0 0 4 0 1 5 0 2 6 0 3 7 0 4 8 0 5 9 0 6 10 0 7 11 0
		 12 0 0 12 1 0 12 2 0 12 3 0 8 13 0 9 13 0 10 13 0 11 13 0;
	setAttr -s 16 -ch 56 ".fc[0:15]" -type "polyFaces" 
		f 4 0 13 -5 -13
		mu 0 4 0 1 6 5
		f 4 1 14 -6 -14
		mu 0 4 1 2 7 6
		f 4 2 15 -7 -15
		mu 0 4 2 3 8 7
		f 4 3 12 -8 -16
		mu 0 4 3 4 9 8
		f 4 4 17 -9 -17
		mu 0 4 5 6 11 10
		f 4 5 18 -10 -18
		mu 0 4 6 7 12 11
		f 4 6 19 -11 -19
		mu 0 4 7 8 13 12
		f 4 7 16 -12 -20
		mu 0 4 8 9 14 13
		f 3 -1 -21 21
		mu 0 3 1 0 15
		f 3 -2 -22 22
		mu 0 3 2 1 16
		f 3 -3 -23 23
		mu 0 3 3 2 17
		f 3 -4 -24 20
		mu 0 3 4 3 18
		f 3 8 25 -25
		mu 0 3 10 11 19
		f 3 9 26 -26
		mu 0 3 11 12 20
		f 3 10 27 -27
		mu 0 3 12 13 21
		f 3 11 24 -28
		mu 0 3 13 14 22;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "pCube23";
	setAttr ".t" -type "double3" 6509.3544015575199 -301.48609909024253 8749.4178478671438 ;
	setAttr ".r" -type "double3" 0 -178.44969114740164 0 ;
	setAttr ".s" -type "double3" 2.4197112143170063 1 1.4337180316053189 ;
	setAttr ".rp" -type "double3" 357.61100559423573 -2216.8692207336426 468.61886367409704 ;
	setAttr ".rpt" -type "double3" -808.65105466549517 0 -89.076843803940321 ;
	setAttr ".sp" -type "double3" 147.79077911376953 -2216.8692207336426 326.85566711425781 ;
	setAttr ".spt" -type "double3" 209.8202264804662 0 141.76319655983923 ;
createNode mesh -n "pCubeShape23" -p "pCube23";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".pv" -type "double2" 0.5 0.625 ;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 14 ".uvst[0].uvsp[0:13]" -type "float2" 0.375 0 0.625 0 0.375
		 0.25 0.625 0.25 0.375 0.5 0.625 0.5 0.375 0.75 0.625 0.75 0.375 1 0.625 1 0.875 0
		 0.875 0.25 0.125 0 0.125 0.25;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 8 ".pt[0:7]" -type "float3"  0 -4221.8242 486.15054 295.58154 
		-4221.8242 486.15054 0 -211.91428 486.15054 295.58154 -211.91428 486.15054 4.5474735e-013 
		-211.91428 299.8945 295.58154 -211.91428 299.8945 4.5474735e-013 -4221.8242 299.8945 
		295.58154 -4221.8242 299.8945;
	setAttr -s 8 ".vt[0:7]"  -159.027389526 -85.52788544 171.84742737
		 159.027389526 -85.52788544 171.84742737 -159.027389526 85.52788544 171.84742737 159.027389526 85.52788544 171.84742737
		 -159.027389526 85.52788544 -171.84742737 159.027389526 85.52788544 -171.84742737
		 -159.027389526 -85.52788544 -171.84742737 159.027389526 -85.52788544 -171.84742737;
	setAttr -s 12 ".ed[0:11]"  0 1 0 2 3 0 4 5 0 6 7 0 0 2 0 1 3 0 2 4 0
		 3 5 0 4 6 0 5 7 0 6 0 0 7 1 0;
	setAttr -s 6 -ch 24 ".fc[0:5]" -type "polyFaces" 
		f 4 0 5 -2 -5
		mu 0 4 0 1 3 2
		f 4 1 7 -3 -7
		mu 0 4 2 3 5 4
		f 4 2 9 -4 -9
		mu 0 4 4 5 7 6
		f 4 3 11 -1 -11
		mu 0 4 6 7 9 8
		f 4 -12 -10 -8 -6
		mu 0 4 1 10 11 3
		f 4 10 4 6 8
		mu 0 4 12 0 2 13;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "pCube24";
	setAttr ".t" -type "double3" -243.92359141603657 2464.035053375283 6093.9352235318947 ;
	setAttr ".r" -type "double3" 0 54.085261307513214 0 ;
	setAttr ".s" -type "double3" 111.81215849686258 1 111.81215849686258 ;
	setAttr ".rp" -type "double3" 3520.8100317607509 -1047.943603515625 -1081.0516588119849 ;
	setAttr ".rpt" -type "double3" -48.383938977184748 0 -146.56106469781088 ;
	setAttr ".sp" -type "double3" 23.224075317382812 -1047.943603515625 -7.1308661699295044 ;
	setAttr ".spt" -type "double3" 3497.5859564433681 0 -1073.9207926420554 ;
createNode mesh -n "pCubeShape24" -p "pCube24";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".pv" -type "double2" 0.5 0.375 ;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 14 ".uvst[0].uvsp[0:13]" -type "float2" 0.375 0 0.625 0 0.375
		 0.25 0.625 0.25 0.375 0.5 0.625 0.5 0.375 0.75 0.625 0.75 0.375 1 0.625 1 0.875 0
		 0.875 0.25 0.125 0 0.125 0.25;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 8 ".pt[0:7]" -type "float3"  19.628298 -4663.25 -3.5590823 
		26.819853 -4663.25 -3.5590823 19.628298 1914.6984 -3.5590823 26.819853 1914.6984 
		-3.5590823 19.628298 1914.6984 -10.70265 26.819853 1914.6984 -10.70265 19.628298 
		-4663.25 -10.70265 26.819853 -4663.25 -10.70265;
	setAttr -s 8 ".vt[0:7]"  -0.5 -0.5 0.5 0.5 -0.5 0.5 -0.5 0.5 0.5 0.5 0.5 0.5
		 -0.5 0.5 -0.5 0.5 0.5 -0.5 -0.5 -0.5 -0.5 0.5 -0.5 -0.5;
	setAttr -s 12 ".ed[0:11]"  0 1 0 2 3 0 4 5 0 6 7 0 0 2 0 1 3 0 2 4 0
		 3 5 0 4 6 0 5 7 0 6 0 0 7 1 0;
	setAttr -s 6 -ch 24 ".fc[0:5]" -type "polyFaces" 
		f 4 0 5 -2 -5
		mu 0 4 0 1 3 2
		f 4 1 7 -3 -7
		mu 0 4 2 3 5 4
		f 4 2 9 -4 -9
		mu 0 4 4 5 7 6
		f 4 3 11 -1 -11
		mu 0 4 6 7 9 8
		f 4 -12 -10 -8 -6
		mu 0 4 1 10 11 3
		f 4 10 4 6 8
		mu 0 4 12 0 2 13;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "pCube25";
	setAttr ".t" -type "double3" 3336.16208146076 2464.0350533753071 6356.8049941035715 ;
	setAttr ".r" -type "double3" 0 54.085261307513214 0 ;
	setAttr ".s" -type "double3" 111.81215849686258 1 111.81215849686258 ;
	setAttr ".rp" -type "double3" 3520.8100317607509 -1047.943603515625 -1081.0516588119849 ;
	setAttr ".rpt" -type "double3" -48.383938977184748 0 -146.56106469781088 ;
	setAttr ".sp" -type "double3" 23.224075317382812 -1047.943603515625 -7.1308661699295044 ;
	setAttr ".spt" -type "double3" 3497.5859564433681 0 -1073.9207926420554 ;
createNode mesh -n "pCubeShape25" -p "pCube25";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".pv" -type "double2" 0.5 0.375 ;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 14 ".uvst[0].uvsp[0:13]" -type "float2" 0.375 0 0.625 0 0.375
		 0.25 0.625 0.25 0.375 0.5 0.625 0.5 0.375 0.75 0.625 0.75 0.375 1 0.625 1 0.875 0
		 0.875 0.25 0.125 0 0.125 0.25;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 8 ".pt[0:7]" -type "float3"  19.628298 -4663.25 -3.5590823 
		26.819853 -4663.25 -3.5590823 19.628298 1914.6984 -3.5590823 26.819853 1914.6984 
		-3.5590823 19.628298 1914.6984 -10.70265 26.819853 1914.6984 -10.70265 19.628298 
		-4663.25 -10.70265 26.819853 -4663.25 -10.70265;
	setAttr -s 8 ".vt[0:7]"  -0.5 -0.5 0.5 0.5 -0.5 0.5 -0.5 0.5 0.5 0.5 0.5 0.5
		 -0.5 0.5 -0.5 0.5 0.5 -0.5 -0.5 -0.5 -0.5 0.5 -0.5 -0.5;
	setAttr -s 12 ".ed[0:11]"  0 1 0 2 3 0 4 5 0 6 7 0 0 2 0 1 3 0 2 4 0
		 3 5 0 4 6 0 5 7 0 6 0 0 7 1 0;
	setAttr -s 6 -ch 24 ".fc[0:5]" -type "polyFaces" 
		f 4 0 5 -2 -5
		mu 0 4 0 1 3 2
		f 4 1 7 -3 -7
		mu 0 4 2 3 5 4
		f 4 2 9 -4 -9
		mu 0 4 4 5 7 6
		f 4 3 11 -1 -11
		mu 0 4 6 7 9 8
		f 4 -12 -10 -8 -6
		mu 0 4 1 10 11 3
		f 4 10 4 6 8
		mu 0 4 12 0 2 13;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "pCube26";
	setAttr ".t" -type "double3" 917.23056782725791 2464.0350533753081 7167.5406391441293 ;
	setAttr ".r" -type "double3" 0 54.085261307513214 0 ;
	setAttr ".s" -type "double3" 111.81215849686258 1 111.81215849686258 ;
	setAttr ".rp" -type "double3" 3520.8100317607509 -1047.943603515625 -1081.0516588119849 ;
	setAttr ".rpt" -type "double3" -48.383938977184748 0 -146.56106469781088 ;
	setAttr ".sp" -type "double3" 23.224075317382812 -1047.943603515625 -7.1308661699295044 ;
	setAttr ".spt" -type "double3" 3497.5859564433681 0 -1073.9207926420554 ;
createNode mesh -n "pCubeShape26" -p "pCube26";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".pv" -type "double2" 0.5 0.375 ;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 14 ".uvst[0].uvsp[0:13]" -type "float2" 0.375 0 0.625 0 0.375
		 0.25 0.625 0.25 0.375 0.5 0.625 0.5 0.375 0.75 0.625 0.75 0.375 1 0.625 1 0.875 0
		 0.875 0.25 0.125 0 0.125 0.25;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 8 ".pt[0:7]" -type "float3"  19.628298 -4663.25 -3.5590823 
		26.819853 -4663.25 -3.5590823 19.628298 1914.6984 -3.5590823 26.819853 1914.6984 
		-3.5590823 19.628298 1914.6984 -10.70265 26.819853 1914.6984 -10.70265 19.628298 
		-4663.25 -10.70265 26.819853 -4663.25 -10.70265;
	setAttr -s 8 ".vt[0:7]"  -0.5 -0.5 0.5 0.5 -0.5 0.5 -0.5 0.5 0.5 0.5 0.5 0.5
		 -0.5 0.5 -0.5 0.5 0.5 -0.5 -0.5 -0.5 -0.5 0.5 -0.5 -0.5;
	setAttr -s 12 ".ed[0:11]"  0 1 0 2 3 0 4 5 0 6 7 0 0 2 0 1 3 0 2 4 0
		 3 5 0 4 6 0 5 7 0 6 0 0 7 1 0;
	setAttr -s 6 -ch 24 ".fc[0:5]" -type "polyFaces" 
		f 4 0 5 -2 -5
		mu 0 4 0 1 3 2
		f 4 1 7 -3 -7
		mu 0 4 2 3 5 4
		f 4 2 9 -4 -9
		mu 0 4 4 5 7 6
		f 4 3 11 -1 -11
		mu 0 4 6 7 9 8
		f 4 -12 -10 -8 -6
		mu 0 4 1 10 11 3
		f 4 10 4 6 8
		mu 0 4 12 0 2 13;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "pCube27";
	setAttr ".t" -type "double3" 917.23056782725826 5065.5503638414775 7167.5406391441284 ;
	setAttr ".r" -type "double3" 0 54.085261307513214 0 ;
	setAttr ".s" -type "double3" 37.54302407966874 1 37.54302407966874 ;
	setAttr ".rp" -type "double3" 3520.8100317607509 -1047.943603515625 -1081.0516588119849 ;
	setAttr ".rpt" -type "double3" -48.383938977184748 0 -146.56106469781088 ;
	setAttr ".sp" -type "double3" 23.224075317382812 -1047.943603515625 -7.1308661699295044 ;
	setAttr ".spt" -type "double3" 3497.5859564433681 0 -1073.9207926420554 ;
createNode mesh -n "pCubeShape27" -p "pCube27";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".pv" -type "double2" 0.5 0.375 ;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 14 ".uvst[0].uvsp[0:13]" -type "float2" 0.375 0 0.625 0 0.375
		 0.25 0.625 0.25 0.375 0.5 0.625 0.5 0.375 0.75 0.625 0.75 0.375 1 0.625 1 0.875 0
		 0.875 0.25 0.125 0 0.125 0.25;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 8 ".pt[0:7]" -type "float3"  19.628298 -4663.25 -3.5590823 
		26.819853 -4663.25 -3.5590823 19.628298 434.64957 -3.5590823 26.819853 434.64957 
		-3.5590823 19.628298 434.64957 -10.70265 26.819853 434.64957 -10.70265 19.628298 
		-4663.25 -10.70265 26.819853 -4663.25 -10.70265;
	setAttr -s 8 ".vt[0:7]"  -0.5 -0.5 0.5 0.5 -0.5 0.5 -0.5 0.5 0.5 0.5 0.5 0.5
		 -0.5 0.5 -0.5 0.5 0.5 -0.5 -0.5 -0.5 -0.5 0.5 -0.5 -0.5;
	setAttr -s 12 ".ed[0:11]"  0 1 0 2 3 0 4 5 0 6 7 0 0 2 0 1 3 0 2 4 0
		 3 5 0 4 6 0 5 7 0 6 0 0 7 1 0;
	setAttr -s 6 -ch 24 ".fc[0:5]" -type "polyFaces" 
		f 4 0 5 -2 -5
		mu 0 4 0 1 3 2
		f 4 1 7 -3 -7
		mu 0 4 2 3 5 4
		f 4 2 9 -4 -9
		mu 0 4 4 5 7 6
		f 4 3 11 -1 -11
		mu 0 4 6 7 9 8
		f 4 -12 -10 -8 -6
		mu 0 4 1 10 11 3
		f 4 10 4 6 8
		mu 0 4 12 0 2 13;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "pSphere8";
	setAttr ".t" -type "double3" 3595.2013861395867 -366.12945154847375 9926.4838602782711 ;
	setAttr ".s" -type "double3" 163.83740141626828 163.83740141626828 163.83740141626828 ;
createNode mesh -n "pSphereShape8" -p "pSphere8";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 23 ".uvst[0].uvsp[0:22]" -type "float2" 0 0.25 0.25 0.25
		 0.5 0.25 0.75 0.25 1 0.25 0 0.5 0.25 0.5 0.5 0.5 0.75 0.5 1 0.5 0 0.75 0.25 0.75
		 0.5 0.75 0.75 0.75 1 0.75 0.125 0 0.375 0 0.625 0 0.875 0 0.125 1 0.375 1 0.625 1
		 0.875 1;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 14 ".vt[0:13]"  9.2725848e-008 -0.70710677 -0.70710677 -0.70710677 -0.70710677 -6.1817239e-008
		 -3.090862e-008 -0.70710677 0.70710677 0.70710677 -0.70710677 0 1.3113416e-007 0 -1
		 -1 0 -8.7422777e-008 -4.3711388e-008 0 1 1 0 0 9.2725848e-008 0.70710677 -0.70710677
		 -0.70710677 0.70710677 -6.1817239e-008 -3.090862e-008 0.70710677 0.70710677 0.70710677 0.70710677 0
		 0 -1 0 0 1 0;
	setAttr -s 28 ".ed[0:27]"  0 1 0 1 2 0 2 3 0 3 0 0 4 5 0 5 6 0 6 7 0
		 7 4 0 8 9 0 9 10 0 10 11 0 11 8 0 0 4 0 1 5 0 2 6 0 3 7 0 4 8 0 5 9 0 6 10 0 7 11 0
		 12 0 0 12 1 0 12 2 0 12 3 0 8 13 0 9 13 0 10 13 0 11 13 0;
	setAttr -s 16 -ch 56 ".fc[0:15]" -type "polyFaces" 
		f 4 0 13 -5 -13
		mu 0 4 0 1 6 5
		f 4 1 14 -6 -14
		mu 0 4 1 2 7 6
		f 4 2 15 -7 -15
		mu 0 4 2 3 8 7
		f 4 3 12 -8 -16
		mu 0 4 3 4 9 8
		f 4 4 17 -9 -17
		mu 0 4 5 6 11 10
		f 4 5 18 -10 -18
		mu 0 4 6 7 12 11
		f 4 6 19 -11 -19
		mu 0 4 7 8 13 12
		f 4 7 16 -12 -20
		mu 0 4 8 9 14 13
		f 3 -1 -21 21
		mu 0 3 1 0 15
		f 3 -2 -22 22
		mu 0 3 2 1 16
		f 3 -3 -23 23
		mu 0 3 3 2 17
		f 3 -4 -24 20
		mu 0 3 4 3 18
		f 3 8 25 -25
		mu 0 3 10 11 19
		f 3 9 26 -26
		mu 0 3 11 12 20
		f 3 10 27 -27
		mu 0 3 12 13 21
		f 3 11 24 -28
		mu 0 3 13 14 22;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "pCube28";
	setAttr ".t" -type "double3" 3608.4796455609144 145.76039984783438 9936.2826631120843 ;
	setAttr ".r" -type "double3" 113.81677998725468 0 0 ;
	setAttr ".s" -type "double3" 0.59184691039520954 1 0.59184691039520954 ;
	setAttr ".rp" -type "double3" 9.0949470177292814e-013 -400.2649637938369 -4.5474735088646407e-013 ;
	setAttr ".sp" -type "double3" 1.5367060058919751e-012 -400.2649637938369 -7.6835300294598756e-013 ;
	setAttr ".spt" -type "double3" -6.2721130411904699e-013 0 3.1360565205952349e-013 ;
createNode mesh -n "pCubeShape28" -p "pCube28";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".pv" -type "double2" 0.5 0.375 ;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 14 ".uvst[0].uvsp[0:13]" -type "float2" 0.375 0 0.625 0 0.375
		 0.25 0.625 0.25 0.375 0.5 0.625 0.5 0.375 0.75 0.625 0.75 0.375 1 0.625 1 0.875 0
		 0.875 0.25 0.125 0 0.125 0.25;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 4 ".pt[2:5]" -type "float3"  0 369.12512 -1.1368684e-013 
		0 369.12512 -1.1368684e-013 0 369.12512 -1.1368684e-013 0 369.12512 -1.1368684e-013;
	setAttr -s 8 ".vt[0:7]"  -126.33515167 -471.17095947 104.8667984 126.33515167 -471.17095947 104.8667984
		 -126.33515167 471.17095947 104.8667984 126.33515167 471.17095947 104.8667984 -126.33515167 471.17095947 -104.8667984
		 126.33515167 471.17095947 -104.8667984 -126.33515167 -471.17095947 -104.8667984 126.33515167 -471.17095947 -104.8667984;
	setAttr -s 12 ".ed[0:11]"  0 1 0 2 3 0 4 5 0 6 7 0 0 2 0 1 3 0 2 4 0
		 3 5 0 4 6 0 5 7 0 6 0 0 7 1 0;
	setAttr -s 6 -ch 24 ".fc[0:5]" -type "polyFaces" 
		f 4 0 5 -2 -5
		mu 0 4 0 1 3 2
		f 4 1 7 -3 -7
		mu 0 4 2 3 5 4
		f 4 2 9 -4 -9
		mu 0 4 4 5 7 6
		f 4 3 11 -1 -11
		mu 0 4 6 7 9 8
		f 4 -12 -10 -8 -6
		mu 0 4 1 10 11 3
		f 4 10 4 6 8
		mu 0 4 12 0 2 13;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "pCube29";
	setAttr ".t" -type "double3" 1195.7266480843623 249.09762158841946 12305.63575471675 ;
	setAttr ".s" -type "double3" 151.6017315499096 1 151.6017315499096 ;
	setAttr ".rp" -type "double3" 2337.9655320155994 -1047.943603515625 -1174.2532732694128 ;
	setAttr ".sp" -type "double3" 15.421760082244873 -1047.943603515625 -7.7456455230712891 ;
	setAttr ".spt" -type "double3" 2322.5437719333545 0 -1166.5076277463415 ;
createNode mesh -n "pCubeShape29" -p "pCube29";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".pv" -type "double2" 0.75 0.125 ;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 14 ".uvst[0].uvsp[0:13]" -type "float2" 0.375 0 0.625 0 0.375
		 0.25 0.625 0.25 0.375 0.5 0.625 0.5 0.375 0.75 0.625 0.75 0.375 1 0.625 1 0.875 0
		 0.875 0.25 0.125 0 0.125 0.25;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 8 ".pt[0:7]" -type "float3"  15.265612 -4663.25 -7.0212507 
		16.756643 -4663.25 -7.0212507 15.265612 -1018.6012 -7.0212507 16.756643 -1018.6012 
		-7.0212507 15.265615 -1018.6012 -8.0817423 16.756636 -1018.6012 -8.0817423 15.265615 
		-4663.25 -8.0817423 16.756636 -4663.25 -8.0817423;
	setAttr -s 8 ".vt[0:7]"  -0.5 -0.5 0.5 0.5 -0.5 0.5 -0.5 0.5 0.5 0.5 0.5 0.5
		 -0.5 0.5 -0.5 0.5 0.5 -0.5 -0.5 -0.5 -0.5 0.5 -0.5 -0.5;
	setAttr -s 12 ".ed[0:11]"  0 1 0 2 3 0 4 5 0 6 7 0 0 2 0 1 3 0 2 4 0
		 3 5 0 4 6 0 5 7 0 6 0 0 7 1 0;
	setAttr -s 6 -ch 24 ".fc[0:5]" -type "polyFaces" 
		f 4 0 5 -2 -5
		mu 0 4 0 1 3 2
		f 4 1 7 -3 -7
		mu 0 4 2 3 5 4
		f 4 2 9 -4 -9
		mu 0 4 4 5 7 6
		f 4 3 11 -1 -11
		mu 0 4 6 7 9 8
		f 4 -12 -10 -8 -6
		mu 0 4 1 10 11 3
		f 4 10 4 6 8
		mu 0 4 12 0 2 13;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "pCube30";
	setAttr ".t" -type "double3" 3672.8725545875159 -1429.2094200840841 12238.320080318319 ;
	setAttr ".s" -type "double3" 2.4197112143170063 1 1.4337180316053189 ;
createNode mesh -n "pCubeShape30" -p "pCube30";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 14 ".uvst[0].uvsp[0:13]" -type "float2" 0.375 0 0.625 0 0.375
		 0.25 0.625 0.25 0.375 0.5 0.625 0.5 0.375 0.75 0.625 0.75 0.375 1 0.625 1 0.875 0
		 0.875 0.25 0.125 0 0.125 0.25;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 8 ".vt[0:7]"  -159.027389526 -85.52788544 171.84742737
		 159.027389526 -85.52788544 171.84742737 -159.027389526 85.52788544 171.84742737 159.027389526 85.52788544 171.84742737
		 -159.027389526 85.52788544 -171.84742737 159.027389526 85.52788544 -171.84742737
		 -159.027389526 -85.52788544 -171.84742737 159.027389526 -85.52788544 -171.84742737;
	setAttr -s 12 ".ed[0:11]"  0 1 0 2 3 0 4 5 0 6 7 0 0 2 0 1 3 0 2 4 0
		 3 5 0 4 6 0 5 7 0 6 0 0 7 1 0;
	setAttr -s 6 -ch 24 ".fc[0:5]" -type "polyFaces" 
		f 4 0 5 -2 -5
		mu 0 4 0 1 3 2
		f 4 1 7 -3 -7
		mu 0 4 2 3 5 4
		f 4 2 9 -4 -9
		mu 0 4 4 5 7 6
		f 4 3 11 -1 -11
		mu 0 4 6 7 9 8
		f 4 -12 -10 -8 -6
		mu 0 4 1 10 11 3
		f 4 10 4 6 8
		mu 0 4 12 0 2 13;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "pCube31";
	setAttr ".t" -type "double3" -4298.565277707421 3717.2094815011628 12054.332339973116 ;
	setAttr ".r" -type "double3" 0 54.085261307513214 0 ;
	setAttr ".s" -type "double3" 111.81215849686258 1 111.81215849686258 ;
	setAttr ".rp" -type "double3" 3520.8100317607509 -1047.943603515625 -1081.0516588119849 ;
	setAttr ".rpt" -type "double3" -48.383938977184748 0 -146.56106469781088 ;
	setAttr ".sp" -type "double3" 23.224075317382812 -1047.943603515625 -7.1308661699295044 ;
	setAttr ".spt" -type "double3" 3497.5859564433681 0 -1073.9207926420554 ;
createNode mesh -n "pCubeShape31" -p "pCube31";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".pv" -type "double2" 0.5 0.375 ;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 14 ".uvst[0].uvsp[0:13]" -type "float2" 0.375 0 0.625 0 0.375
		 0.25 0.625 0.25 0.375 0.5 0.625 0.5 0.375 0.75 0.625 0.75 0.375 1 0.625 1 0.875 0
		 0.875 0.25 0.125 0 0.125 0.25;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 8 ".pt[0:7]" -type "float3"  19.628298 -4663.25 -3.5590823 
		26.819853 -4663.25 -3.5590823 19.628298 1914.6984 -3.5590823 26.819853 1914.6984 
		-3.5590823 19.628298 1914.6984 -10.70265 26.819853 1914.6984 -10.70265 19.628298 
		-4663.25 -10.70265 26.819853 -4663.25 -10.70265;
	setAttr -s 8 ".vt[0:7]"  -0.5 -0.5 0.5 0.5 -0.5 0.5 -0.5 0.5 0.5 0.5 0.5 0.5
		 -0.5 0.5 -0.5 0.5 0.5 -0.5 -0.5 -0.5 -0.5 0.5 -0.5 -0.5;
	setAttr -s 12 ".ed[0:11]"  0 1 0 2 3 0 4 5 0 6 7 0 0 2 0 1 3 0 2 4 0
		 3 5 0 4 6 0 5 7 0 6 0 0 7 1 0;
	setAttr -s 6 -ch 24 ".fc[0:5]" -type "polyFaces" 
		f 4 0 5 -2 -5
		mu 0 4 0 1 3 2
		f 4 1 7 -3 -7
		mu 0 4 2 3 5 4
		f 4 2 9 -4 -9
		mu 0 4 4 5 7 6
		f 4 3 11 -1 -11
		mu 0 4 6 7 9 8
		f 4 -12 -10 -8 -6
		mu 0 4 1 10 11 3
		f 4 10 4 6 8
		mu 0 4 12 0 2 13;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "pCube32";
	setAttr ".t" -type "double3" -4646.3710345492991 2464.0350533752589 10873.811759854983 ;
	setAttr ".r" -type "double3" 0 54.085261307513214 0 ;
	setAttr ".s" -type "double3" 111.81215849686258 1 111.81215849686258 ;
	setAttr ".rp" -type "double3" 3520.8100317607509 -1047.943603515625 -1081.0516588119849 ;
	setAttr ".rpt" -type "double3" -48.383938977184748 0 -146.56106469781088 ;
	setAttr ".sp" -type "double3" 23.224075317382812 -1047.943603515625 -7.1308661699295044 ;
	setAttr ".spt" -type "double3" 3497.5859564433681 0 -1073.9207926420554 ;
createNode mesh -n "pCubeShape32" -p "pCube32";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".pv" -type "double2" 0.5 0.375 ;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 14 ".uvst[0].uvsp[0:13]" -type "float2" 0.375 0 0.625 0 0.375
		 0.25 0.625 0.25 0.375 0.5 0.625 0.5 0.375 0.75 0.625 0.75 0.375 1 0.625 1 0.875 0
		 0.875 0.25 0.125 0 0.125 0.25;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 8 ".pt[0:7]" -type "float3"  19.628298 -4663.25 -3.5590823 
		26.819853 -4663.25 -3.5590823 19.628298 1914.6984 -3.5590823 26.819853 1914.6984 
		-3.5590823 19.628298 1914.6984 -10.70265 26.819853 1914.6984 -10.70265 19.628298 
		-4663.25 -10.70265 26.819853 -4663.25 -10.70265;
	setAttr -s 8 ".vt[0:7]"  -0.5 -0.5 0.5 0.5 -0.5 0.5 -0.5 0.5 0.5 0.5 0.5 0.5
		 -0.5 0.5 -0.5 0.5 0.5 -0.5 -0.5 -0.5 -0.5 0.5 -0.5 -0.5;
	setAttr -s 12 ".ed[0:11]"  0 1 0 2 3 0 4 5 0 6 7 0 0 2 0 1 3 0 2 4 0
		 3 5 0 4 6 0 5 7 0 6 0 0 7 1 0;
	setAttr -s 6 -ch 24 ".fc[0:5]" -type "polyFaces" 
		f 4 0 5 -2 -5
		mu 0 4 0 1 3 2
		f 4 1 7 -3 -7
		mu 0 4 2 3 5 4
		f 4 2 9 -4 -9
		mu 0 4 4 5 7 6
		f 4 3 11 -1 -11
		mu 0 4 6 7 9 8
		f 4 -12 -10 -8 -6
		mu 0 4 1 10 11 3
		f 4 10 4 6 8
		mu 0 4 12 0 2 13;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode transform -n "pCube33";
	setAttr ".t" -type "double3" -3022.2793024453704 1072.1521097472607 11018.910165900204 ;
	setAttr ".r" -type "double3" 0 25.588795326147871 0 ;
	setAttr ".s" -type "double3" 192.7804492293395 1 192.7804492293395 ;
	setAttr ".rp" -type "double3" 3520.8100317607509 -1047.943603515625 -1081.0516588119849 ;
	setAttr ".rpt" -type "double3" -48.383938977184748 0 -146.56106469781088 ;
	setAttr ".sp" -type "double3" 23.224075317382812 -1047.943603515625 -7.1308661699295044 ;
	setAttr ".spt" -type "double3" 3497.5859564433681 0 -1073.9207926420554 ;
createNode mesh -n "pCubeShape33" -p "pCube33";
	setAttr -k off ".v";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".pv" -type "double2" 0.5 0.375 ;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 14 ".uvst[0].uvsp[0:13]" -type "float2" 0.375 0 0.625 0 0.375
		 0.25 0.625 0.25 0.375 0.5 0.625 0.5 0.375 0.75 0.625 0.75 0.375 1 0.625 1 0.875 0
		 0.875 0.25 0.125 0 0.125 0.25;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 8 ".pt[0:7]" -type "float3"  19.628298 -4663.25 -3.5590823 
		26.819853 -4663.25 -3.5590823 19.628298 2950.4973 -3.5590823 26.819853 2950.4973 
		-3.5590823 19.628298 2950.4973 -10.70265 26.819853 2950.4973 -10.70265 19.628298 
		-4663.25 -10.70265 26.819853 -4663.25 -10.70265;
	setAttr -s 8 ".vt[0:7]"  -0.5 -0.5 0.5 0.5 -0.5 0.5 -0.5 0.5 0.5 0.5 0.5 0.5
		 -0.5 0.5 -0.5 0.5 0.5 -0.5 -0.5 -0.5 -0.5 0.5 -0.5 -0.5;
	setAttr -s 12 ".ed[0:11]"  0 1 0 2 3 0 4 5 0 6 7 0 0 2 0 1 3 0 2 4 0
		 3 5 0 4 6 0 5 7 0 6 0 0 7 1 0;
	setAttr -s 6 -ch 24 ".fc[0:5]" -type "polyFaces" 
		f 4 0 5 -2 -5
		mu 0 4 0 1 3 2
		f 4 1 7 -3 -7
		mu 0 4 2 3 5 4
		f 4 2 9 -4 -9
		mu 0 4 4 5 7 6
		f 4 3 11 -1 -11
		mu 0 4 6 7 9 8
		f 4 -12 -10 -8 -6
		mu 0 4 1 10 11 3
		f 4 10 4 6 8
		mu 0 4 12 0 2 13;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
createNode lightLinker -s -n "lightLinker1";
	setAttr -s 19 ".lnk";
	setAttr -s 19 ".slnk";
createNode displayLayerManager -n "layerManager";
	setAttr -s 2 ".dli[1]"  1;
	setAttr -s 2 ".dli";
createNode displayLayer -n "defaultLayer";
createNode renderLayerManager -n "renderLayerManager";
createNode renderLayer -n "defaultRenderLayer";
	setAttr ".g" yes;
createNode lambert -n "Zenobia1:Zenobia1:lambert1";
	setAttr ".c" -type "float3" 0.20761245 0.29636556 0.52941179 ;
createNode shadingEngine -n "Zenobia1:Zenobia1:bodySG";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode materialInfo -n "materialInfo1";
createNode lambert -n "lambert2";
createNode shadingEngine -n "Zenobia1:HairSG";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode materialInfo -n "materialInfo2";
createNode lambert -n "textureTest_001:lambert2";
createNode shadingEngine -n "textureTest_001:polySurface1SG";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode materialInfo -n "materialInfo3";
createNode file -n "textureTest_001:file1";
	setAttr ".ftn" -type "string" "C:\\Users\\ori\\Desktop\\Terrascape\\Terrascape\\Terrascape\\Unity_Files\\Assets\\Meshes\\Zenobia\\player_char_zenobia_01(1).fbm\\zenHeadTorso.jpg";
createNode place2dTexture -n "place2dTexture1";
createNode lambert -n "textureTest_001:lambert6";
createNode shadingEngine -n "textureTest_001:polySurface2SG";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode materialInfo -n "materialInfo4";
createNode file -n "textureTest_001:file5";
	setAttr ".ftn" -type "string" "C:\\Users\\ori\\Desktop\\Terrascape\\Terrascape\\Terrascape\\Unity_Files\\Assets\\Meshes\\Zenobia\\player_char_zenobia_01(1).fbm\\zenLegs.jpg";
createNode place2dTexture -n "place2dTexture2";
createNode lambert -n "textureTest_001:lambert4";
createNode shadingEngine -n "textureTest_001:polySurface3SG";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode materialInfo -n "materialInfo5";
createNode file -n "textureTest_001:file3";
	setAttr ".ftn" -type "string" "C:\\Users\\ori\\Desktop\\Terrascape\\Terrascape\\Terrascape\\Unity_Files\\Assets\\Meshes\\Zenobia\\player_char_zenobia_01(1).fbm\\zenSkirt.jpg";
createNode place2dTexture -n "place2dTexture3";
createNode lambert -n "textureTest_001:lambert3";
createNode shadingEngine -n "textureTest_001:polySurface4SG";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode materialInfo -n "materialInfo6";
createNode file -n "textureTest_001:file2";
	setAttr ".ail" yes;
	setAttr ".ftn" -type "string" "C:\\Users\\ori\\Desktop\\Terrascape\\Terrascape\\Terrascape\\Unity_Files\\Assets\\Meshes\\Zenobia\\player_char_zenobia_01(1).fbm\\zenEyes.jpg";
createNode place2dTexture -n "place2dTexture4";
createNode lambert -n "textureTest_001:lambert5";
createNode shadingEngine -n "textureTest_001:polySurface95SG";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode materialInfo -n "materialInfo7";
createNode file -n "textureTest_001:file4";
	setAttr ".ail" yes;
	setAttr ".ftn" -type "string" "C:\\Users\\ori\\Desktop\\Terrascape\\Terrascape\\Terrascape\\Unity_Files\\Assets\\Meshes\\Zenobia\\player_char_zenobia_01(1).fbm\\zenHair.jpg";
createNode place2dTexture -n "place2dTexture5";
createNode lambert -n "textureTest_001:lambert7";
createNode shadingEngine -n "textureTest_001:polySurface1SG1";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode materialInfo -n "materialInfo8";
createNode file -n "textureTest_001:file6";
	setAttr ".ftn" -type "string" "C:\\Users\\ori\\Desktop\\Terrascape\\Terrascape\\Terrascape\\Unity_Files\\Assets\\Meshes\\Zenobia\\player_char_zenobia_01(1).fbm\\zenHeadTorso.jpg";
createNode place2dTexture -n "place2dTexture6";
createNode lambert -n "textureTest_001:lambert8";
createNode shadingEngine -n "textureTest_001:polySurface2SG1";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode materialInfo -n "materialInfo9";
createNode file -n "textureTest_001:file7";
	setAttr ".ftn" -type "string" "C:\\Users\\ori\\Desktop\\Terrascape\\Terrascape\\Terrascape\\Unity_Files\\Assets\\Meshes\\Zenobia\\player_char_zenobia_01(1).fbm\\zenLegs.jpg";
createNode place2dTexture -n "place2dTexture7";
createNode lambert -n "textureTest_001:lambert9";
createNode shadingEngine -n "textureTest_001:polySurface3SG1";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode materialInfo -n "materialInfo10";
createNode file -n "textureTest_001:file8";
	setAttr ".ftn" -type "string" "C:\\Users\\ori\\Desktop\\Terrascape\\Terrascape\\Terrascape\\Unity_Files\\Assets\\Meshes\\Zenobia\\player_char_zenobia_01(1).fbm\\zenSkirt.jpg";
createNode place2dTexture -n "place2dTexture8";
createNode lambert -n "textureTest_001:lambert10";
createNode shadingEngine -n "textureTest_001:polySurface4SG1";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode materialInfo -n "materialInfo11";
createNode file -n "textureTest_001:file9";
	setAttr ".ftn" -type "string" "C:\\Users\\ori\\Desktop\\Terrascape\\Terrascape\\Terrascape\\Unity_Files\\Assets\\Meshes\\Zenobia\\player_char_zenobia_01(1).fbm\\zenEyes.jpg";
createNode place2dTexture -n "place2dTexture9";
createNode lambert -n "textureTest_001:lambert11";
createNode shadingEngine -n "textureTest_001:polySurface95SG1";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode materialInfo -n "materialInfo12";
createNode file -n "textureTest_001:file10";
	setAttr ".ftn" -type "string" "C:\\Users\\ori\\Desktop\\Terrascape\\Terrascape\\Terrascape\\Unity_Files\\Assets\\Meshes\\Zenobia\\player_char_zenobia_01(1).fbm\\zenHair.jpg";
createNode place2dTexture -n "place2dTexture10";
createNode lambert -n "skirtTexture";
createNode shadingEngine -n "bodySG";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode materialInfo -n "materialInfo13";
createNode lambert -n "lambert3";
createNode shadingEngine -n "bodySG1";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode materialInfo -n "materialInfo14";
createNode lambert -n "eyeTexture";
createNode shadingEngine -n "bodySG2";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode materialInfo -n "materialInfo15";
createNode lambert -n "hairTexture";
createNode shadingEngine -n "bodySG3";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode materialInfo -n "materialInfo16";
createNode lambert -n "bodyTexture";
createNode shadingEngine -n "bodySG4";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode materialInfo -n "materialInfo17";
createNode HIKCharacterNode -n "Character1";
	setAttr ".HipsTy" 100;
	setAttr ".LeftUpLegTx" 8.910001;
	setAttr ".LeftUpLegTy" 93.73;
	setAttr ".LeftLegTx" 8.910001;
	setAttr ".LeftLegTy" 48.851355;
	setAttr ".LeftFootTx" 8.910001;
	setAttr ".LeftFootTy" 8.150396;
	setAttr ".RightUpLegTx" -8.910001;
	setAttr ".RightUpLegTy" 93.73;
	setAttr ".RightLegTx" -8.910004;
	setAttr ".RightLegTy" 48.851355;
	setAttr ".RightLegTz" 0.00043902399999999999;
	setAttr ".RightFootTx" -8.910003;
	setAttr ".RightFootTy" 8.150396;
	setAttr ".RightFootTz" 0.00043902399999999999;
	setAttr ".SpineTy" 107;
	setAttr ".LeftArmTx" 17.707251;
	setAttr ".LeftArmTy" 146.588684;
	setAttr ".LeftForeArmTx" 45.012717;
	setAttr ".LeftForeArmTy" 146.588684;
	setAttr ".LeftHandTx" 71.709864;
	setAttr ".LeftHandTy" 146.588684;
	setAttr ".RightArmTx" -17.707275;
	setAttr ".RightArmTy" 146.58898;
	setAttr ".RightForeArmTx" -45.012873;
	setAttr ".RightForeArmTy" 146.58898;
	setAttr ".RightHandTx" -71.709861;
	setAttr ".RightHandTy" 146.588979;
	setAttr ".HeadTy" 165;
	setAttr ".LeftToeBaseTx" 8.910009;
	setAttr ".LeftToeBaseTy" 1.888079;
	setAttr ".LeftToeBaseTz" 12.954721;
	setAttr ".RightToeBaseTx" -8.911088;
	setAttr ".RightToeBaseTy" 1.888079;
	setAttr ".RightToeBaseTz" 12.955188;
	setAttr ".LeftShoulderTx" 7;
	setAttr ".LeftShoulderTy" 146.588547;
	setAttr ".RightShoulderTx" -7;
	setAttr ".RightShoulderTy" 146.588547;
	setAttr ".NeckTy" 145;
	setAttr ".Spine1Ty" 119.666667;
	setAttr ".Spine2Ty" 132.333333;
	setAttr ".LeftHandThumb1Tx" 76.058621;
	setAttr ".LeftHandThumb1Ty" 145.790182;
	setAttr ".LeftHandThumb1Tz" 4.282434;
	setAttr ".LeftHandThumb2Tx" 78.571211;
	setAttr ".LeftHandThumb2Ty" 145.254082;
	setAttr ".LeftHandThumb2Tz" 4.989888;
	setAttr ".LeftHandThumb3Tx" 81.114351;
	setAttr ".LeftHandThumb3Ty" 145.254069;
	setAttr ".LeftHandThumb3Tz" 4.989898;
	setAttr ".LeftHandThumb4Tx" 83.781097;
	setAttr ".LeftHandThumb4Ty" 145.254072;
	setAttr ".LeftHandThumb4Tz" 4.989889;
	setAttr ".LeftHandIndex1Tx" 80.531841;
	setAttr ".LeftHandIndex1Ty" 146.788413;
	setAttr ".LeftHandIndex1Tz" 3.471669;
	setAttr ".LeftHandIndex1Ry" -0.00060923499999999996;
	setAttr ".LeftHandIndex2Tx" 84.754595;
	setAttr ".LeftHandIndex2Ty" 146.788391;
	setAttr ".LeftHandIndex2Tz" 3.618868;
	setAttr ".LeftHandIndex2Ry" -0.00060923499999999996;
	setAttr ".LeftHandIndex3Tx" 87.406921;
	setAttr ".LeftHandIndex3Ty" 146.788377;
	setAttr ".LeftHandIndex3Tz" 3.711324;
	setAttr ".LeftHandIndex3Ry" -0.00060923499999999996;
	setAttr ".LeftHandIndex4Tx" 89.363955;
	setAttr ".LeftHandIndex4Ty" 146.788367;
	setAttr ".LeftHandIndex4Tz" 3.779543;
	setAttr ".LeftHandIndex4Ry" -0.00060923499999999996;
	setAttr ".LeftHandMiddle1Tx" 80.519744;
	setAttr ".LeftHandMiddle1Ty" 147.089575;
	setAttr ".LeftHandMiddle1Tz" 1.304684;
	setAttr ".LeftHandMiddle2Tx" 85.382995;
	setAttr ".LeftHandMiddle2Ty" 147.089575;
	setAttr ".LeftHandMiddle2Tz" 1.304987;
	setAttr ".LeftHandMiddle3Tx" 88.148232;
	setAttr ".LeftHandMiddle3Ty" 147.089575;
	setAttr ".LeftHandMiddle3Tz" 1.305159;
	setAttr ".LeftHandMiddle4Tx" 90.153864;
	setAttr ".LeftHandMiddle4Ty" 147.089575;
	setAttr ".LeftHandMiddle4Tz" 1.305282;
	setAttr ".LeftHandRing1Tx" 80.603624;
	setAttr ".LeftHandRing1Ty" 146.968604;
	setAttr ".LeftHandRing1Tz" -0.793159;
	setAttr ".LeftHandRing2Tx" 85.141383;
	setAttr ".LeftHandRing2Ty" 146.968604;
	setAttr ".LeftHandRing2Tz" -0.793159;
	setAttr ".LeftHandRing3Tx" 87.445909;
	setAttr ".LeftHandRing3Ty" 146.968604;
	setAttr ".LeftHandRing3Tz" -0.793159;
	setAttr ".LeftHandRing4Tx" 89.369256;
	setAttr ".LeftHandRing4Ty" 146.968604;
	setAttr ".LeftHandRing4Tz" -0.79316;
	setAttr ".LeftHandPinky1Tx" 80.592139;
	setAttr ".LeftHandPinky1Ty" 146.275657;
	setAttr ".LeftHandPinky1Tz" -2.490356;
	setAttr ".LeftHandPinky2Tx" 83.636238;
	setAttr ".LeftHandPinky2Ty" 146.275698;
	setAttr ".LeftHandPinky2Tz" -2.490356;
	setAttr ".LeftHandPinky3Tx" 85.61074;
	setAttr ".LeftHandPinky3Ty" 146.275724;
	setAttr ".LeftHandPinky3Tz" -2.490357;
	setAttr ".LeftHandPinky4Tx" 87.277354;
	setAttr ".LeftHandPinky4Ty" 146.275746;
	setAttr ".LeftHandPinky4Tz" -2.490356;
	setAttr ".RightHandThumb1Tx" -76.058242;
	setAttr ".RightHandThumb1Ty" 145.790481;
	setAttr ".RightHandThumb1Tz" 4.282815;
	setAttr ".RightHandThumb2Tx" -78.57077;
	setAttr ".RightHandThumb2Ty" 145.254382;
	setAttr ".RightHandThumb2Tz" 4.990491;
	setAttr ".RightHandThumb3Tx" -81.112359;
	setAttr ".RightHandThumb3Ty" 145.254409;
	setAttr ".RightHandThumb3Tz" 5.079312;
	setAttr ".RightHandThumb4Tx" -83.777479;
	setAttr ".RightHandThumb4Ty" 145.254427;
	setAttr ".RightHandThumb4Tz" 5.172449;
	setAttr ".RightHandIndex1Tx" -80.531534;
	setAttr ".RightHandIndex1Ty" 146.788712;
	setAttr ".RightHandIndex1Tz" 3.472444;
	setAttr ".RightHandIndex1Ry" -0.00060925499999999995;
	setAttr ".RightHandIndex2Tx" -84.754284;
	setAttr ".RightHandIndex2Ty" 146.788712;
	setAttr ".RightHandIndex2Tz" 3.325093;
	setAttr ".RightHandIndex2Ry" -0.00060925499999999995;
	setAttr ".RightHandIndex3Tx" -87.406607;
	setAttr ".RightHandIndex3Ty" 146.788712;
	setAttr ".RightHandIndex3Tz" 3.23254;
	setAttr ".RightHandIndex3Ry" -0.00060925499999999995;
	setAttr ".RightHandIndex4Tx" -89.363639;
	setAttr ".RightHandIndex4Ty" 146.788712;
	setAttr ".RightHandIndex4Tz" 3.16425;
	setAttr ".RightHandIndex4Ry" -0.00060925499999999995;
	setAttr ".RightHandMiddle1Tx" -80.519627;
	setAttr ".RightHandMiddle1Ty" 147.089872;
	setAttr ".RightHandMiddle1Tz" 1.305458;
	setAttr ".RightHandMiddle1Ry" -0.00060925499999999995;
	setAttr ".RightHandMiddle2Tx" -85.379922;
	setAttr ".RightHandMiddle2Ty" 147.089871;
	setAttr ".RightHandMiddle2Tz" 1.13586;
	setAttr ".RightHandMiddle2Ry" -0.00060925499999999995;
	setAttr ".RightHandMiddle3Tx" -88.143477;
	setAttr ".RightHandMiddle3Ty" 147.089871;
	setAttr ".RightHandMiddle3Tz" 1.039426;
	setAttr ".RightHandMiddle3Ry" -0.00060925499999999995;
	setAttr ".RightHandMiddle4Tx" -90.14789;
	setAttr ".RightHandMiddle4Ty" 147.089871;
	setAttr ".RightHandMiddle4Tz" 0.969483;
	setAttr ".RightHandMiddle4Ry" -0.00060925499999999995;
	setAttr ".RightHandRing1Tx" -80.603694;
	setAttr ".RightHandRing1Ty" 146.968899;
	setAttr ".RightHandRing1Tz" -0.792377;
	setAttr ".RightHandRing1Ry" -0.00060925499999999995;
	setAttr ".RightHandRing2Tx" -85.138693;
	setAttr ".RightHandRing2Ty" 146.968899;
	setAttr ".RightHandRing2Tz" -0.950624;
	setAttr ".RightHandRing2Ry" -0.00060925499999999995;
	setAttr ".RightHandRing3Tx" -87.441818;
	setAttr ".RightHandRing3Ty" 146.968898;
	setAttr ".RightHandRing3Tz" -1.030991;
	setAttr ".RightHandRing3Ry" -0.00060925499999999995;
	setAttr ".RightHandRing4Tx" -89.363996;
	setAttr ".RightHandRing4Ty" 146.968898;
	setAttr ".RightHandRing4Tz" -1.098065;
	setAttr ".RightHandRing4Ry" -0.00060925499999999995;
	setAttr ".RightHandPinky1Tx" -80.592357;
	setAttr ".RightHandPinky1Ty" 146.275951;
	setAttr ".RightHandPinky1Tz" -2.489574;
	setAttr ".RightHandPinky1Ry" -0.00060925499999999995;
	setAttr ".RightHandPinky2Tx" -83.6383;
	setAttr ".RightHandPinky2Ty" 146.275885;
	setAttr ".RightHandPinky2Tz" -2.595862;
	setAttr ".RightHandPinky2Ry" -0.00060925499999999995;
	setAttr ".RightHandPinky3Tx" -85.613997;
	setAttr ".RightHandPinky3Ty" 146.275842;
	setAttr ".RightHandPinky3Tz" -2.664803;
	setAttr ".RightHandPinky3Ry" -0.00060925499999999995;
	setAttr ".RightHandPinky4Tx" -87.281621;
	setAttr ".RightHandPinky4Ty" 146.275806;
	setAttr ".RightHandPinky4Tz" -2.722994;
	setAttr ".RightHandPinky4Ry" -0.00060925499999999995;
createNode HIKProperty2State -n "HIKproperties1";
	setAttr ".CtrlEnforceGravity" 0.6;
createNode displayLayer -n "layer2";
	setAttr ".do" 1;
createNode polyCube -n "polyCube1";
	setAttr ".cuv" 4;
createNode polyCube -n "polyCube2";
	setAttr ".cuv" 4;
createNode polySphere -n "polySphere1";
	setAttr ".sa" 4;
	setAttr ".sh" 4;
createNode polyCube -n "polyCube3";
	setAttr ".w" 318.05478645731546;
	setAttr ".h" 171.05577513807017;
	setAttr ".d" 343.69485834506577;
	setAttr ".cuv" 4;
createNode polyCube -n "polyCube4";
	setAttr ".w" 3056.5082909511502;
	setAttr ".h" 2504.5543502389801;
	setAttr ".d" 1217.7519614902671;
	setAttr ".cuv" 4;
createNode polyCube -n "polyCube5";
	setAttr ".w" 252.67029776836171;
	setAttr ".h" 942.34194106277607;
	setAttr ".d" 209.73359279263832;
	setAttr ".cuv" 4;
createNode polyCube -n "polyCube6";
	setAttr ".w" 401.62805998228032;
	setAttr ".h" 88.602022346986089;
	setAttr ".d" 134.50445427953673;
	setAttr ".cuv" 4;
createNode script -n "uiConfigurationScriptNode";
	setAttr ".b" -type "string" (
		"// Maya Mel UI Configuration File.\n//\n//  This script is machine generated.  Edit at your own risk.\n//\n//\n\nglobal string $gMainPane;\nif (`paneLayout -exists $gMainPane`) {\n\n\tglobal int $gUseScenePanelConfig;\n\tint    $useSceneConfig = $gUseScenePanelConfig;\n\tint    $menusOkayInPanels = `optionVar -q allowMenusInPanels`;\tint    $nVisPanes = `paneLayout -q -nvp $gMainPane`;\n\tint    $nPanes = 0;\n\tstring $editorName;\n\tstring $panelName;\n\tstring $itemFilterName;\n\tstring $panelConfig;\n\n\t//\n\t//  get current state of the UI\n\t//\n\tsceneUIReplacement -update $gMainPane;\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" (localizedPanelLabel(\"Top View\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `modelPanel -unParent -l (localizedPanelLabel(\"Top View\")) -mbv $menusOkayInPanels `;\n\t\t\t$editorName = $panelName;\n            modelEditor -e \n                -camera \"top\" \n                -useInteractiveMode 0\n                -displayLights \"default\" \n                -displayAppearance \"smoothShaded\" \n"
		+ "                -activeOnly 0\n                -ignorePanZoom 0\n                -wireframeOnShaded 0\n                -headsUpDisplay 1\n                -selectionHiliteDisplay 1\n                -useDefaultMaterial 0\n                -bufferMode \"double\" \n                -twoSidedLighting 0\n                -backfaceCulling 0\n                -xray 0\n                -jointXray 0\n                -activeComponentsXray 0\n                -displayTextures 0\n                -smoothWireframe 0\n                -lineWidth 1\n                -textureAnisotropic 0\n                -textureHilight 1\n                -textureSampling 2\n                -textureDisplay \"modulate\" \n                -textureMaxSize 8192\n                -fogging 0\n                -fogSource \"fragment\" \n                -fogMode \"linear\" \n                -fogStart 0\n                -fogEnd 100\n                -fogDensity 0.1\n                -fogColor 0.5 0.5 0.5 1 \n                -maxConstantTransparency 1\n                -rendererName \"vp2Renderer\" \n                -objectFilterShowInHUD 1\n"
		+ "                -isFiltered 0\n                -colorResolution 256 256 \n                -bumpResolution 512 512 \n                -textureCompression 0\n                -transparencyAlgorithm \"frontAndBackCull\" \n                -transpInShadows 0\n                -cullingOverride \"none\" \n                -lowQualityLighting 0\n                -maximumNumHardwareLights 1\n                -occlusionCulling 0\n                -shadingModel 0\n                -useBaseRenderer 0\n                -useReducedRenderer 0\n                -smallObjectCulling 0\n                -smallObjectThreshold -1 \n                -interactiveDisableShadows 0\n                -interactiveBackFaceCull 0\n                -sortTransparent 1\n                -nurbsCurves 1\n                -nurbsSurfaces 1\n                -polymeshes 1\n                -subdivSurfaces 1\n                -planes 1\n                -lights 1\n                -cameras 1\n                -controlVertices 1\n                -hulls 1\n                -grid 1\n                -imagePlane 1\n"
		+ "                -joints 1\n                -ikHandles 1\n                -deformers 1\n                -dynamics 1\n                -particleInstancers 1\n                -fluids 1\n                -hairSystems 1\n                -follicles 1\n                -nCloths 1\n                -nParticles 1\n                -nRigids 1\n                -dynamicConstraints 1\n                -locators 1\n                -manipulators 1\n                -pluginShapes 1\n                -dimensions 1\n                -handles 1\n                -pivots 1\n                -textures 1\n                -strokes 1\n                -motionTrails 1\n                -clipGhosts 1\n                -greasePencils 1\n                -shadows 0\n                $editorName;\n            modelEditor -e -viewSelected 0 $editorName;\n            modelEditor -e \n                -pluginObjects \"gpuCacheDisplayFilter\" 1 \n                $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tmodelPanel -edit -l (localizedPanelLabel(\"Top View\")) -mbv $menusOkayInPanels  $panelName;\n"
		+ "\t\t$editorName = $panelName;\n        modelEditor -e \n            -camera \"top\" \n            -useInteractiveMode 0\n            -displayLights \"default\" \n            -displayAppearance \"smoothShaded\" \n            -activeOnly 0\n            -ignorePanZoom 0\n            -wireframeOnShaded 0\n            -headsUpDisplay 1\n            -selectionHiliteDisplay 1\n            -useDefaultMaterial 0\n            -bufferMode \"double\" \n            -twoSidedLighting 0\n            -backfaceCulling 0\n            -xray 0\n            -jointXray 0\n            -activeComponentsXray 0\n            -displayTextures 0\n            -smoothWireframe 0\n            -lineWidth 1\n            -textureAnisotropic 0\n            -textureHilight 1\n            -textureSampling 2\n            -textureDisplay \"modulate\" \n            -textureMaxSize 8192\n            -fogging 0\n            -fogSource \"fragment\" \n            -fogMode \"linear\" \n            -fogStart 0\n            -fogEnd 100\n            -fogDensity 0.1\n            -fogColor 0.5 0.5 0.5 1 \n            -maxConstantTransparency 1\n"
		+ "            -rendererName \"vp2Renderer\" \n            -objectFilterShowInHUD 1\n            -isFiltered 0\n            -colorResolution 256 256 \n            -bumpResolution 512 512 \n            -textureCompression 0\n            -transparencyAlgorithm \"frontAndBackCull\" \n            -transpInShadows 0\n            -cullingOverride \"none\" \n            -lowQualityLighting 0\n            -maximumNumHardwareLights 1\n            -occlusionCulling 0\n            -shadingModel 0\n            -useBaseRenderer 0\n            -useReducedRenderer 0\n            -smallObjectCulling 0\n            -smallObjectThreshold -1 \n            -interactiveDisableShadows 0\n            -interactiveBackFaceCull 0\n            -sortTransparent 1\n            -nurbsCurves 1\n            -nurbsSurfaces 1\n            -polymeshes 1\n            -subdivSurfaces 1\n            -planes 1\n            -lights 1\n            -cameras 1\n            -controlVertices 1\n            -hulls 1\n            -grid 1\n            -imagePlane 1\n            -joints 1\n            -ikHandles 1\n"
		+ "            -deformers 1\n            -dynamics 1\n            -particleInstancers 1\n            -fluids 1\n            -hairSystems 1\n            -follicles 1\n            -nCloths 1\n            -nParticles 1\n            -nRigids 1\n            -dynamicConstraints 1\n            -locators 1\n            -manipulators 1\n            -pluginShapes 1\n            -dimensions 1\n            -handles 1\n            -pivots 1\n            -textures 1\n            -strokes 1\n            -motionTrails 1\n            -clipGhosts 1\n            -greasePencils 1\n            -shadows 0\n            $editorName;\n        modelEditor -e -viewSelected 0 $editorName;\n        modelEditor -e \n            -pluginObjects \"gpuCacheDisplayFilter\" 1 \n            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" (localizedPanelLabel(\"Side View\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `modelPanel -unParent -l (localizedPanelLabel(\"Side View\")) -mbv $menusOkayInPanels `;\n"
		+ "\t\t\t$editorName = $panelName;\n            modelEditor -e \n                -camera \"side\" \n                -useInteractiveMode 0\n                -displayLights \"default\" \n                -displayAppearance \"smoothShaded\" \n                -activeOnly 0\n                -ignorePanZoom 0\n                -wireframeOnShaded 0\n                -headsUpDisplay 1\n                -selectionHiliteDisplay 1\n                -useDefaultMaterial 0\n                -bufferMode \"double\" \n                -twoSidedLighting 0\n                -backfaceCulling 0\n                -xray 0\n                -jointXray 0\n                -activeComponentsXray 0\n                -displayTextures 0\n                -smoothWireframe 0\n                -lineWidth 1\n                -textureAnisotropic 0\n                -textureHilight 1\n                -textureSampling 2\n                -textureDisplay \"modulate\" \n                -textureMaxSize 8192\n                -fogging 0\n                -fogSource \"fragment\" \n                -fogMode \"linear\" \n                -fogStart 0\n"
		+ "                -fogEnd 100\n                -fogDensity 0.1\n                -fogColor 0.5 0.5 0.5 1 \n                -maxConstantTransparency 1\n                -rendererName \"vp2Renderer\" \n                -objectFilterShowInHUD 1\n                -isFiltered 0\n                -colorResolution 256 256 \n                -bumpResolution 512 512 \n                -textureCompression 0\n                -transparencyAlgorithm \"frontAndBackCull\" \n                -transpInShadows 0\n                -cullingOverride \"none\" \n                -lowQualityLighting 0\n                -maximumNumHardwareLights 1\n                -occlusionCulling 0\n                -shadingModel 0\n                -useBaseRenderer 0\n                -useReducedRenderer 0\n                -smallObjectCulling 0\n                -smallObjectThreshold -1 \n                -interactiveDisableShadows 0\n                -interactiveBackFaceCull 0\n                -sortTransparent 1\n                -nurbsCurves 1\n                -nurbsSurfaces 1\n                -polymeshes 1\n"
		+ "                -subdivSurfaces 1\n                -planes 1\n                -lights 1\n                -cameras 1\n                -controlVertices 1\n                -hulls 1\n                -grid 1\n                -imagePlane 1\n                -joints 1\n                -ikHandles 1\n                -deformers 1\n                -dynamics 1\n                -particleInstancers 1\n                -fluids 1\n                -hairSystems 1\n                -follicles 1\n                -nCloths 1\n                -nParticles 1\n                -nRigids 1\n                -dynamicConstraints 1\n                -locators 1\n                -manipulators 1\n                -pluginShapes 1\n                -dimensions 1\n                -handles 1\n                -pivots 1\n                -textures 1\n                -strokes 1\n                -motionTrails 1\n                -clipGhosts 1\n                -greasePencils 1\n                -shadows 0\n                $editorName;\n            modelEditor -e -viewSelected 0 $editorName;\n            modelEditor -e \n"
		+ "                -pluginObjects \"gpuCacheDisplayFilter\" 1 \n                $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tmodelPanel -edit -l (localizedPanelLabel(\"Side View\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        modelEditor -e \n            -camera \"side\" \n            -useInteractiveMode 0\n            -displayLights \"default\" \n            -displayAppearance \"smoothShaded\" \n            -activeOnly 0\n            -ignorePanZoom 0\n            -wireframeOnShaded 0\n            -headsUpDisplay 1\n            -selectionHiliteDisplay 1\n            -useDefaultMaterial 0\n            -bufferMode \"double\" \n            -twoSidedLighting 0\n            -backfaceCulling 0\n            -xray 0\n            -jointXray 0\n            -activeComponentsXray 0\n            -displayTextures 0\n            -smoothWireframe 0\n            -lineWidth 1\n            -textureAnisotropic 0\n            -textureHilight 1\n            -textureSampling 2\n            -textureDisplay \"modulate\" \n"
		+ "            -textureMaxSize 8192\n            -fogging 0\n            -fogSource \"fragment\" \n            -fogMode \"linear\" \n            -fogStart 0\n            -fogEnd 100\n            -fogDensity 0.1\n            -fogColor 0.5 0.5 0.5 1 \n            -maxConstantTransparency 1\n            -rendererName \"vp2Renderer\" \n            -objectFilterShowInHUD 1\n            -isFiltered 0\n            -colorResolution 256 256 \n            -bumpResolution 512 512 \n            -textureCompression 0\n            -transparencyAlgorithm \"frontAndBackCull\" \n            -transpInShadows 0\n            -cullingOverride \"none\" \n            -lowQualityLighting 0\n            -maximumNumHardwareLights 1\n            -occlusionCulling 0\n            -shadingModel 0\n            -useBaseRenderer 0\n            -useReducedRenderer 0\n            -smallObjectCulling 0\n            -smallObjectThreshold -1 \n            -interactiveDisableShadows 0\n            -interactiveBackFaceCull 0\n            -sortTransparent 1\n            -nurbsCurves 1\n            -nurbsSurfaces 1\n"
		+ "            -polymeshes 1\n            -subdivSurfaces 1\n            -planes 1\n            -lights 1\n            -cameras 1\n            -controlVertices 1\n            -hulls 1\n            -grid 1\n            -imagePlane 1\n            -joints 1\n            -ikHandles 1\n            -deformers 1\n            -dynamics 1\n            -particleInstancers 1\n            -fluids 1\n            -hairSystems 1\n            -follicles 1\n            -nCloths 1\n            -nParticles 1\n            -nRigids 1\n            -dynamicConstraints 1\n            -locators 1\n            -manipulators 1\n            -pluginShapes 1\n            -dimensions 1\n            -handles 1\n            -pivots 1\n            -textures 1\n            -strokes 1\n            -motionTrails 1\n            -clipGhosts 1\n            -greasePencils 1\n            -shadows 0\n            $editorName;\n        modelEditor -e -viewSelected 0 $editorName;\n        modelEditor -e \n            -pluginObjects \"gpuCacheDisplayFilter\" 1 \n            $editorName;\n\t\tif (!$useSceneConfig) {\n"
		+ "\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" (localizedPanelLabel(\"Front View\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `modelPanel -unParent -l (localizedPanelLabel(\"Front View\")) -mbv $menusOkayInPanels `;\n\t\t\t$editorName = $panelName;\n            modelEditor -e \n                -camera \"front\" \n                -useInteractiveMode 0\n                -displayLights \"default\" \n                -displayAppearance \"smoothShaded\" \n                -activeOnly 0\n                -ignorePanZoom 0\n                -wireframeOnShaded 0\n                -headsUpDisplay 1\n                -selectionHiliteDisplay 1\n                -useDefaultMaterial 0\n                -bufferMode \"double\" \n                -twoSidedLighting 0\n                -backfaceCulling 0\n                -xray 0\n                -jointXray 0\n                -activeComponentsXray 0\n                -displayTextures 0\n                -smoothWireframe 0\n                -lineWidth 1\n"
		+ "                -textureAnisotropic 0\n                -textureHilight 1\n                -textureSampling 2\n                -textureDisplay \"modulate\" \n                -textureMaxSize 8192\n                -fogging 0\n                -fogSource \"fragment\" \n                -fogMode \"linear\" \n                -fogStart 0\n                -fogEnd 100\n                -fogDensity 0.1\n                -fogColor 0.5 0.5 0.5 1 \n                -maxConstantTransparency 1\n                -rendererName \"vp2Renderer\" \n                -objectFilterShowInHUD 1\n                -isFiltered 0\n                -colorResolution 256 256 \n                -bumpResolution 512 512 \n                -textureCompression 0\n                -transparencyAlgorithm \"frontAndBackCull\" \n                -transpInShadows 0\n                -cullingOverride \"none\" \n                -lowQualityLighting 0\n                -maximumNumHardwareLights 1\n                -occlusionCulling 0\n                -shadingModel 0\n                -useBaseRenderer 0\n                -useReducedRenderer 0\n"
		+ "                -smallObjectCulling 0\n                -smallObjectThreshold -1 \n                -interactiveDisableShadows 0\n                -interactiveBackFaceCull 0\n                -sortTransparent 1\n                -nurbsCurves 1\n                -nurbsSurfaces 1\n                -polymeshes 1\n                -subdivSurfaces 1\n                -planes 1\n                -lights 1\n                -cameras 1\n                -controlVertices 1\n                -hulls 1\n                -grid 1\n                -imagePlane 1\n                -joints 1\n                -ikHandles 1\n                -deformers 1\n                -dynamics 1\n                -particleInstancers 1\n                -fluids 1\n                -hairSystems 1\n                -follicles 1\n                -nCloths 1\n                -nParticles 1\n                -nRigids 1\n                -dynamicConstraints 1\n                -locators 1\n                -manipulators 1\n                -pluginShapes 1\n                -dimensions 1\n                -handles 1\n"
		+ "                -pivots 1\n                -textures 1\n                -strokes 1\n                -motionTrails 1\n                -clipGhosts 1\n                -greasePencils 1\n                -shadows 0\n                $editorName;\n            modelEditor -e -viewSelected 0 $editorName;\n            modelEditor -e \n                -pluginObjects \"gpuCacheDisplayFilter\" 1 \n                $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tmodelPanel -edit -l (localizedPanelLabel(\"Front View\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        modelEditor -e \n            -camera \"front\" \n            -useInteractiveMode 0\n            -displayLights \"default\" \n            -displayAppearance \"smoothShaded\" \n            -activeOnly 0\n            -ignorePanZoom 0\n            -wireframeOnShaded 0\n            -headsUpDisplay 1\n            -selectionHiliteDisplay 1\n            -useDefaultMaterial 0\n            -bufferMode \"double\" \n            -twoSidedLighting 0\n            -backfaceCulling 0\n"
		+ "            -xray 0\n            -jointXray 0\n            -activeComponentsXray 0\n            -displayTextures 0\n            -smoothWireframe 0\n            -lineWidth 1\n            -textureAnisotropic 0\n            -textureHilight 1\n            -textureSampling 2\n            -textureDisplay \"modulate\" \n            -textureMaxSize 8192\n            -fogging 0\n            -fogSource \"fragment\" \n            -fogMode \"linear\" \n            -fogStart 0\n            -fogEnd 100\n            -fogDensity 0.1\n            -fogColor 0.5 0.5 0.5 1 \n            -maxConstantTransparency 1\n            -rendererName \"vp2Renderer\" \n            -objectFilterShowInHUD 1\n            -isFiltered 0\n            -colorResolution 256 256 \n            -bumpResolution 512 512 \n            -textureCompression 0\n            -transparencyAlgorithm \"frontAndBackCull\" \n            -transpInShadows 0\n            -cullingOverride \"none\" \n            -lowQualityLighting 0\n            -maximumNumHardwareLights 1\n            -occlusionCulling 0\n            -shadingModel 0\n"
		+ "            -useBaseRenderer 0\n            -useReducedRenderer 0\n            -smallObjectCulling 0\n            -smallObjectThreshold -1 \n            -interactiveDisableShadows 0\n            -interactiveBackFaceCull 0\n            -sortTransparent 1\n            -nurbsCurves 1\n            -nurbsSurfaces 1\n            -polymeshes 1\n            -subdivSurfaces 1\n            -planes 1\n            -lights 1\n            -cameras 1\n            -controlVertices 1\n            -hulls 1\n            -grid 1\n            -imagePlane 1\n            -joints 1\n            -ikHandles 1\n            -deformers 1\n            -dynamics 1\n            -particleInstancers 1\n            -fluids 1\n            -hairSystems 1\n            -follicles 1\n            -nCloths 1\n            -nParticles 1\n            -nRigids 1\n            -dynamicConstraints 1\n            -locators 1\n            -manipulators 1\n            -pluginShapes 1\n            -dimensions 1\n            -handles 1\n            -pivots 1\n            -textures 1\n            -strokes 1\n"
		+ "            -motionTrails 1\n            -clipGhosts 1\n            -greasePencils 1\n            -shadows 0\n            $editorName;\n        modelEditor -e -viewSelected 0 $editorName;\n        modelEditor -e \n            -pluginObjects \"gpuCacheDisplayFilter\" 1 \n            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" (localizedPanelLabel(\"Persp View\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `modelPanel -unParent -l (localizedPanelLabel(\"Persp View\")) -mbv $menusOkayInPanels `;\n\t\t\t$editorName = $panelName;\n            modelEditor -e \n                -camera \"persp\" \n                -useInteractiveMode 0\n                -displayLights \"default\" \n                -displayAppearance \"smoothShaded\" \n                -activeOnly 0\n                -ignorePanZoom 0\n                -wireframeOnShaded 0\n                -headsUpDisplay 1\n                -selectionHiliteDisplay 1\n                -useDefaultMaterial 0\n"
		+ "                -bufferMode \"double\" \n                -twoSidedLighting 0\n                -backfaceCulling 0\n                -xray 0\n                -jointXray 0\n                -activeComponentsXray 0\n                -displayTextures 0\n                -smoothWireframe 0\n                -lineWidth 1\n                -textureAnisotropic 0\n                -textureHilight 1\n                -textureSampling 2\n                -textureDisplay \"modulate\" \n                -textureMaxSize 8192\n                -fogging 0\n                -fogSource \"fragment\" \n                -fogMode \"linear\" \n                -fogStart 0\n                -fogEnd 100\n                -fogDensity 0.1\n                -fogColor 0.5 0.5 0.5 1 \n                -maxConstantTransparency 1\n                -rendererName \"vp2Renderer\" \n                -objectFilterShowInHUD 1\n                -isFiltered 0\n                -colorResolution 256 256 \n                -bumpResolution 512 512 \n                -textureCompression 0\n                -transparencyAlgorithm \"frontAndBackCull\" \n"
		+ "                -transpInShadows 0\n                -cullingOverride \"none\" \n                -lowQualityLighting 0\n                -maximumNumHardwareLights 1\n                -occlusionCulling 0\n                -shadingModel 0\n                -useBaseRenderer 0\n                -useReducedRenderer 0\n                -smallObjectCulling 0\n                -smallObjectThreshold -1 \n                -interactiveDisableShadows 0\n                -interactiveBackFaceCull 0\n                -sortTransparent 1\n                -nurbsCurves 1\n                -nurbsSurfaces 1\n                -polymeshes 1\n                -subdivSurfaces 1\n                -planes 1\n                -lights 1\n                -cameras 1\n                -controlVertices 1\n                -hulls 1\n                -grid 1\n                -imagePlane 1\n                -joints 1\n                -ikHandles 1\n                -deformers 1\n                -dynamics 1\n                -particleInstancers 1\n                -fluids 1\n                -hairSystems 1\n"
		+ "                -follicles 1\n                -nCloths 1\n                -nParticles 1\n                -nRigids 1\n                -dynamicConstraints 1\n                -locators 1\n                -manipulators 1\n                -pluginShapes 1\n                -dimensions 1\n                -handles 1\n                -pivots 1\n                -textures 1\n                -strokes 1\n                -motionTrails 1\n                -clipGhosts 1\n                -greasePencils 1\n                -shadows 0\n                $editorName;\n            modelEditor -e -viewSelected 0 $editorName;\n            modelEditor -e \n                -pluginObjects \"gpuCacheDisplayFilter\" 1 \n                $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tmodelPanel -edit -l (localizedPanelLabel(\"Persp View\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        modelEditor -e \n            -camera \"persp\" \n            -useInteractiveMode 0\n            -displayLights \"default\" \n            -displayAppearance \"smoothShaded\" \n"
		+ "            -activeOnly 0\n            -ignorePanZoom 0\n            -wireframeOnShaded 0\n            -headsUpDisplay 1\n            -selectionHiliteDisplay 1\n            -useDefaultMaterial 0\n            -bufferMode \"double\" \n            -twoSidedLighting 0\n            -backfaceCulling 0\n            -xray 0\n            -jointXray 0\n            -activeComponentsXray 0\n            -displayTextures 0\n            -smoothWireframe 0\n            -lineWidth 1\n            -textureAnisotropic 0\n            -textureHilight 1\n            -textureSampling 2\n            -textureDisplay \"modulate\" \n            -textureMaxSize 8192\n            -fogging 0\n            -fogSource \"fragment\" \n            -fogMode \"linear\" \n            -fogStart 0\n            -fogEnd 100\n            -fogDensity 0.1\n            -fogColor 0.5 0.5 0.5 1 \n            -maxConstantTransparency 1\n            -rendererName \"vp2Renderer\" \n            -objectFilterShowInHUD 1\n            -isFiltered 0\n            -colorResolution 256 256 \n            -bumpResolution 512 512 \n"
		+ "            -textureCompression 0\n            -transparencyAlgorithm \"frontAndBackCull\" \n            -transpInShadows 0\n            -cullingOverride \"none\" \n            -lowQualityLighting 0\n            -maximumNumHardwareLights 1\n            -occlusionCulling 0\n            -shadingModel 0\n            -useBaseRenderer 0\n            -useReducedRenderer 0\n            -smallObjectCulling 0\n            -smallObjectThreshold -1 \n            -interactiveDisableShadows 0\n            -interactiveBackFaceCull 0\n            -sortTransparent 1\n            -nurbsCurves 1\n            -nurbsSurfaces 1\n            -polymeshes 1\n            -subdivSurfaces 1\n            -planes 1\n            -lights 1\n            -cameras 1\n            -controlVertices 1\n            -hulls 1\n            -grid 1\n            -imagePlane 1\n            -joints 1\n            -ikHandles 1\n            -deformers 1\n            -dynamics 1\n            -particleInstancers 1\n            -fluids 1\n            -hairSystems 1\n            -follicles 1\n            -nCloths 1\n"
		+ "            -nParticles 1\n            -nRigids 1\n            -dynamicConstraints 1\n            -locators 1\n            -manipulators 1\n            -pluginShapes 1\n            -dimensions 1\n            -handles 1\n            -pivots 1\n            -textures 1\n            -strokes 1\n            -motionTrails 1\n            -clipGhosts 1\n            -greasePencils 1\n            -shadows 0\n            $editorName;\n        modelEditor -e -viewSelected 0 $editorName;\n        modelEditor -e \n            -pluginObjects \"gpuCacheDisplayFilter\" 1 \n            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"outlinerPanel\" (localizedPanelLabel(\"Outliner\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `outlinerPanel -unParent -l (localizedPanelLabel(\"Outliner\")) -mbv $menusOkayInPanels `;\n\t\t\t$editorName = $panelName;\n            outlinerEditor -e \n                -docTag \"isolOutln_fromSeln\" \n                -showShapes 0\n"
		+ "                -showReferenceNodes 1\n                -showReferenceMembers 1\n                -showAttributes 0\n                -showConnected 0\n                -showAnimCurvesOnly 0\n                -showMuteInfo 0\n                -organizeByLayer 1\n                -showAnimLayerWeight 1\n                -autoExpandLayers 1\n                -autoExpand 0\n                -showDagOnly 1\n                -showAssets 1\n                -showContainedOnly 1\n                -showPublishedAsConnected 0\n                -showContainerContents 1\n                -ignoreDagHierarchy 0\n                -expandConnections 0\n                -showUpstreamCurves 1\n                -showUnitlessCurves 1\n                -showCompounds 1\n                -showLeafs 1\n                -showNumericAttrsOnly 0\n                -highlightActive 1\n                -autoSelectNewObjects 0\n                -doNotSelectNewObjects 0\n                -dropIsParent 1\n                -transmitFilters 0\n                -setFilter \"defaultSetFilter\" \n                -showSetMembers 1\n"
		+ "                -allowMultiSelection 1\n                -alwaysToggleSelect 0\n                -directSelect 0\n                -displayMode \"DAG\" \n                -expandObjects 0\n                -setsIgnoreFilters 1\n                -containersIgnoreFilters 0\n                -editAttrName 0\n                -showAttrValues 0\n                -highlightSecondary 0\n                -showUVAttrsOnly 0\n                -showTextureNodesOnly 0\n                -attrAlphaOrder \"default\" \n                -animLayerFilterOptions \"allAffecting\" \n                -sortOrder \"none\" \n                -longNames 0\n                -niceNames 1\n                -showNamespace 1\n                -showPinIcons 0\n                -mapMotionTrails 0\n                -ignoreHiddenAttribute 0\n                $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\toutlinerPanel -edit -l (localizedPanelLabel(\"Outliner\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        outlinerEditor -e \n            -docTag \"isolOutln_fromSeln\" \n"
		+ "            -showShapes 0\n            -showReferenceNodes 1\n            -showReferenceMembers 1\n            -showAttributes 0\n            -showConnected 0\n            -showAnimCurvesOnly 0\n            -showMuteInfo 0\n            -organizeByLayer 1\n            -showAnimLayerWeight 1\n            -autoExpandLayers 1\n            -autoExpand 0\n            -showDagOnly 1\n            -showAssets 1\n            -showContainedOnly 1\n            -showPublishedAsConnected 0\n            -showContainerContents 1\n            -ignoreDagHierarchy 0\n            -expandConnections 0\n            -showUpstreamCurves 1\n            -showUnitlessCurves 1\n            -showCompounds 1\n            -showLeafs 1\n            -showNumericAttrsOnly 0\n            -highlightActive 1\n            -autoSelectNewObjects 0\n            -doNotSelectNewObjects 0\n            -dropIsParent 1\n            -transmitFilters 0\n            -setFilter \"defaultSetFilter\" \n            -showSetMembers 1\n            -allowMultiSelection 1\n            -alwaysToggleSelect 0\n"
		+ "            -directSelect 0\n            -displayMode \"DAG\" \n            -expandObjects 0\n            -setsIgnoreFilters 1\n            -containersIgnoreFilters 0\n            -editAttrName 0\n            -showAttrValues 0\n            -highlightSecondary 0\n            -showUVAttrsOnly 0\n            -showTextureNodesOnly 0\n            -attrAlphaOrder \"default\" \n            -animLayerFilterOptions \"allAffecting\" \n            -sortOrder \"none\" \n            -longNames 0\n            -niceNames 1\n            -showNamespace 1\n            -showPinIcons 0\n            -mapMotionTrails 0\n            -ignoreHiddenAttribute 0\n            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"graphEditor\" (localizedPanelLabel(\"Graph Editor\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"graphEditor\" -l (localizedPanelLabel(\"Graph Editor\")) -mbv $menusOkayInPanels `;\n\n\t\t\t$editorName = ($panelName+\"OutlineEd\");\n"
		+ "            outlinerEditor -e \n                -showShapes 1\n                -showReferenceNodes 0\n                -showReferenceMembers 0\n                -showAttributes 1\n                -showConnected 1\n                -showAnimCurvesOnly 1\n                -showMuteInfo 0\n                -organizeByLayer 1\n                -showAnimLayerWeight 1\n                -autoExpandLayers 1\n                -autoExpand 1\n                -showDagOnly 0\n                -showAssets 1\n                -showContainedOnly 0\n                -showPublishedAsConnected 0\n                -showContainerContents 0\n                -ignoreDagHierarchy 0\n                -expandConnections 1\n                -showUpstreamCurves 1\n                -showUnitlessCurves 1\n                -showCompounds 0\n                -showLeafs 1\n                -showNumericAttrsOnly 1\n                -highlightActive 0\n                -autoSelectNewObjects 1\n                -doNotSelectNewObjects 0\n                -dropIsParent 1\n                -transmitFilters 1\n"
		+ "                -setFilter \"0\" \n                -showSetMembers 0\n                -allowMultiSelection 1\n                -alwaysToggleSelect 0\n                -directSelect 0\n                -displayMode \"DAG\" \n                -expandObjects 0\n                -setsIgnoreFilters 1\n                -containersIgnoreFilters 0\n                -editAttrName 0\n                -showAttrValues 0\n                -highlightSecondary 0\n                -showUVAttrsOnly 0\n                -showTextureNodesOnly 0\n                -attrAlphaOrder \"default\" \n                -animLayerFilterOptions \"allAffecting\" \n                -sortOrder \"none\" \n                -longNames 0\n                -niceNames 1\n                -showNamespace 1\n                -showPinIcons 1\n                -mapMotionTrails 1\n                -ignoreHiddenAttribute 0\n                $editorName;\n\n\t\t\t$editorName = ($panelName+\"GraphEd\");\n            animCurveEditor -e \n                -displayKeys 1\n                -displayTangents 0\n                -displayActiveKeys 0\n"
		+ "                -displayActiveKeyTangents 1\n                -displayInfinities 0\n                -autoFit 0\n                -snapTime \"integer\" \n                -snapValue \"none\" \n                -showResults \"off\" \n                -showBufferCurves \"off\" \n                -smoothness \"fine\" \n                -resultSamples 1\n                -resultScreenSamples 0\n                -resultUpdate \"delayed\" \n                -showUpstreamCurves 1\n                -stackedCurves 0\n                -stackedCurvesMin -1\n                -stackedCurvesMax 1\n                -stackedCurvesSpace 0.2\n                -displayNormalized 0\n                -preSelectionHighlight 0\n                -constrainDrag 0\n                -classicMode 1\n                $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Graph Editor\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = ($panelName+\"OutlineEd\");\n            outlinerEditor -e \n                -showShapes 1\n                -showReferenceNodes 0\n"
		+ "                -showReferenceMembers 0\n                -showAttributes 1\n                -showConnected 1\n                -showAnimCurvesOnly 1\n                -showMuteInfo 0\n                -organizeByLayer 1\n                -showAnimLayerWeight 1\n                -autoExpandLayers 1\n                -autoExpand 1\n                -showDagOnly 0\n                -showAssets 1\n                -showContainedOnly 0\n                -showPublishedAsConnected 0\n                -showContainerContents 0\n                -ignoreDagHierarchy 0\n                -expandConnections 1\n                -showUpstreamCurves 1\n                -showUnitlessCurves 1\n                -showCompounds 0\n                -showLeafs 1\n                -showNumericAttrsOnly 1\n                -highlightActive 0\n                -autoSelectNewObjects 1\n                -doNotSelectNewObjects 0\n                -dropIsParent 1\n                -transmitFilters 1\n                -setFilter \"0\" \n                -showSetMembers 0\n                -allowMultiSelection 1\n"
		+ "                -alwaysToggleSelect 0\n                -directSelect 0\n                -displayMode \"DAG\" \n                -expandObjects 0\n                -setsIgnoreFilters 1\n                -containersIgnoreFilters 0\n                -editAttrName 0\n                -showAttrValues 0\n                -highlightSecondary 0\n                -showUVAttrsOnly 0\n                -showTextureNodesOnly 0\n                -attrAlphaOrder \"default\" \n                -animLayerFilterOptions \"allAffecting\" \n                -sortOrder \"none\" \n                -longNames 0\n                -niceNames 1\n                -showNamespace 1\n                -showPinIcons 1\n                -mapMotionTrails 1\n                -ignoreHiddenAttribute 0\n                $editorName;\n\n\t\t\t$editorName = ($panelName+\"GraphEd\");\n            animCurveEditor -e \n                -displayKeys 1\n                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 1\n                -displayInfinities 0\n                -autoFit 0\n"
		+ "                -snapTime \"integer\" \n                -snapValue \"none\" \n                -showResults \"off\" \n                -showBufferCurves \"off\" \n                -smoothness \"fine\" \n                -resultSamples 1\n                -resultScreenSamples 0\n                -resultUpdate \"delayed\" \n                -showUpstreamCurves 1\n                -stackedCurves 0\n                -stackedCurvesMin -1\n                -stackedCurvesMax 1\n                -stackedCurvesSpace 0.2\n                -displayNormalized 0\n                -preSelectionHighlight 0\n                -constrainDrag 0\n                -classicMode 1\n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"dopeSheetPanel\" (localizedPanelLabel(\"Dope Sheet\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"dopeSheetPanel\" -l (localizedPanelLabel(\"Dope Sheet\")) -mbv $menusOkayInPanels `;\n\n\t\t\t$editorName = ($panelName+\"OutlineEd\");\n"
		+ "            outlinerEditor -e \n                -showShapes 1\n                -showReferenceNodes 0\n                -showReferenceMembers 0\n                -showAttributes 1\n                -showConnected 1\n                -showAnimCurvesOnly 1\n                -showMuteInfo 0\n                -organizeByLayer 1\n                -showAnimLayerWeight 1\n                -autoExpandLayers 1\n                -autoExpand 0\n                -showDagOnly 0\n                -showAssets 1\n                -showContainedOnly 0\n                -showPublishedAsConnected 0\n                -showContainerContents 0\n                -ignoreDagHierarchy 0\n                -expandConnections 1\n                -showUpstreamCurves 1\n                -showUnitlessCurves 0\n                -showCompounds 1\n                -showLeafs 1\n                -showNumericAttrsOnly 1\n                -highlightActive 0\n                -autoSelectNewObjects 0\n                -doNotSelectNewObjects 1\n                -dropIsParent 1\n                -transmitFilters 0\n"
		+ "                -setFilter \"0\" \n                -showSetMembers 0\n                -allowMultiSelection 1\n                -alwaysToggleSelect 0\n                -directSelect 0\n                -displayMode \"DAG\" \n                -expandObjects 0\n                -setsIgnoreFilters 1\n                -containersIgnoreFilters 0\n                -editAttrName 0\n                -showAttrValues 0\n                -highlightSecondary 0\n                -showUVAttrsOnly 0\n                -showTextureNodesOnly 0\n                -attrAlphaOrder \"default\" \n                -animLayerFilterOptions \"allAffecting\" \n                -sortOrder \"none\" \n                -longNames 0\n                -niceNames 1\n                -showNamespace 1\n                -showPinIcons 0\n                -mapMotionTrails 1\n                -ignoreHiddenAttribute 0\n                $editorName;\n\n\t\t\t$editorName = ($panelName+\"DopeSheetEd\");\n            dopeSheetEditor -e \n                -displayKeys 1\n                -displayTangents 0\n                -displayActiveKeys 0\n"
		+ "                -displayActiveKeyTangents 0\n                -displayInfinities 0\n                -autoFit 0\n                -snapTime \"integer\" \n                -snapValue \"none\" \n                -outliner \"dopeSheetPanel1OutlineEd\" \n                -showSummary 1\n                -showScene 0\n                -hierarchyBelow 0\n                -showTicks 1\n                -selectionWindow 0 0 0 0 \n                $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Dope Sheet\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = ($panelName+\"OutlineEd\");\n            outlinerEditor -e \n                -showShapes 1\n                -showReferenceNodes 0\n                -showReferenceMembers 0\n                -showAttributes 1\n                -showConnected 1\n                -showAnimCurvesOnly 1\n                -showMuteInfo 0\n                -organizeByLayer 1\n                -showAnimLayerWeight 1\n                -autoExpandLayers 1\n                -autoExpand 0\n"
		+ "                -showDagOnly 0\n                -showAssets 1\n                -showContainedOnly 0\n                -showPublishedAsConnected 0\n                -showContainerContents 0\n                -ignoreDagHierarchy 0\n                -expandConnections 1\n                -showUpstreamCurves 1\n                -showUnitlessCurves 0\n                -showCompounds 1\n                -showLeafs 1\n                -showNumericAttrsOnly 1\n                -highlightActive 0\n                -autoSelectNewObjects 0\n                -doNotSelectNewObjects 1\n                -dropIsParent 1\n                -transmitFilters 0\n                -setFilter \"0\" \n                -showSetMembers 0\n                -allowMultiSelection 1\n                -alwaysToggleSelect 0\n                -directSelect 0\n                -displayMode \"DAG\" \n                -expandObjects 0\n                -setsIgnoreFilters 1\n                -containersIgnoreFilters 0\n                -editAttrName 0\n                -showAttrValues 0\n                -highlightSecondary 0\n"
		+ "                -showUVAttrsOnly 0\n                -showTextureNodesOnly 0\n                -attrAlphaOrder \"default\" \n                -animLayerFilterOptions \"allAffecting\" \n                -sortOrder \"none\" \n                -longNames 0\n                -niceNames 1\n                -showNamespace 1\n                -showPinIcons 0\n                -mapMotionTrails 1\n                -ignoreHiddenAttribute 0\n                $editorName;\n\n\t\t\t$editorName = ($panelName+\"DopeSheetEd\");\n            dopeSheetEditor -e \n                -displayKeys 1\n                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 0\n                -displayInfinities 0\n                -autoFit 0\n                -snapTime \"integer\" \n                -snapValue \"none\" \n                -outliner \"dopeSheetPanel1OutlineEd\" \n                -showSummary 1\n                -showScene 0\n                -hierarchyBelow 0\n                -showTicks 1\n                -selectionWindow 0 0 0 0 \n                $editorName;\n"
		+ "\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"clipEditorPanel\" (localizedPanelLabel(\"Trax Editor\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"clipEditorPanel\" -l (localizedPanelLabel(\"Trax Editor\")) -mbv $menusOkayInPanels `;\n\n\t\t\t$editorName = clipEditorNameFromPanel($panelName);\n            clipEditor -e \n                -displayKeys 0\n                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 0\n                -displayInfinities 0\n                -autoFit 0\n                -snapTime \"none\" \n                -snapValue \"none\" \n                -manageSequencer 0 \n                $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Trax Editor\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = clipEditorNameFromPanel($panelName);\n            clipEditor -e \n"
		+ "                -displayKeys 0\n                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 0\n                -displayInfinities 0\n                -autoFit 0\n                -snapTime \"none\" \n                -snapValue \"none\" \n                -manageSequencer 0 \n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"sequenceEditorPanel\" (localizedPanelLabel(\"Camera Sequencer\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"sequenceEditorPanel\" -l (localizedPanelLabel(\"Camera Sequencer\")) -mbv $menusOkayInPanels `;\n\n\t\t\t$editorName = sequenceEditorNameFromPanel($panelName);\n            clipEditor -e \n                -displayKeys 0\n                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 0\n                -displayInfinities 0\n                -autoFit 0\n"
		+ "                -snapTime \"none\" \n                -snapValue \"none\" \n                -manageSequencer 1 \n                $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Camera Sequencer\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = sequenceEditorNameFromPanel($panelName);\n            clipEditor -e \n                -displayKeys 0\n                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 0\n                -displayInfinities 0\n                -autoFit 0\n                -snapTime \"none\" \n                -snapValue \"none\" \n                -manageSequencer 1 \n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"hyperGraphPanel\" (localizedPanelLabel(\"Hypergraph Hierarchy\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"hyperGraphPanel\" -l (localizedPanelLabel(\"Hypergraph Hierarchy\")) -mbv $menusOkayInPanels `;\n"
		+ "\t\t\t$editorName = ($panelName+\"HyperGraphEd\");\n            hyperGraph -e \n                -graphLayoutStyle \"hierarchicalLayout\" \n                -orientation \"horiz\" \n                -mergeConnections 0\n                -zoom 1\n                -animateTransition 0\n                -showRelationships 1\n                -showShapes 0\n                -showDeformers 0\n                -showExpressions 0\n                -showConstraints 0\n                -showConnectionFromSelected 0\n                -showConnectionToSelected 0\n                -showConstraintLabels 0\n                -showUnderworld 0\n                -showInvisible 0\n                -transitionFrames 1\n                -opaqueContainers 0\n                -freeform 0\n                -imagePosition 0 0 \n                -imageScale 1\n                -imageEnabled 0\n                -graphType \"DAG\" \n                -heatMapDisplay 0\n                -updateSelection 1\n                -updateNodeAdded 1\n                -useDrawOverrideColor 0\n                -limitGraphTraversal -1\n"
		+ "                -range 0 0 \n                -iconSize \"smallIcons\" \n                -showCachedConnections 0\n                $editorName;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Hypergraph Hierarchy\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = ($panelName+\"HyperGraphEd\");\n            hyperGraph -e \n                -graphLayoutStyle \"hierarchicalLayout\" \n                -orientation \"horiz\" \n                -mergeConnections 0\n                -zoom 1\n                -animateTransition 0\n                -showRelationships 1\n                -showShapes 0\n                -showDeformers 0\n                -showExpressions 0\n                -showConstraints 0\n                -showConnectionFromSelected 0\n                -showConnectionToSelected 0\n                -showConstraintLabels 0\n                -showUnderworld 0\n                -showInvisible 0\n                -transitionFrames 1\n                -opaqueContainers 0\n                -freeform 0\n"
		+ "                -imagePosition 0 0 \n                -imageScale 1\n                -imageEnabled 0\n                -graphType \"DAG\" \n                -heatMapDisplay 0\n                -updateSelection 1\n                -updateNodeAdded 1\n                -useDrawOverrideColor 0\n                -limitGraphTraversal -1\n                -range 0 0 \n                -iconSize \"smallIcons\" \n                -showCachedConnections 0\n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"hyperShadePanel\" (localizedPanelLabel(\"Hypershade\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"hyperShadePanel\" -l (localizedPanelLabel(\"Hypershade\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Hypershade\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n"
		+ "\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"visorPanel\" (localizedPanelLabel(\"Visor\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"visorPanel\" -l (localizedPanelLabel(\"Visor\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Visor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"nodeEditorPanel\" (localizedPanelLabel(\"Node Editor\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"nodeEditorPanel\" -l (localizedPanelLabel(\"Node Editor\")) -mbv $menusOkayInPanels `;\n\n\t\t\t$editorName = ($panelName+\"NodeEditorEd\");\n            nodeEditor -e \n                -allAttributes 0\n                -allNodes 0\n                -autoSizeNodes 1\n                -createNodeCommand \"nodeEdCreateNodeCommand\" \n"
		+ "                -defaultPinnedState 0\n                -ignoreAssets 1\n                -additiveGraphingMode 0\n                -settingsChangedCallback \"nodeEdSyncControls\" \n                -traversalDepthLimit -1\n                -keyPressCommand \"nodeEdKeyPressCommand\" \n                -keyReleaseCommand \"nodeEdKeyReleaseCommand\" \n                -nodeTitleMode \"name\" \n                -gridSnap 0\n                -gridVisibility 1\n                -popupMenuScript \"nodeEdBuildPanelMenus\" \n                -showNamespace 1\n                -showShapes 1\n                -showSGShapes 0\n                -showTransforms 1\n                -useAssets 1\n                -syncedSelection 1\n                -extendToShapes 1\n                $editorName;;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Node Editor\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = ($panelName+\"NodeEditorEd\");\n            nodeEditor -e \n                -allAttributes 0\n                -allNodes 0\n"
		+ "                -autoSizeNodes 1\n                -createNodeCommand \"nodeEdCreateNodeCommand\" \n                -defaultPinnedState 0\n                -ignoreAssets 1\n                -additiveGraphingMode 0\n                -settingsChangedCallback \"nodeEdSyncControls\" \n                -traversalDepthLimit -1\n                -keyPressCommand \"nodeEdKeyPressCommand\" \n                -keyReleaseCommand \"nodeEdKeyReleaseCommand\" \n                -nodeTitleMode \"name\" \n                -gridSnap 0\n                -gridVisibility 1\n                -popupMenuScript \"nodeEdBuildPanelMenus\" \n                -showNamespace 1\n                -showShapes 1\n                -showSGShapes 0\n                -showTransforms 1\n                -useAssets 1\n                -syncedSelection 1\n                -extendToShapes 1\n                $editorName;;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"createNodePanel\" (localizedPanelLabel(\"Create Node\")) `;\n"
		+ "\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"createNodePanel\" -l (localizedPanelLabel(\"Create Node\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Create Node\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"polyTexturePlacementPanel\" (localizedPanelLabel(\"UV Texture Editor\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"polyTexturePlacementPanel\" -l (localizedPanelLabel(\"UV Texture Editor\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"UV Texture Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"renderWindowPanel\" (localizedPanelLabel(\"Render View\")) `;\n"
		+ "\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"renderWindowPanel\" -l (localizedPanelLabel(\"Render View\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Render View\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"blendShapePanel\" (localizedPanelLabel(\"Blend Shape\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\tblendShapePanel -unParent -l (localizedPanelLabel(\"Blend Shape\")) -mbv $menusOkayInPanels ;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tblendShapePanel -edit -l (localizedPanelLabel(\"Blend Shape\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"dynRelEdPanel\" (localizedPanelLabel(\"Dynamic Relationships\")) `;\n\tif (\"\" == $panelName) {\n"
		+ "\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"dynRelEdPanel\" -l (localizedPanelLabel(\"Dynamic Relationships\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Dynamic Relationships\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"relationshipPanel\" (localizedPanelLabel(\"Relationship Editor\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"relationshipPanel\" -l (localizedPanelLabel(\"Relationship Editor\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Relationship Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"referenceEditorPanel\" (localizedPanelLabel(\"Reference Editor\")) `;\n"
		+ "\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"referenceEditorPanel\" -l (localizedPanelLabel(\"Reference Editor\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Reference Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"componentEditorPanel\" (localizedPanelLabel(\"Component Editor\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"componentEditorPanel\" -l (localizedPanelLabel(\"Component Editor\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Component Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"dynPaintScriptedPanelType\" (localizedPanelLabel(\"Paint Effects\")) `;\n"
		+ "\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"dynPaintScriptedPanelType\" -l (localizedPanelLabel(\"Paint Effects\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Paint Effects\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"scriptEditorPanel\" (localizedPanelLabel(\"Script Editor\")) `;\n\tif (\"\" == $panelName) {\n\t\tif ($useSceneConfig) {\n\t\t\t$panelName = `scriptedPanel -unParent  -type \"scriptEditorPanel\" -l (localizedPanelLabel(\"Script Editor\")) -mbv $menusOkayInPanels `;\n\t\t}\n\t} else {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Script Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\tif ($useSceneConfig) {\n        string $configName = `getPanel -cwl (localizedPanelLabel(\"Current Layout\"))`;\n"
		+ "        if (\"\" != $configName) {\n\t\t\tpanelConfiguration -edit -label (localizedPanelLabel(\"Current Layout\")) \n\t\t\t\t-defaultImage \"\"\n\t\t\t\t-image \"\"\n\t\t\t\t-sc false\n\t\t\t\t-configString \"global string $gMainPane; paneLayout -e -cn \\\"single\\\" -ps 1 100 100 $gMainPane;\"\n\t\t\t\t-removeAllPanels\n\t\t\t\t-ap false\n\t\t\t\t\t(localizedPanelLabel(\"Persp View\")) \n\t\t\t\t\t\"modelPanel\"\n"
		+ "\t\t\t\t\t\"$panelName = `modelPanel -unParent -l (localizedPanelLabel(\\\"Persp View\\\")) -mbv $menusOkayInPanels `;\\n$editorName = $panelName;\\nmodelEditor -e \\n    -cam `findStartUpCamera persp` \\n    -useInteractiveMode 0\\n    -displayLights \\\"default\\\" \\n    -displayAppearance \\\"smoothShaded\\\" \\n    -activeOnly 0\\n    -ignorePanZoom 0\\n    -wireframeOnShaded 0\\n    -headsUpDisplay 1\\n    -selectionHiliteDisplay 1\\n    -useDefaultMaterial 0\\n    -bufferMode \\\"double\\\" \\n    -twoSidedLighting 0\\n    -backfaceCulling 0\\n    -xray 0\\n    -jointXray 0\\n    -activeComponentsXray 0\\n    -displayTextures 0\\n    -smoothWireframe 0\\n    -lineWidth 1\\n    -textureAnisotropic 0\\n    -textureHilight 1\\n    -textureSampling 2\\n    -textureDisplay \\\"modulate\\\" \\n    -textureMaxSize 8192\\n    -fogging 0\\n    -fogSource \\\"fragment\\\" \\n    -fogMode \\\"linear\\\" \\n    -fogStart 0\\n    -fogEnd 100\\n    -fogDensity 0.1\\n    -fogColor 0.5 0.5 0.5 1 \\n    -maxConstantTransparency 1\\n    -rendererName \\\"vp2Renderer\\\" \\n    -objectFilterShowInHUD 1\\n    -isFiltered 0\\n    -colorResolution 256 256 \\n    -bumpResolution 512 512 \\n    -textureCompression 0\\n    -transparencyAlgorithm \\\"frontAndBackCull\\\" \\n    -transpInShadows 0\\n    -cullingOverride \\\"none\\\" \\n    -lowQualityLighting 0\\n    -maximumNumHardwareLights 1\\n    -occlusionCulling 0\\n    -shadingModel 0\\n    -useBaseRenderer 0\\n    -useReducedRenderer 0\\n    -smallObjectCulling 0\\n    -smallObjectThreshold -1 \\n    -interactiveDisableShadows 0\\n    -interactiveBackFaceCull 0\\n    -sortTransparent 1\\n    -nurbsCurves 1\\n    -nurbsSurfaces 1\\n    -polymeshes 1\\n    -subdivSurfaces 1\\n    -planes 1\\n    -lights 1\\n    -cameras 1\\n    -controlVertices 1\\n    -hulls 1\\n    -grid 1\\n    -imagePlane 1\\n    -joints 1\\n    -ikHandles 1\\n    -deformers 1\\n    -dynamics 1\\n    -particleInstancers 1\\n    -fluids 1\\n    -hairSystems 1\\n    -follicles 1\\n    -nCloths 1\\n    -nParticles 1\\n    -nRigids 1\\n    -dynamicConstraints 1\\n    -locators 1\\n    -manipulators 1\\n    -pluginShapes 1\\n    -dimensions 1\\n    -handles 1\\n    -pivots 1\\n    -textures 1\\n    -strokes 1\\n    -motionTrails 1\\n    -clipGhosts 1\\n    -greasePencils 1\\n    -shadows 0\\n    $editorName;\\nmodelEditor -e -viewSelected 0 $editorName;\\nmodelEditor -e \\n    -pluginObjects \\\"gpuCacheDisplayFilter\\\" 1 \\n    $editorName\"\n"
		+ "\t\t\t\t\t\"modelPanel -edit -l (localizedPanelLabel(\\\"Persp View\\\")) -mbv $menusOkayInPanels  $panelName;\\n$editorName = $panelName;\\nmodelEditor -e \\n    -cam `findStartUpCamera persp` \\n    -useInteractiveMode 0\\n    -displayLights \\\"default\\\" \\n    -displayAppearance \\\"smoothShaded\\\" \\n    -activeOnly 0\\n    -ignorePanZoom 0\\n    -wireframeOnShaded 0\\n    -headsUpDisplay 1\\n    -selectionHiliteDisplay 1\\n    -useDefaultMaterial 0\\n    -bufferMode \\\"double\\\" \\n    -twoSidedLighting 0\\n    -backfaceCulling 0\\n    -xray 0\\n    -jointXray 0\\n    -activeComponentsXray 0\\n    -displayTextures 0\\n    -smoothWireframe 0\\n    -lineWidth 1\\n    -textureAnisotropic 0\\n    -textureHilight 1\\n    -textureSampling 2\\n    -textureDisplay \\\"modulate\\\" \\n    -textureMaxSize 8192\\n    -fogging 0\\n    -fogSource \\\"fragment\\\" \\n    -fogMode \\\"linear\\\" \\n    -fogStart 0\\n    -fogEnd 100\\n    -fogDensity 0.1\\n    -fogColor 0.5 0.5 0.5 1 \\n    -maxConstantTransparency 1\\n    -rendererName \\\"vp2Renderer\\\" \\n    -objectFilterShowInHUD 1\\n    -isFiltered 0\\n    -colorResolution 256 256 \\n    -bumpResolution 512 512 \\n    -textureCompression 0\\n    -transparencyAlgorithm \\\"frontAndBackCull\\\" \\n    -transpInShadows 0\\n    -cullingOverride \\\"none\\\" \\n    -lowQualityLighting 0\\n    -maximumNumHardwareLights 1\\n    -occlusionCulling 0\\n    -shadingModel 0\\n    -useBaseRenderer 0\\n    -useReducedRenderer 0\\n    -smallObjectCulling 0\\n    -smallObjectThreshold -1 \\n    -interactiveDisableShadows 0\\n    -interactiveBackFaceCull 0\\n    -sortTransparent 1\\n    -nurbsCurves 1\\n    -nurbsSurfaces 1\\n    -polymeshes 1\\n    -subdivSurfaces 1\\n    -planes 1\\n    -lights 1\\n    -cameras 1\\n    -controlVertices 1\\n    -hulls 1\\n    -grid 1\\n    -imagePlane 1\\n    -joints 1\\n    -ikHandles 1\\n    -deformers 1\\n    -dynamics 1\\n    -particleInstancers 1\\n    -fluids 1\\n    -hairSystems 1\\n    -follicles 1\\n    -nCloths 1\\n    -nParticles 1\\n    -nRigids 1\\n    -dynamicConstraints 1\\n    -locators 1\\n    -manipulators 1\\n    -pluginShapes 1\\n    -dimensions 1\\n    -handles 1\\n    -pivots 1\\n    -textures 1\\n    -strokes 1\\n    -motionTrails 1\\n    -clipGhosts 1\\n    -greasePencils 1\\n    -shadows 0\\n    $editorName;\\nmodelEditor -e -viewSelected 0 $editorName;\\nmodelEditor -e \\n    -pluginObjects \\\"gpuCacheDisplayFilter\\\" 1 \\n    $editorName\"\n"
		+ "\t\t\t\t$configName;\n\n            setNamedPanelLayout (localizedPanelLabel(\"Current Layout\"));\n        }\n\n        panelHistory -e -clear mainPanelHistory;\n        setFocus `paneLayout -q -p1 $gMainPane`;\n        sceneUIReplacement -deleteRemaining;\n        sceneUIReplacement -clear;\n\t}\n\n\ngrid -spacing 5 -size 12 -divisions 5 -displayAxes yes -displayGridLines yes -displayDivisionLines yes -displayPerspectiveLabels no -displayOrthographicLabels no -displayAxesBold yes -perspectiveLabelPosition axis -orthographicLabelPosition edge;\nviewManip -drawCompass 0 -compassAngle 0 -frontParameters \"\" -homeParameters \"\" -selectionLockParameters \"\";\n}\n");
	setAttr ".st" 3;
createNode script -n "sceneConfigurationScriptNode";
	setAttr ".b" -type "string" "playbackOptions -min 1 -max 120 -ast 1 -aet 200 ";
	setAttr ".st" 6;
select -ne :time1;
	setAttr ".o" 1;
	setAttr ".unw" 1;
select -ne :renderPartition;
	setAttr -s 19 ".st";
select -ne :renderGlobalsList1;
select -ne :defaultShaderList1;
	setAttr -s 19 ".s";
select -ne :postProcessList1;
	setAttr -s 2 ".p";
select -ne :defaultRenderUtilityList1;
	setAttr -s 10 ".u";
select -ne :defaultRenderingList1;
select -ne :defaultTextureList1;
	setAttr -s 10 ".tx";
select -ne :initialShadingGroup;
	setAttr -s 42 ".dsm";
	setAttr ".ro" yes;
select -ne :initialParticleSE;
	setAttr ".ro" yes;
select -ne :defaultResolution;
	setAttr ".pa" 1;
select -ne :hardwareRenderGlobals;
	setAttr ".ctrs" 256;
	setAttr ".btrs" 512;
select -ne :hardwareRenderingGlobals;
	setAttr ".otfna" -type "stringArray" 22 "NURBS Curves" "NURBS Surfaces" "Polygons" "Subdiv Surface" "Particles" "Particle Instance" "Fluids" "Strokes" "Image Planes" "UI" "Lights" "Cameras" "Locators" "Joints" "IK Handles" "Deformers" "Motion Trails" "Components" "Hair Systems" "Follicles" "Misc. UI" "Ornaments"  ;
	setAttr ".otfva" -type "Int32Array" 22 0 1 1 1 1 1
		 1 1 1 0 0 0 0 0 0 0 0 0
		 0 0 0 0 ;
select -ne :defaultHardwareRenderGlobals;
	setAttr ".res" -type "string" "ntsc_4d 646 485 1.333";
select -ne :ikSystem;
	setAttr -s 4 ".sol";
connectAttr "polyCube1.out" "zenRefSizeShape.i";
connectAttr "polyCube2.out" "pCubeShape1.i";
connectAttr "polySphere1.out" "pSphereShape1.i";
connectAttr "polyCube3.out" "pCubeShape4.i";
connectAttr "polyCube4.out" "pCubeShape7.i";
connectAttr "polyCube5.out" "pCubeShape8.i";
connectAttr "polyCube6.out" "pCubeShape14.i";
relationship "link" ":lightLinker1" ":initialShadingGroup.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" ":initialParticleSE.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "Zenobia1:Zenobia1:bodySG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "Zenobia1:HairSG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "textureTest_001:polySurface1SG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "textureTest_001:polySurface2SG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "textureTest_001:polySurface3SG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "textureTest_001:polySurface4SG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "textureTest_001:polySurface95SG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "textureTest_001:polySurface1SG1.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "textureTest_001:polySurface2SG1.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "textureTest_001:polySurface3SG1.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "textureTest_001:polySurface4SG1.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "textureTest_001:polySurface95SG1.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "bodySG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "bodySG1.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "bodySG2.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "bodySG3.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "bodySG4.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" ":initialShadingGroup.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" ":initialParticleSE.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "Zenobia1:Zenobia1:bodySG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "Zenobia1:HairSG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "textureTest_001:polySurface1SG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "textureTest_001:polySurface2SG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "textureTest_001:polySurface3SG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "textureTest_001:polySurface4SG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "textureTest_001:polySurface95SG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "textureTest_001:polySurface1SG1.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "textureTest_001:polySurface2SG1.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "textureTest_001:polySurface3SG1.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "textureTest_001:polySurface4SG1.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "textureTest_001:polySurface95SG1.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "bodySG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "bodySG1.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "bodySG2.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "bodySG3.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "bodySG4.message" ":defaultLightSet.message";
connectAttr "layerManager.dli[0]" "defaultLayer.id";
connectAttr "renderLayerManager.rlmi[0]" "defaultRenderLayer.rlid";
connectAttr "Zenobia1:Zenobia1:lambert1.oc" "Zenobia1:Zenobia1:bodySG.ss";
connectAttr "Zenobia1:Zenobia1:bodySG.msg" "materialInfo1.sg";
connectAttr "Zenobia1:Zenobia1:lambert1.msg" "materialInfo1.m";
connectAttr "lambert2.oc" "Zenobia1:HairSG.ss";
connectAttr "Zenobia1:HairSG.msg" "materialInfo2.sg";
connectAttr "lambert2.msg" "materialInfo2.m";
connectAttr "textureTest_001:file1.oc" "textureTest_001:lambert2.c";
connectAttr "textureTest_001:lambert2.oc" "textureTest_001:polySurface1SG.ss";
connectAttr "textureTest_001:polySurface1SG.msg" "materialInfo3.sg";
connectAttr "textureTest_001:lambert2.msg" "materialInfo3.m";
connectAttr "textureTest_001:file1.msg" "materialInfo3.t" -na;
connectAttr "place2dTexture1.o" "textureTest_001:file1.uv";
connectAttr "place2dTexture1.ofu" "textureTest_001:file1.ofu";
connectAttr "place2dTexture1.ofv" "textureTest_001:file1.ofv";
connectAttr "place2dTexture1.rf" "textureTest_001:file1.rf";
connectAttr "place2dTexture1.reu" "textureTest_001:file1.reu";
connectAttr "place2dTexture1.rev" "textureTest_001:file1.rev";
connectAttr "place2dTexture1.vt1" "textureTest_001:file1.vt1";
connectAttr "place2dTexture1.vt2" "textureTest_001:file1.vt2";
connectAttr "place2dTexture1.vt3" "textureTest_001:file1.vt3";
connectAttr "place2dTexture1.vc1" "textureTest_001:file1.vc1";
connectAttr "place2dTexture1.ofs" "textureTest_001:file1.fs";
connectAttr "textureTest_001:file5.oc" "textureTest_001:lambert6.c";
connectAttr "textureTest_001:lambert6.oc" "textureTest_001:polySurface2SG.ss";
connectAttr "textureTest_001:polySurface2SG.msg" "materialInfo4.sg";
connectAttr "textureTest_001:lambert6.msg" "materialInfo4.m";
connectAttr "textureTest_001:file5.msg" "materialInfo4.t" -na;
connectAttr "place2dTexture2.o" "textureTest_001:file5.uv";
connectAttr "place2dTexture2.ofu" "textureTest_001:file5.ofu";
connectAttr "place2dTexture2.ofv" "textureTest_001:file5.ofv";
connectAttr "place2dTexture2.rf" "textureTest_001:file5.rf";
connectAttr "place2dTexture2.reu" "textureTest_001:file5.reu";
connectAttr "place2dTexture2.rev" "textureTest_001:file5.rev";
connectAttr "place2dTexture2.vt1" "textureTest_001:file5.vt1";
connectAttr "place2dTexture2.vt2" "textureTest_001:file5.vt2";
connectAttr "place2dTexture2.vt3" "textureTest_001:file5.vt3";
connectAttr "place2dTexture2.vc1" "textureTest_001:file5.vc1";
connectAttr "place2dTexture2.ofs" "textureTest_001:file5.fs";
connectAttr "textureTest_001:file3.oc" "textureTest_001:lambert4.c";
connectAttr "textureTest_001:lambert4.oc" "textureTest_001:polySurface3SG.ss";
connectAttr "textureTest_001:polySurface3SG.msg" "materialInfo5.sg";
connectAttr "textureTest_001:lambert4.msg" "materialInfo5.m";
connectAttr "textureTest_001:file3.msg" "materialInfo5.t" -na;
connectAttr "place2dTexture3.o" "textureTest_001:file3.uv";
connectAttr "place2dTexture3.ofu" "textureTest_001:file3.ofu";
connectAttr "place2dTexture3.ofv" "textureTest_001:file3.ofv";
connectAttr "place2dTexture3.rf" "textureTest_001:file3.rf";
connectAttr "place2dTexture3.reu" "textureTest_001:file3.reu";
connectAttr "place2dTexture3.rev" "textureTest_001:file3.rev";
connectAttr "place2dTexture3.vt1" "textureTest_001:file3.vt1";
connectAttr "place2dTexture3.vt2" "textureTest_001:file3.vt2";
connectAttr "place2dTexture3.vt3" "textureTest_001:file3.vt3";
connectAttr "place2dTexture3.vc1" "textureTest_001:file3.vc1";
connectAttr "place2dTexture3.ofs" "textureTest_001:file3.fs";
connectAttr "textureTest_001:file2.oc" "textureTest_001:lambert3.c";
connectAttr "textureTest_001:file2.ot" "textureTest_001:lambert3.it";
connectAttr "textureTest_001:lambert3.oc" "textureTest_001:polySurface4SG.ss";
connectAttr "textureTest_001:polySurface4SG.msg" "materialInfo6.sg";
connectAttr "textureTest_001:lambert3.msg" "materialInfo6.m";
connectAttr "textureTest_001:file2.msg" "materialInfo6.t" -na;
connectAttr "place2dTexture4.o" "textureTest_001:file2.uv";
connectAttr "place2dTexture4.ofu" "textureTest_001:file2.ofu";
connectAttr "place2dTexture4.ofv" "textureTest_001:file2.ofv";
connectAttr "place2dTexture4.rf" "textureTest_001:file2.rf";
connectAttr "place2dTexture4.reu" "textureTest_001:file2.reu";
connectAttr "place2dTexture4.rev" "textureTest_001:file2.rev";
connectAttr "place2dTexture4.vt1" "textureTest_001:file2.vt1";
connectAttr "place2dTexture4.vt2" "textureTest_001:file2.vt2";
connectAttr "place2dTexture4.vt3" "textureTest_001:file2.vt3";
connectAttr "place2dTexture4.vc1" "textureTest_001:file2.vc1";
connectAttr "place2dTexture4.ofs" "textureTest_001:file2.fs";
connectAttr "textureTest_001:file4.oc" "textureTest_001:lambert5.c";
connectAttr "textureTest_001:file4.ot" "textureTest_001:lambert5.it";
connectAttr "textureTest_001:lambert5.oc" "textureTest_001:polySurface95SG.ss";
connectAttr "textureTest_001:polySurface95SG.msg" "materialInfo7.sg";
connectAttr "textureTest_001:lambert5.msg" "materialInfo7.m";
connectAttr "textureTest_001:file4.msg" "materialInfo7.t" -na;
connectAttr "place2dTexture5.o" "textureTest_001:file4.uv";
connectAttr "place2dTexture5.ofu" "textureTest_001:file4.ofu";
connectAttr "place2dTexture5.ofv" "textureTest_001:file4.ofv";
connectAttr "place2dTexture5.rf" "textureTest_001:file4.rf";
connectAttr "place2dTexture5.reu" "textureTest_001:file4.reu";
connectAttr "place2dTexture5.rev" "textureTest_001:file4.rev";
connectAttr "place2dTexture5.vt1" "textureTest_001:file4.vt1";
connectAttr "place2dTexture5.vt2" "textureTest_001:file4.vt2";
connectAttr "place2dTexture5.vt3" "textureTest_001:file4.vt3";
connectAttr "place2dTexture5.vc1" "textureTest_001:file4.vc1";
connectAttr "place2dTexture5.ofs" "textureTest_001:file4.fs";
connectAttr "textureTest_001:file6.oc" "textureTest_001:lambert7.c";
connectAttr "textureTest_001:lambert7.oc" "textureTest_001:polySurface1SG1.ss";
connectAttr "textureTest_001:polySurface1SG1.msg" "materialInfo8.sg";
connectAttr "textureTest_001:lambert7.msg" "materialInfo8.m";
connectAttr "textureTest_001:file6.msg" "materialInfo8.t" -na;
connectAttr "place2dTexture6.o" "textureTest_001:file6.uv";
connectAttr "place2dTexture6.ofu" "textureTest_001:file6.ofu";
connectAttr "place2dTexture6.ofv" "textureTest_001:file6.ofv";
connectAttr "place2dTexture6.rf" "textureTest_001:file6.rf";
connectAttr "place2dTexture6.reu" "textureTest_001:file6.reu";
connectAttr "place2dTexture6.rev" "textureTest_001:file6.rev";
connectAttr "place2dTexture6.vt1" "textureTest_001:file6.vt1";
connectAttr "place2dTexture6.vt2" "textureTest_001:file6.vt2";
connectAttr "place2dTexture6.vt3" "textureTest_001:file6.vt3";
connectAttr "place2dTexture6.vc1" "textureTest_001:file6.vc1";
connectAttr "place2dTexture6.ofs" "textureTest_001:file6.fs";
connectAttr "textureTest_001:file7.oc" "textureTest_001:lambert8.c";
connectAttr "textureTest_001:lambert8.oc" "textureTest_001:polySurface2SG1.ss";
connectAttr "textureTest_001:polySurface2SG1.msg" "materialInfo9.sg";
connectAttr "textureTest_001:lambert8.msg" "materialInfo9.m";
connectAttr "textureTest_001:file7.msg" "materialInfo9.t" -na;
connectAttr "place2dTexture7.o" "textureTest_001:file7.uv";
connectAttr "place2dTexture7.ofu" "textureTest_001:file7.ofu";
connectAttr "place2dTexture7.ofv" "textureTest_001:file7.ofv";
connectAttr "place2dTexture7.rf" "textureTest_001:file7.rf";
connectAttr "place2dTexture7.reu" "textureTest_001:file7.reu";
connectAttr "place2dTexture7.rev" "textureTest_001:file7.rev";
connectAttr "place2dTexture7.vt1" "textureTest_001:file7.vt1";
connectAttr "place2dTexture7.vt2" "textureTest_001:file7.vt2";
connectAttr "place2dTexture7.vt3" "textureTest_001:file7.vt3";
connectAttr "place2dTexture7.vc1" "textureTest_001:file7.vc1";
connectAttr "place2dTexture7.ofs" "textureTest_001:file7.fs";
connectAttr "textureTest_001:file8.oc" "textureTest_001:lambert9.c";
connectAttr "textureTest_001:lambert9.oc" "textureTest_001:polySurface3SG1.ss";
connectAttr "textureTest_001:polySurface3SG1.msg" "materialInfo10.sg";
connectAttr "textureTest_001:lambert9.msg" "materialInfo10.m";
connectAttr "textureTest_001:file8.msg" "materialInfo10.t" -na;
connectAttr "place2dTexture8.o" "textureTest_001:file8.uv";
connectAttr "place2dTexture8.ofu" "textureTest_001:file8.ofu";
connectAttr "place2dTexture8.ofv" "textureTest_001:file8.ofv";
connectAttr "place2dTexture8.rf" "textureTest_001:file8.rf";
connectAttr "place2dTexture8.reu" "textureTest_001:file8.reu";
connectAttr "place2dTexture8.rev" "textureTest_001:file8.rev";
connectAttr "place2dTexture8.vt1" "textureTest_001:file8.vt1";
connectAttr "place2dTexture8.vt2" "textureTest_001:file8.vt2";
connectAttr "place2dTexture8.vt3" "textureTest_001:file8.vt3";
connectAttr "place2dTexture8.vc1" "textureTest_001:file8.vc1";
connectAttr "place2dTexture8.ofs" "textureTest_001:file8.fs";
connectAttr "textureTest_001:file9.oc" "textureTest_001:lambert10.c";
connectAttr "textureTest_001:file9.ot" "textureTest_001:lambert10.it";
connectAttr "textureTest_001:lambert10.oc" "textureTest_001:polySurface4SG1.ss";
connectAttr "textureTest_001:polySurface4SG1.msg" "materialInfo11.sg";
connectAttr "textureTest_001:lambert10.msg" "materialInfo11.m";
connectAttr "textureTest_001:file9.msg" "materialInfo11.t" -na;
connectAttr "place2dTexture9.o" "textureTest_001:file9.uv";
connectAttr "place2dTexture9.ofu" "textureTest_001:file9.ofu";
connectAttr "place2dTexture9.ofv" "textureTest_001:file9.ofv";
connectAttr "place2dTexture9.rf" "textureTest_001:file9.rf";
connectAttr "place2dTexture9.reu" "textureTest_001:file9.reu";
connectAttr "place2dTexture9.rev" "textureTest_001:file9.rev";
connectAttr "place2dTexture9.vt1" "textureTest_001:file9.vt1";
connectAttr "place2dTexture9.vt2" "textureTest_001:file9.vt2";
connectAttr "place2dTexture9.vt3" "textureTest_001:file9.vt3";
connectAttr "place2dTexture9.vc1" "textureTest_001:file9.vc1";
connectAttr "place2dTexture9.ofs" "textureTest_001:file9.fs";
connectAttr "textureTest_001:file10.oc" "textureTest_001:lambert11.c";
connectAttr "textureTest_001:file10.ot" "textureTest_001:lambert11.it";
connectAttr "textureTest_001:lambert11.oc" "textureTest_001:polySurface95SG1.ss"
		;
connectAttr "textureTest_001:polySurface95SG1.msg" "materialInfo12.sg";
connectAttr "textureTest_001:lambert11.msg" "materialInfo12.m";
connectAttr "textureTest_001:file10.msg" "materialInfo12.t" -na;
connectAttr "place2dTexture10.o" "textureTest_001:file10.uv";
connectAttr "place2dTexture10.ofu" "textureTest_001:file10.ofu";
connectAttr "place2dTexture10.ofv" "textureTest_001:file10.ofv";
connectAttr "place2dTexture10.rf" "textureTest_001:file10.rf";
connectAttr "place2dTexture10.reu" "textureTest_001:file10.reu";
connectAttr "place2dTexture10.rev" "textureTest_001:file10.rev";
connectAttr "place2dTexture10.vt1" "textureTest_001:file10.vt1";
connectAttr "place2dTexture10.vt2" "textureTest_001:file10.vt2";
connectAttr "place2dTexture10.vt3" "textureTest_001:file10.vt3";
connectAttr "place2dTexture10.vc1" "textureTest_001:file10.vc1";
connectAttr "place2dTexture10.ofs" "textureTest_001:file10.fs";
connectAttr "skirtTexture.oc" "bodySG.ss";
connectAttr "bodySG.msg" "materialInfo13.sg";
connectAttr "skirtTexture.msg" "materialInfo13.m";
connectAttr "lambert3.oc" "bodySG1.ss";
connectAttr "bodySG1.msg" "materialInfo14.sg";
connectAttr "lambert3.msg" "materialInfo14.m";
connectAttr "eyeTexture.oc" "bodySG2.ss";
connectAttr "bodySG2.msg" "materialInfo15.sg";
connectAttr "eyeTexture.msg" "materialInfo15.m";
connectAttr "hairTexture.oc" "bodySG3.ss";
connectAttr "bodySG3.msg" "materialInfo16.sg";
connectAttr "hairTexture.msg" "materialInfo16.m";
connectAttr "bodyTexture.oc" "bodySG4.ss";
connectAttr "bodySG4.msg" "materialInfo17.sg";
connectAttr "bodyTexture.msg" "materialInfo17.m";
connectAttr "HIKproperties1.msg" "Character1.propertyState";
connectAttr "layerManager.dli[1]" "layer2.id";
connectAttr "Zenobia1:Zenobia1:bodySG.pa" ":renderPartition.st" -na;
connectAttr "Zenobia1:HairSG.pa" ":renderPartition.st" -na;
connectAttr "textureTest_001:polySurface1SG.pa" ":renderPartition.st" -na;
connectAttr "textureTest_001:polySurface2SG.pa" ":renderPartition.st" -na;
connectAttr "textureTest_001:polySurface3SG.pa" ":renderPartition.st" -na;
connectAttr "textureTest_001:polySurface4SG.pa" ":renderPartition.st" -na;
connectAttr "textureTest_001:polySurface95SG.pa" ":renderPartition.st" -na;
connectAttr "textureTest_001:polySurface1SG1.pa" ":renderPartition.st" -na;
connectAttr "textureTest_001:polySurface2SG1.pa" ":renderPartition.st" -na;
connectAttr "textureTest_001:polySurface3SG1.pa" ":renderPartition.st" -na;
connectAttr "textureTest_001:polySurface4SG1.pa" ":renderPartition.st" -na;
connectAttr "textureTest_001:polySurface95SG1.pa" ":renderPartition.st" -na;
connectAttr "bodySG.pa" ":renderPartition.st" -na;
connectAttr "bodySG1.pa" ":renderPartition.st" -na;
connectAttr "bodySG2.pa" ":renderPartition.st" -na;
connectAttr "bodySG3.pa" ":renderPartition.st" -na;
connectAttr "bodySG4.pa" ":renderPartition.st" -na;
connectAttr "Zenobia1:Zenobia1:lambert1.msg" ":defaultShaderList1.s" -na;
connectAttr "lambert2.msg" ":defaultShaderList1.s" -na;
connectAttr "textureTest_001:lambert2.msg" ":defaultShaderList1.s" -na;
connectAttr "textureTest_001:lambert6.msg" ":defaultShaderList1.s" -na;
connectAttr "textureTest_001:lambert4.msg" ":defaultShaderList1.s" -na;
connectAttr "textureTest_001:lambert3.msg" ":defaultShaderList1.s" -na;
connectAttr "textureTest_001:lambert5.msg" ":defaultShaderList1.s" -na;
connectAttr "textureTest_001:lambert7.msg" ":defaultShaderList1.s" -na;
connectAttr "textureTest_001:lambert8.msg" ":defaultShaderList1.s" -na;
connectAttr "textureTest_001:lambert9.msg" ":defaultShaderList1.s" -na;
connectAttr "textureTest_001:lambert10.msg" ":defaultShaderList1.s" -na;
connectAttr "textureTest_001:lambert11.msg" ":defaultShaderList1.s" -na;
connectAttr "skirtTexture.msg" ":defaultShaderList1.s" -na;
connectAttr "lambert3.msg" ":defaultShaderList1.s" -na;
connectAttr "eyeTexture.msg" ":defaultShaderList1.s" -na;
connectAttr "hairTexture.msg" ":defaultShaderList1.s" -na;
connectAttr "bodyTexture.msg" ":defaultShaderList1.s" -na;
connectAttr "place2dTexture1.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "place2dTexture2.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "place2dTexture3.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "place2dTexture4.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "place2dTexture5.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "place2dTexture6.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "place2dTexture7.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "place2dTexture8.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "place2dTexture9.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "place2dTexture10.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "defaultRenderLayer.msg" ":defaultRenderingList1.r" -na;
connectAttr "textureTest_001:file1.msg" ":defaultTextureList1.tx" -na;
connectAttr "textureTest_001:file5.msg" ":defaultTextureList1.tx" -na;
connectAttr "textureTest_001:file3.msg" ":defaultTextureList1.tx" -na;
connectAttr "textureTest_001:file2.msg" ":defaultTextureList1.tx" -na;
connectAttr "textureTest_001:file4.msg" ":defaultTextureList1.tx" -na;
connectAttr "textureTest_001:file6.msg" ":defaultTextureList1.tx" -na;
connectAttr "textureTest_001:file7.msg" ":defaultTextureList1.tx" -na;
connectAttr "textureTest_001:file8.msg" ":defaultTextureList1.tx" -na;
connectAttr "textureTest_001:file9.msg" ":defaultTextureList1.tx" -na;
connectAttr "textureTest_001:file10.msg" ":defaultTextureList1.tx" -na;
connectAttr "zenRefSizeShape.iog" ":initialShadingGroup.dsm" -na;
connectAttr "pCubeShape1.iog" ":initialShadingGroup.dsm" -na;
connectAttr "pCubeShape2.iog" ":initialShadingGroup.dsm" -na;
connectAttr "pCubeShape3.iog" ":initialShadingGroup.dsm" -na;
connectAttr "pSphereShape1.iog" ":initialShadingGroup.dsm" -na;
connectAttr "pSphereShape2.iog" ":initialShadingGroup.dsm" -na;
connectAttr "pSphereShape3.iog" ":initialShadingGroup.dsm" -na;
connectAttr "pSphereShape4.iog" ":initialShadingGroup.dsm" -na;
connectAttr "pCubeShape4.iog" ":initialShadingGroup.dsm" -na;
connectAttr "pCubeShape5.iog" ":initialShadingGroup.dsm" -na;
connectAttr "pCubeShape6.iog" ":initialShadingGroup.dsm" -na;
connectAttr "pCubeShape7.iog" ":initialShadingGroup.dsm" -na;
connectAttr "pSphereShape5.iog" ":initialShadingGroup.dsm" -na;
connectAttr "pSphereShape6.iog" ":initialShadingGroup.dsm" -na;
connectAttr "pCubeShape8.iog" ":initialShadingGroup.dsm" -na;
connectAttr "pCubeShape9.iog" ":initialShadingGroup.dsm" -na;
connectAttr "pCubeShape10.iog" ":initialShadingGroup.dsm" -na;
connectAttr "pCubeShape11.iog" ":initialShadingGroup.dsm" -na;
connectAttr "pCubeShape12.iog" ":initialShadingGroup.dsm" -na;
connectAttr "pCubeShape13.iog" ":initialShadingGroup.dsm" -na;
connectAttr "pCubeShape14.iog" ":initialShadingGroup.dsm" -na;
connectAttr "pCubeShape15.iog" ":initialShadingGroup.dsm" -na;
connectAttr "pCubeShape16.iog" ":initialShadingGroup.dsm" -na;
connectAttr "pCubeShape17.iog" ":initialShadingGroup.dsm" -na;
connectAttr "pCubeShape18.iog" ":initialShadingGroup.dsm" -na;
connectAttr "pCubeShape19.iog" ":initialShadingGroup.dsm" -na;
connectAttr "pCubeShape20.iog" ":initialShadingGroup.dsm" -na;
connectAttr "pCubeShape21.iog" ":initialShadingGroup.dsm" -na;
connectAttr "pCubeShape22.iog" ":initialShadingGroup.dsm" -na;
connectAttr "pSphereShape7.iog" ":initialShadingGroup.dsm" -na;
connectAttr "pCubeShape23.iog" ":initialShadingGroup.dsm" -na;
connectAttr "pCubeShape24.iog" ":initialShadingGroup.dsm" -na;
connectAttr "pCubeShape25.iog" ":initialShadingGroup.dsm" -na;
connectAttr "pCubeShape26.iog" ":initialShadingGroup.dsm" -na;
connectAttr "pCubeShape27.iog" ":initialShadingGroup.dsm" -na;
connectAttr "pSphereShape8.iog" ":initialShadingGroup.dsm" -na;
connectAttr "pCubeShape28.iog" ":initialShadingGroup.dsm" -na;
connectAttr "pCubeShape29.iog" ":initialShadingGroup.dsm" -na;
connectAttr "pCubeShape30.iog" ":initialShadingGroup.dsm" -na;
connectAttr "pCubeShape31.iog" ":initialShadingGroup.dsm" -na;
connectAttr "pCubeShape32.iog" ":initialShadingGroup.dsm" -na;
connectAttr "pCubeShape33.iog" ":initialShadingGroup.dsm" -na;
dataStructure -fmt "raw" -as "name=externalContentTable:string=node:string=key:string=upath:uint32=upathcrc:string=rpath:string=roles";
applyMetadata -fmt "raw" -v "channel\nname externalContentTable\nstream\nname v1.0\nindexType numeric\nstructure externalContentTable\n0\n\"textureTest_001:file1\" \"fileTextureName\" \"C:\\\\Users\\\\ori\\\\Desktop\\\\Terrascape\\\\Terrascape\\\\Terrascape\\\\Unity_Files\\\\Assets\\\\Meshes\\\\Zenobia\\\\player_char_zenobia_01(1).fbm\\\\zenHeadTorso.jpg\" 3180548320 \"C:/Users/ori/Desktop/Terrascape/Terrascape/Terrascape/Unity_Files/Assets/Meshes/Zenobia/player_char_zenobia_01(1).fbm/zenHeadTorso.jpg\" \"sourceImages\"\n1\n\"textureTest_001:file5\" \"fileTextureName\" \"C:\\\\Users\\\\ori\\\\Desktop\\\\Terrascape\\\\Terrascape\\\\Terrascape\\\\Unity_Files\\\\Assets\\\\Meshes\\\\Zenobia\\\\player_char_zenobia_01(1).fbm\\\\zenLegs.jpg\" 1161240074 \"C:/Users/ori/Desktop/Terrascape/Terrascape/Terrascape/Unity_Files/Assets/Meshes/Zenobia/player_char_zenobia_01(1).fbm/zenLegs.jpg\" \"sourceImages\"\n2\n\"textureTest_001:file3\" \"fileTextureName\" \"C:\\\\Users\\\\ori\\\\Desktop\\\\Terrascape\\\\Terrascape\\\\Terrascape\\\\Unity_Files\\\\Assets\\\\Meshes\\\\Zenobia\\\\player_char_zenobia_01(1).fbm\\\\zenSkirt.jpg\" 1848854572 \"C:/Users/ori/Desktop/Terrascape/Terrascape/Terrascape/Unity_Files/Assets/Meshes/Zenobia/player_char_zenobia_01(1).fbm/zenSkirt.jpg\" \"sourceImages\"\n3\n\"textureTest_001:file2\" \"fileTextureName\" \"C:\\\\Users\\\\ori\\\\Desktop\\\\Terrascape\\\\Terrascape\\\\Terrascape\\\\Unity_Files\\\\Assets\\\\Meshes\\\\Zenobia\\\\player_char_zenobia_01(1).fbm\\\\zenEyes.jpg\" 3083752080 \"C:/Users/ori/Desktop/Terrascape/Terrascape/Terrascape/Unity_Files/Assets/Meshes/Zenobia/player_char_zenobia_01(1).fbm/zenEyes.jpg\" \"sourceImages\"\n4\n\"textureTest_001:file4\" \"fileTextureName\" \"C:\\\\Users\\\\ori\\\\Desktop\\\\Terrascape\\\\Terrascape\\\\Terrascape\\\\Unity_Files\\\\Assets\\\\Meshes\\\\Zenobia\\\\player_char_zenobia_01(1).fbm\\\\zenHair.jpg\" 844659747 \"C:/Users/ori/Desktop/Terrascape/Terrascape/Terrascape/Unity_Files/Assets/Meshes/Zenobia/player_char_zenobia_01(1).fbm/zenHair.jpg\" \"sourceImages\"\n5\n\"textureTest_001:file6\" \"fileTextureName\" \"C:\\\\Users\\\\ori\\\\Desktop\\\\Terrascape\\\\Terrascape\\\\Terrascape\\\\Unity_Files\\\\Assets\\\\Meshes\\\\Zenobia\\\\player_char_zenobia_01(1).fbm\\\\zenHeadTorso.jpg\" 3180548320 \"C:/Users/ori/Desktop/Terrascape/Terrascape/Terrascape/Unity_Files/Assets/Meshes/Zenobia/player_char_zenobia_01(1).fbm/zenHeadTorso.jpg\" \"sourceImages\"\n6\n\"textureTest_001:file7\" \"fileTextureName\" \"C:\\\\Users\\\\ori\\\\Desktop\\\\Terrascape\\\\Terrascape\\\\Terrascape\\\\Unity_Files\\\\Assets\\\\Meshes\\\\Zenobia\\\\player_char_zenobia_01(1).fbm\\\\zenLegs.jpg\" 1161240074 \"C:/Users/ori/Desktop/Terrascape/Terrascape/Terrascape/Unity_Files/Assets/Meshes/Zenobia/player_char_zenobia_01(1).fbm/zenLegs.jpg\" \"sourceImages\"\n7\n\"textureTest_001:file8\" \"fileTextureName\" \"C:\\\\Users\\\\ori\\\\Desktop\\\\Terrascape\\\\Terrascape\\\\Terrascape\\\\Unity_Files\\\\Assets\\\\Meshes\\\\Zenobia\\\\player_char_zenobia_01(1).fbm\\\\zenSkirt.jpg\" 1848854572 \"C:/Users/ori/Desktop/Terrascape/Terrascape/Terrascape/Unity_Files/Assets/Meshes/Zenobia/player_char_zenobia_01(1).fbm/zenSkirt.jpg\" \"sourceImages\"\n8\n\"textureTest_001:file9\" \"fileTextureName\" \"C:\\\\Users\\\\ori\\\\Desktop\\\\Terrascape\\\\Terrascape\\\\Terrascape\\\\Unity_Files\\\\Assets\\\\Meshes\\\\Zenobia\\\\player_char_zenobia_01(1).fbm\\\\zenEyes.jpg\" 3083752080 \"C:/Users/ori/Desktop/Terrascape/Terrascape/Terrascape/Unity_Files/Assets/Meshes/Zenobia/player_char_zenobia_01(1).fbm/zenEyes.jpg\" \"sourceImages\"\n9\n\"textureTest_001:file10\" \"fileTextureName\" \"C:\\\\Users\\\\ori\\\\Desktop\\\\Terrascape\\\\Terrascape\\\\Terrascape\\\\Unity_Files\\\\Assets\\\\Meshes\\\\Zenobia\\\\player_char_zenobia_01(1).fbm\\\\zenHair.jpg\" 844659747 \"C:/Users/ori/Desktop/Terrascape/Terrascape/Terrascape/Unity_Files/Assets/Meshes/Zenobia/player_char_zenobia_01(1).fbm/zenHair.jpg\" \"sourceImages\"\nendStream\nendChannel\nendAssociations\n" 
		-scn;
// End of L02Greybox.ma
