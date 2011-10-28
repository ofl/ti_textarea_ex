# ti_textarea_ex Module

## Description

テキストエリアとテキストフィールドの機能を拡張するTitanium mobileモジュール(iOS用)

## Accessing the ti_textarea_ex Module


	var ti_textarea_ex = require("jp.covered");
	
	var textArea = ti_textarea_ex.createTextArea({
		//options
	});
	
	var textField = ti_textarea_ex.createTextField({
		//options	
	});

オプションは通常のテキストフィールドやテキストフィールドと同じ。

## Reference


### function

共通

	[textfield/textarea].clear()
	[textfield/textarea].undo()
	[textfield/textarea].redo()
	[textfield/textarea].paste()

テキストエリアのみ

	[textarea].cursorLeft()
	[textarea].cursorRight()
	[textarea].insertString(text)


### Events

キーボードの表示・非表示時を通知（UIに依存するfocus,blurと違いWebViewのフォームでキーボードが表示された時にも通知を受け取る）。

	keyboardDidShow
	keyboardDidHide


キーボードのフレームのサイズの変化を受け取る(iOS5のみ)。

	[textarea]keyboardChanged	
		fired when the keyboard type changed
		
		Event properties
			source
			type
			kbHeight	//キーボードの高さ
			kbWidth  	//キーボードのよこ幅
			
## Install

ターミナルで以下のコマンドを実行

	`python build.py && unzip jp.covered-iphone-0.1.zip -d /Library/Application\ Support/Titanium/`

もしくは

	`python build.py`
	 
で作成されたjp.covered-iphone-0.1.zipを解凍して
/Library/Application\ Support/Titanium/modules/iphoneに手動でコピー

## Usage

tiapp.xmlのモジュールの項目に追加

	<modules>
		<module version="0.1">jp.covered</module>
	</modules>

## License

MIT License

Copyright 2010 Shin Morichika (towerofl) http://tempad.info/ Twitter: @towerofl