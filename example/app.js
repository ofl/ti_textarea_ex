// This is a test harness for your module
// You should do something interesting in this harness
// to test out the module and to provide instructions
// to users on how to use it by example.


// open a single window
var window = Ti.UI.createWindow({
	backgroundColor:'white'
});
//var label = Ti.UI.createLabel();
//window.add(label);

// TODO: write your module tests here

var TextareaEx = require('jp.covered');

Ti.API.info("module is => " + TextareaEx);
Ti.API.info("module exampleProp is => " + TextareaEx.exampleProp);
TextareaEx.exampleProp = "This is a test value";

var ta = TextareaEx.createTextArea({
    top:15,
    left:15,
    right:15,
    height:100,
    borderWidth: 1,
    borderColor: '#555',
    appearance:Ti.UI.KEYBOARD_APPEARANCE_DEFAULT,
    keyboardType:Ti.UI.KEYBOARD_DEFAULT,
    returnKeyType:Ti.UI.RETURNKEY_DEFAULT,
    suppressReturn:false

});

var leftBtn = Titanium.UI.createButton({
   title: 'Left',
   top: 130,
   height: 30,
   width: 100,
   left: 50
});

var rightBtn = Titanium.UI.createButton({
   title: 'Right',
   top: 130,
   height: 30,
   width: 100,
   right: 50
});

var redoBtn = Titanium.UI.createButton({
   title: 'Redo',
   top: 170,
   height: 30,
   width: 100,
   left: 50
});

var undoBtn = Titanium.UI.createButton({
   title: 'Undo',
   top: 170,
   height: 30,
   width: 100,
   right: 50
});

window.add(ta);
window.add(rightBtn);
window.add(leftBtn);
window.add(redoBtn);
window.add(undoBtn);

rightBtn.addEventListener('click',function(e)
{
    ta.cursorRight();
});
leftBtn.addEventListener('click',function(e)
{
   ta.cursorLeft();
});

redoBtn.addEventListener('click',function(e)
{
    ta.redo();
});
undoBtn.addEventListener('click',function(e)
{
   ta.undo();
});


window.open();

if (Ti.Platform.name == "android") {
	var proxy = TextareaEx.createExample({message: "Creating an example Proxy"});
	proxy.printMessage("Hello world!");
}