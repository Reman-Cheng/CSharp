function HitToSaySomething(){
	alert("say hello too!")
}
function sayHello(){
	alert("hello");
}
function over(){
	alert("Mouse Over");
}
function out(){
	alert("Mouse out");
}

// Event	    Value	  Description
// onchange	    script	  Script runs when the element changes
// onsubmit	    script	  Script runs when the form is submitted
// onreset	    script	  Script runs when the form is reset
// onselect	    script	  Script runs when the element is selected
// onblur	    script	  Script runs when the element loses focus
// onfocus	    script	  Script runs when the element gets focus
// onkeydown	script	  Script runs when key is pressed
// onkeypress	script	  Script runs when key is pressed and released
// onkeyup	    script	  Script runs when key is released
// onclick	    script	  Script runs when a mouse click
// ondblclick	script	  Script runs when a mouse double-click
// onmousedown	script	  Script runs when mouse button is pressed
// onmousemove	script	  Script runs when mouse pointer moves
// onmouseout	script	  Script runs when mouse pointer moves out of an element
// onmouseover	script	  Script runs when mouse pointer moves over an element
// onmouseup	script	  Script runs when mouse button is released

function WriteCookie()
{
   if( document.myform.customer.value == "" ){
      alert("Enter some value!");
      return;
   }

   cookievalue= escape(document.myform.customer.value) + ";";
   document.cookie="name=" + cookievalue;
   alert("Setting Cookies : " + "name=" + cookievalue );
}
function documenttitle(){
	// document.write("this is test");
	alert(document.title);
}
var imgObj = null;
var animate;
function init(){
	imgObj = document.getElementById("myImage");
	imgObj.style.position = "relative";
	imgObj.style.left = "0px";
}
function moveRight(){
	imgObj.style.left = parseInt(imgObj.style.left)+10+"px";
}
function moveRightAuto(){
	imgObj.style.left = parseInt(imgObj.style.left)+10+"px";
	animate = setTimeout(moveRightAuto,20);
}
function stopMove(){
	clearTimeout(animate);
	imgObj.style.left = "0px";
}
window.onload =init;



