C_TEXT:C284($folder)
C_TEXT:C284($txtTmp)
C_OBJECT:C1216($oMyConfig; $options; $oResult)


// compute the root folder where the JSON file is stored
If (OBJECT Get pointer:C1124(Object named:K67:5; "btnBlackFolder")->=1)
	$folder:=Get 4D folder:C485(Current resources folder:K5:16)+"IMAGES"+Folder separator:K24:12+"BLACK"
Else 
	$folder:=Get 4D folder:C485(Current resources folder:K5:16)+"IMAGES"+Folder separator:K24:12+"BLUE"
End if 


// duplicate the oConfig object to keep the original version
$oMyConfig:=OB Copy:C1225(oConfig)


// Resolve pointer with the root folder: $folder
$options:=New object:C1471("rootFolder"; $folder)
$oResult:=JSON Resolve pointers:C1478($oMyConfig; $options)
If ($oResult.success=True:C214)
	
	// display result in text variable
	OBJECT Get pointer:C1124(Object named:K67:5; "oMyConfig")->:=JSON Stringify:C1217($oMyConfig; *)
	prettyHDI(3)
	
Else 
	
	// display error
	$txtTmp:=JSON Stringify:C1217($oResult.errors; *)
	OBJECT Get pointer:C1124(Object named:K67:5; "oMyConfig")->:=$txtTmp
	
End if 