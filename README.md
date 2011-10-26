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


### ___PROJECTNAMEASIDENTIFIER__.function

共通

	clear()
	undo()
	redo()
	paste()

テキストエリアのみ

	cursorLeft()
	cursorRight()
	insertString(text)


### Events

通常のイベントに追加してテキストエリアのみ

	keyboardChanged	
		fired when the keyboard type changed
		
		Event properties
			source
			type
			kbHeight	キーボードの高さ
			kbWidth	キーボードのよこ幅
			
## Install

ターミナルで以下のコマンドを実行

	`python build.py && unzip jp.covered-iphone-0.1.zip -d /Library/Application＼ Support/Titanium/`

もしくは

	`python build.py`
	 
で作成されたjp.covered-iphone-0.1.zipを解凍して
Support/Titanium/modules/iphoneに手動でコピー

## Usage

tiapp.xmlのモジュールの項目に追加

	<modules>
		<module version="0.1">jp.covered</module>
	</modules>

## License

MIT License

Copyright 2010 Shin Morichika (towerofl) http://tempad.info/ Twitter: @towerofl