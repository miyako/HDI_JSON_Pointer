

Case of 
		
	: (Form event code:C388=On Load:K2:1)
		initHDI
		
		C_TEXT:C284($txtTmp)
		C_OBJECT:C1216(oConfig)
		
		OBJECT Get pointer:C1124(Object named:K67:5; "btnPatch")->:=0
		OBJECT Get pointer:C1124(Object named:K67:5; "varTxt")->:=TextTabControl{TabControl}
		
		OBJECT Get pointer:C1124(Object named:K67:5; "btnBlackFolder")->:=1
		OBJECT Get pointer:C1124(Object named:K67:5; "btnBlueFolder")->:=0
		
		
	: (Form event code:C388=On Page Change:K2:54)
		OBJECT Get pointer:C1124(Object named:K67:5; "varTxt")->:=TextTabControl{TabControl}
		
		Case of 
			: (FORM Get current page:C276=1)  //Info
				prettyHDI(1)
				
			: (FORM Get current page:C276=2)  // Example 1
				$txtTmp:=Document to text:C1236(Get 4D folder:C485(Current resources folder:K5:16)+"person.json")
				OBJECT Get pointer:C1124(Object named:K67:5; "oConfig")->:=$txtTmp
				OBJECT Get pointer:C1124(Object named:K67:5; "oMyConfig")->:=""
				
				oConfig:=JSON Parse:C1218($txtTmp)
				
				prettyHDI(2)
				
			: (FORM Get current page:C276=3)  // Example 2 -  Path parameter
				$txtTmp:=Document to text:C1236(Get 4D folder:C485(Current resources folder:K5:16)+"IMAGES"+Folder separator:K24:12+"picturePathConfig.json")
				OBJECT Get pointer:C1124(Object named:K67:5; "oConfig")->:=$txtTmp
				OBJECT Get pointer:C1124(Object named:K67:5; "oMyConfig")->:=""
				
				oConfig:=JSON Parse:C1218($txtTmp)
				
				prettyHDI(3)
				
			: (FORM Get current page:C276=4)  // Example 3 - Patch parameter
				$txtTmp:=Document to text:C1236(Get 4D folder:C485(Current resources folder:K5:16)+"mySettings.json")
				OBJECT Get pointer:C1124(Object named:K67:5; "oConfig")->:=$txtTmp
				OBJECT Get pointer:C1124(Object named:K67:5; "oMyConfig")->:=""
				
				oConfig:=JSON Parse:C1218($txtTmp)
				
				prettyHDI(4)
				
		End case 
		
End case 