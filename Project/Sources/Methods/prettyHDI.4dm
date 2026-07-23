//%attributes = {"invisible":true}
// Used only to display the result in HDI
//
// * Show or Hide some form object
// * Add some color to JSON text

#DECLARE($page : Integer; $folderColor : Text)

var $pos; $length : Integer
var $typeInterface; $txtTmp : Text



OBJECT SET VISIBLE:C603(*; "oConfig"; True:C214)
OBJECT SET VISIBLE:C603(*; "oMyConfig"; True:C214)
OBJECT SET VISIBLE:C603(*; "Splitter"; True:C214)

Case of 
		
	: ($page=1)
		OBJECT SET VISIBLE:C603(*; "JSONfileName"; False:C215)
		OBJECT SET VISIBLE:C603(*; "JSONRefFileName"; False:C215)
		OBJECT SET VISIBLE:C603(*; "oConfig"; False:C215)
		OBJECT SET VISIBLE:C603(*; "oRefConfig"; False:C215)
		OBJECT SET VISIBLE:C603(*; "oMyConfig"; False:C215)
		OBJECT SET VISIBLE:C603(*; "Splitter"; False:C215)
		OBJECT SET VISIBLE:C603(*; "SplitterH"; False:C215)
		OBJECT SET VISIBLE:C603(*; "ResultJSON"; False:C215)
		
		
	: ($page=2)
		OBJECT SET VISIBLE:C603(*; "JSONfileName"; True:C214)
		OBJECT SET VISIBLE:C603(*; "JSONRefFileName"; False:C215)
		OBJECT SET VISIBLE:C603(*; "oConfig"; True:C214)
		OBJECT SET VISIBLE:C603(*; "oRefConfig"; False:C215)
		OBJECT SET VISIBLE:C603(*; "oMyConfig"; True:C214)
		OBJECT SET VISIBLE:C603(*; "Splitter"; True:C214)
		OBJECT SET VISIBLE:C603(*; "SplitterH"; False:C215)
		OBJECT SET VISIBLE:C603(*; "ResultJSON"; True:C214)
		
		// display file name
		OBJECT Get pointer:C1124(Object named:K67:5; "JSONfileName")->:="Resources"+Folder separator:K24:12+"person.json:"
		
		
		// colorize oConfig JSON text
		$txtTmp:=ST Get plain text:C1092(OBJECT Get pointer:C1124(Object named:K67:5; "oConfig")->)
		$pos:=Position:C15("billingAddress"; $txtTmp; 0; $length)
		ST SET ATTRIBUTES:C1093(*; "oConfig"; $pos; $pos+$length; Attribute text color:K65:7; "red")
		
		$pos:=Position:C15("shippingAddress"; $txtTmp; 0; $length)
		ST SET ATTRIBUTES:C1093(*; "oConfig"; $pos; $pos+$length; Attribute text color:K65:7; "red")
		
		
		// colorize oMyConfig JSON text
		$txtTmp:=ST Get plain text:C1092(OBJECT Get pointer:C1124(Object named:K67:5; "oMyConfig")->)
		$pos:=Position:C15("billingAddress"; $txtTmp; 0; $length)
		ST SET ATTRIBUTES:C1093(*; "oMyConfig"; $pos; $pos+$length; Attribute text color:K65:7; "red")
		
		$pos:=Position:C15("shippingAddress"; $txtTmp; 0; $length)
		ST SET ATTRIBUTES:C1093(*; "oMyConfig"; $pos; $pos+$length; Attribute text color:K65:7; "red")
		
		
		OBJECT GET COORDINATES:C663(*; "oConfig"; $left; $top; $right; $bottom)
		OBJECT GET COORDINATES:C663(*; "oMyConfig"; $left2; $top2; $right2; $bottom2)
		OBJECT SET COORDINATES:C1248(*; "oConfig"; $left; $top; $right; $bottom2)
		
		
	: ($page=3)
		OBJECT SET VISIBLE:C603(*; "JSONfileName"; True:C214)
		OBJECT SET VISIBLE:C603(*; "JSONRefFileName"; True:C214)
		OBJECT SET VISIBLE:C603(*; "oConfig"; True:C214)
		OBJECT SET VISIBLE:C603(*; "oRefConfig"; True:C214)
		OBJECT SET VISIBLE:C603(*; "oMyConfig"; True:C214)
		OBJECT SET VISIBLE:C603(*; "Splitter"; True:C214)
		OBJECT SET VISIBLE:C603(*; "SplitterH"; True:C214)
		OBJECT SET VISIBLE:C603(*; "ResultJSON"; True:C214)
		
		If (OBJECT Get pointer:C1124(Object named:K67:5; "btnBlackFolder")->=1)
			$typeInterface:="BLACK"
		Else 
			$typeInterface:="BLUE"
		End if 
		
		// display file name
		OBJECT Get pointer:C1124(Object named:K67:5; "JSONfileName")->:="Resources"+Folder separator:K24:12+"IMAGES"+Folder separator:K24:12+"picturePathConfig.json:"
		OBJECT Get pointer:C1124(Object named:K67:5; "JSONRefFileName")->:="Resources"+Folder separator:K24:12+"IMAGES"+Folder separator:K24:12+$typeInterface+Folder separator:K24:12+"assets.json:"
		
		
		// colorize oConfig JSON text
		$txtTmp:=ST Get plain text:C1092(OBJECT Get pointer:C1124(Object named:K67:5; "oConfig")->)
		
		$pos:=Position:C15("button1"; $txtTmp; 0; $length)
		ST SET ATTRIBUTES:C1093(*; "oConfig"; $pos; $pos+$length; Attribute text color:K65:7; "red")
		
		$pos:=Position:C15("button2"; $txtTmp; 0; $length)
		ST SET ATTRIBUTES:C1093(*; "oConfig"; $pos; $pos+$length; Attribute text color:K65:7; "red")
		
		$pos:=Position:C15("button3"; $txtTmp; 0; $length)
		ST SET ATTRIBUTES:C1093(*; "oConfig"; $pos; $pos+$length; Attribute text color:K65:7; "red")
		
		$pos:=Position:C15("button4"; $txtTmp; 0; $length)
		ST SET ATTRIBUTES:C1093(*; "oConfig"; $pos; $pos+$length; Attribute text color:K65:7; "red")
		
		//load RefJSON
		$txtTmp:=Document to text:C1236(Get 4D folder:C485(Current resources folder:K5:16)+"IMAGES"+Folder separator:K24:12+$typeInterface+Folder separator:K24:12+"assets.json")
		OBJECT Get pointer:C1124(Object named:K67:5; "oRefConfig")->:=$txtTmp
		
		// colorize oRefConfig JSON text
		$txtTmp:=ST Get plain text:C1092(OBJECT Get pointer:C1124(Object named:K67:5; "oRefConfig")->)
		
		$pos:=Position:C15("button1"; $txtTmp; 0; $length)
		ST SET ATTRIBUTES:C1093(*; "oRefConfig"; $pos; $pos+$length; Attribute text color:K65:7; "red")
		
		$pos:=Position:C15("button2"; $txtTmp; 0; $length)
		ST SET ATTRIBUTES:C1093(*; "oRefConfig"; $pos; $pos+$length; Attribute text color:K65:7; "red")
		
		$pos:=Position:C15("button3"; $txtTmp; 0; $length)
		ST SET ATTRIBUTES:C1093(*; "oRefConfig"; $pos; $pos+$length; Attribute text color:K65:7; "red")
		
		$pos:=Position:C15("button4"; $txtTmp; 0; $length)
		ST SET ATTRIBUTES:C1093(*; "oRefConfig"; $pos; $pos+$length; Attribute text color:K65:7; "red")
		
		// colorize oMyConfig JSON text
		$txtTmp:=ST Get plain text:C1092(OBJECT Get pointer:C1124(Object named:K67:5; "oMyConfig")->)
		$pos:=Position:C15("button1"; $txtTmp; 0; $length)
		ST SET ATTRIBUTES:C1093(*; "oMyConfig"; $pos; $pos+$length; Attribute text color:K65:7; "red")
		
		$pos:=Position:C15("button2"; $txtTmp; 0; $length)
		ST SET ATTRIBUTES:C1093(*; "oMyConfig"; $pos; $pos+$length; Attribute text color:K65:7; "red")
		
		$pos:=Position:C15("button3"; $txtTmp; 0; $length)
		ST SET ATTRIBUTES:C1093(*; "oMyConfig"; $pos; $pos+$length; Attribute text color:K65:7; "red")
		
		$pos:=Position:C15("button4"; $txtTmp; 0; $length)
		ST SET ATTRIBUTES:C1093(*; "oMyConfig"; $pos; $pos+$length; Attribute text color:K65:7; "red")
		
		
		OBJECT GET COORDINATES:C663(*; "oConfig"; $left; $top; $right; $bottom)
		OBJECT GET COORDINATES:C663(*; "SplitterH"; $left2; $top2; $right2; $bottom2)
		OBJECT SET COORDINATES:C1248(*; "oConfig"; $left; $top; $right; $bottom2-20)
		
	: ($page=4)
		OBJECT SET VISIBLE:C603(*; "JSONfileName"; True:C214)
		OBJECT SET VISIBLE:C603(*; "JSONRefFileName"; True:C214)
		OBJECT SET VISIBLE:C603(*; "oConfig"; True:C214)
		OBJECT SET VISIBLE:C603(*; "oRefConfig"; True:C214)
		OBJECT SET VISIBLE:C603(*; "oMyConfig"; True:C214)
		OBJECT SET VISIBLE:C603(*; "Splitter"; True:C214)
		OBJECT SET VISIBLE:C603(*; "SplitterH"; True:C214)
		OBJECT SET VISIBLE:C603(*; "ResultJSON"; True:C214)
		
		// display file name
		OBJECT Get pointer:C1124(Object named:K67:5; "JSONfileName")->:="Resources"+Folder separator:K24:12+"mySettings.json:"
		OBJECT Get pointer:C1124(Object named:K67:5; "JSONRefFileName")->:="Resources"+Folder separator:K24:12+"defaultSettings.json:"
		
		//load RefJSON
		$txtTmp:=Document to text:C1236(Get 4D folder:C485(Current resources folder:K5:16)+"defaultSettings.json")
		OBJECT Get pointer:C1124(Object named:K67:5; "oRefConfig")->:=$txtTmp
		
		
		// colorize oConfig JSON text
		$txtTmp:=ST Get plain text:C1092(OBJECT Get pointer:C1124(Object named:K67:5; "oConfig")->)
		$pos:=Position:C15("delete"; $txtTmp; 0; $length)
		ST SET ATTRIBUTES:C1093(*; "oConfig"; $pos; $pos+$length; Attribute text color:K65:7; "red")
		
		// colorize oRefConfig JSON text
		$txtTmp:=ST Get plain text:C1092(OBJECT Get pointer:C1124(Object named:K67:5; "oRefConfig")->)
		$pos:=Position:C15("delete"; $txtTmp; 0; $length)
		ST SET ATTRIBUTES:C1093(*; "oRefConfig"; $pos; $pos+$length; Attribute text color:K65:7; "red")
		
		// colorize oMyConfig JSON text
		$txtTmp:=ST Get plain text:C1092(OBJECT Get pointer:C1124(Object named:K67:5; "oMyConfig")->)
		$pos:=Position:C15("delete"; $txtTmp; 0; $length)
		ST SET ATTRIBUTES:C1093(*; "oMyConfig"; $pos; $pos+$length; Attribute text color:K65:7; "red")
		
		OBJECT GET COORDINATES:C663(*; "oConfig"; $left; $top; $right; $bottom)
		OBJECT GET COORDINATES:C663(*; "SplitterH"; $left2; $top2; $right2; $bottom2)
		OBJECT SET COORDINATES:C1248(*; "oConfig"; $left; $top; $right; $bottom2-20)
		
End case 