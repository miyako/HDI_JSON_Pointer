var $oMyConfig; $options; $oResult : Object
var $txtTmp : Text

// duplicate the oConfig object to keep the original version
$oMyConfig:=OB Copy:C1225(oConfig)

// resolve pointers
$options:=New object:C1471("merge"; OBJECT Get pointer:C1124(Object named:K67:5; "btnPatch")->=1)
$oResult:=JSON Resolve pointers:C1478($oMyConfig; $options)
If ($oResult.success=True:C214)
	
	//display result
	OBJECT Get pointer:C1124(Object named:K67:5; "oMyConfig")->:=JSON Stringify:C1217($oMyConfig; *)
	prettyHDI(4)
	
Else 
	
	// display error
	$txtTmp:=JSON Stringify:C1217($oResult.errors; *)
	OBJECT Get pointer:C1124(Object named:K67:5; "oMyConfig")->:=$txtTmp
	
End if 




