var $oMyConfig; $oResult : Object
var $txtTmp : Text

// duplicate the oConfig object to keep the original version
$oMyConfig:=OB Copy:C1225(oConfig)

// resolve pointers
$oResult:=JSON Resolve pointers:C1478($oMyConfig)

If ($oResult.success=True:C214)
	
	// display result
	$txtTmp:=JSON Stringify:C1217($oMyConfig; *)
	OBJECT Get pointer:C1124(Object named:K67:5; "oMyConfig")->:=$txtTmp
	prettyHDI(2)
	
Else 
	
	// display error
	$txtTmp:=JSON Stringify:C1217($oResult.errors; *)
	OBJECT Get pointer:C1124(Object named:K67:5; "oMyConfig")->:=$txtTmp
	
End if 
