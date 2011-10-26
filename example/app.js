var window = Ti.UI.createWindow({
	backgroundColor:'white'
});

var TextareaEx = require('jp.covered');

//var ta = TextareaEx.createTextField({
//    top:15,
//    left:15,
//    height:30,
//    right:15,
//    borderWidth: 1,
//    borderColor: '#555',
//    appearance:Ti.UI.KEYBOARD_APPEARANCE_DEFAULT,
//    keyboardType:Ti.UI.KEYBOARD_DEFAULT,
//    returnKeyType:Ti.UI.RETURNKEY_DEFAULT,
//    suppressReturn:false
//
//});

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

var clearBtn = Titanium.UI.createButton({
   title: 'Clear',
   top: 210,
   height: 30,
   width: 100,
   right: 50
});

var insBtn = Titanium.UI.createButton({
   title: 'Insert',
   top: 210,
   height: 30,
   width: 100,
   left: 50
});

window.add(ta);
window.add(rightBtn);
window.add(leftBtn);
window.add(redoBtn);
window.add(undoBtn);
window.add(clearBtn);
window.add(insBtn);

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
clearBtn.addEventListener('click',function(e)
{
    ta.clear();
});
insBtn.addEventListener('click',function(e)
{
   ta.insertString("Text inserted");
});

ta.addEventListener('keyboardChanged', function(e){
   Ti.API.info(e.type);
   Ti.API.info(e.kbHeight);
});

window.open();


