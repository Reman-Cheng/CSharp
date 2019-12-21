var myObj = {
	"name":"wangzhang",
	"num":3,
	"sites":["Google","Runobb","Taobao"]
}
for(i in myObj.sites){
	console.log(myObj.sites[i])
	// log.info(i)
}
myObj1 = {
	"name":"网站",
    "num":3,
    "sites": [
        { "name":"Google", "info":[ "Android", "Google 搜索", "Google 翻译" ] },
        { "name":"Runoob", "info":[ "菜鸟教程", "菜鸟工具", "菜鸟微信" ] },
        { "name":"Taobao", "info":[ "淘宝", "网购" ] }
    ]
}
for(i in myObj1.sites){
	console.log(myObj1.sites[i])
	for(j in myObj1.sites[i].info){
		console.log(myObj1.sites[i].info[j])
	}
}
delete myObj1.sites[0]//delete 运算符并不是彻底删除元素，而是删除它的值，但仍会保留空间
for(i in myObj1.sites){
	console.log(myObj1.sites[i])
}
console.log(myObj1.sites.length)

var date = JSON.parse('{ "name":"runoob", "alexa":10000, "site":"www.runoob.com" }');
console.log("----------",typeof(date));
for(k in date){
	console.log(k,date[k])
}

var obj = { "name":"runoob", "alexa":10000, "site":"www.runoob.com"};
var myJSON = JSON.stringify(obj);
console.log(typeof(myJSON));

var arr = [ "Google", "Runoob", "Taobao", "Facebook" ];
var myJSON = JSON.stringify(arr);
console.log(typeof(myJSON));


// JSON.stringify() 会将所有日期转换为字符串
console.log(new Date())
console.log(Date())
var obj = {"name":"Reman","initDate":new Date(),"site":"www.runoob.com"}
var myJSON = JSON.stringify(obj)
console.log(typeof(myJSON))

var txt = '{ "sites" : [' +
'{ "name":"菜鸟教程" , "url":"www.runoob.com" },' +
'{ "name":"google" , "url":"www.google.com" },' +
'{ "name":"微博" , "url":"www.weibo.com" } ]}';

//JavaScript 函数 eval() 可用于将 JSON 文本转换为 JavaScript 对象.
//必须把文本包围在括号中，这样才能避免语法错误.
var obj = eval("("+txt+")");
console.log(obj);
console.log(typeof(obj));
name1 = "aa";
name2 = "bb";
var test1 = func2("name1","name2");
function func2(name1,name2){
	return [name1,name2];
}
console.log(test1)
//--------20190907JavaScriptStart----------
// console.log(document.title);
var employee = new Object();
var books = new Array("C++","Perl","Java");
var day = new Date("August 15,1947");
var num = new Number();
console.log(employee,books,day,num);

var string1 = "fingding in the way";
console.log(string1.length);
console.log(typeof string1);
var string2 = new String("fingding in the way");
console.log(string2.length);
console.log(typeof string2);

console.log(string1.indexOf("i"));
console.log(string1.lastIndexOf("i"));
for (var i in string1.match("\w")){
    console.log(i);
}
console.log(Date())
console.log(Date.parse("Thu Sep 12 2019 19:30:18 GMT+0800"));
console.log(Math.E)
console.log(Math.LN2)
console.log(Math.LN7)
console.log(Math.LN10)
console.log(Math.asin(0.5))

var pattern1 = new RegExp("/a","g")
console.log(pattern1)

// console.log(exec(string1,pattern1))


//////////////////////对象 obj 和数组 array 的 typeof 值均为”object”//////////////
var obj = {};  
var array = ["one", "two", "three", "four"];  
console.log(typeof obj);//object  
console.log(typeof array); //object 
//调用 instanceof 来进行进一步的判断：
console.log(obj instanceof Array);
console.log(array instanceof Array)
if(obj instanceof Array == true){
	console.log("obj is array");
}else{
	console.log("obj is not array");
}

////////////引用不会指向引用本身，而是指向该引用所对应的实际对象,会同时变//////////////////
var array = [1,2,3,4,5];  
var arrayRef = array;  
array.push(6);  
console.log(arrayRef);


var variable = "out";
function funcvar1(){
	var variable = "in";//在方法体内为局部变量
}
funcvar1();
console.log(variable);
function funcvar2(){
	variable = "in";//没有写var关键字，则默认的操作是对全局对象
}
funcvar2();
console.log(variable);


var object = {  
    field : "self",  
    printInfo : function(){  
       console.log(this.field);  
    }  
} 
for(var key in object){
	console.log(key+" : "+object[key]);
}


//声明一个对象base  
function Base(name){  
    this.name = name;  
    this.getName = function(){  
       return this.name;  
    }  
}  

//声明一个对象child  
function Child(id){  
    this.id = id;  
    this.getId = function(){  
       return this.id;    
    }  
}  

//将child的原型指向一个新的base对象  
Child.prototype = new Base("base");  

//实例化一个child对象  
var c1 = new Child("child");  

//c1本身具有getId方法  
console.log(c1.getId());  
//由于c1从原型链上"继承"到了getName方法，因此可以访问  
console.log(c1.getName());  


/////////////////////// 对象的声明有三种方式：/////////////////////////////
// (2)定义对象的“类”:原型，然后使用 new 操作符来批量的构筑新的对象
//定义一个"类"，Address  
function Address(street, xno){  
    this.street = street || 'Huang Quan Road';  
    this.xno = xno || 135;  
    this.toString = function(){  
       return "street : " + this.street + ", No : " + this.xno;     
    }  
}  

//定义另一个"类"，Person  
function Person (name, age, addr) {  
  this.name = name || 'unknown';  
  this.age = age;  
  this.addr = addr || new Address(null, null);  
  this.getName = function () {return this.name;}  
  this.getAge = function(){return this.age;}  
  this.getAddr = function(){return this.addr.toString();}  
}  

//通过new操作符来创建两个对象，注意，这两个对象是相互独立的实体  
var jack = new Person('jack', 26, new Address('Qing Hai Road', 123));  
var abruzzi = new Person('abruzzi', 26);  

//查看结果  
console.log(jack.getName());  
console.log(jack.getAge());  
console.log(jack.getAddr());  

console.log(abruzzi.getName());  
console.log(abruzzi.getAge());  
console.log(abruzzi.getAddr());


//////////JSON 全称为 JavaScript 对象表示法(JavaScript Object Notation)，即通过字面量来表示一个对象，从简单到复杂均可使用此方式
var obj = {  
    name : "abruzzi",  
    age : 26,  
    birthday : new Date(1984, 4, 5),  
    addr : {  
       street : "Huang Quan Road",  
       xno : "135"  
    }  
} 
console.log(obj.addr.street);
for ( var i = 0 ; i < 10 ; ++i ) {
      setTimeout(function(){
          console.log(i);
      },0)//在异步队列中，要其他非异步队列执行完才执行
} 
//当调用setTimeout( func, xx )的时候，JS引擎会启动定时器timer，
//大约 xx ms以后执行 func，不过事实上，func 会在在浏览器不忙的时候才会真正执行。
//第二个参数 设置为 0 的意义就是当前面任务完成后马上执行

let variable1 = "fingding in let variable1";
console.log(variable1);

function p(){  
    console.log("invoke p by ()");  
}  

p.id = "func";  
p.type = "function";  

console.log(p);  
console.log(p.id+":"+p.type);  
console.log(p()); 


console.log("-----funcTest-------");  
function funcTest(){
	array = [1,2,3,5,7,89];
	for(var i=0;i<array.length;i++){

	}
		console.log(i);//i == array.length;
}
funcTest();


var str = "global";  
function scopeTest(){  
    console.log(str);  
    var str = "local";  
    console.log(str);  
}  

scopeTest(); 

////////////////call 和 apply///////////////////////////////////////////////
//定义一个人，名字为jack  
var jack = {  
    name : "jack",  
    age : 26  
}  

//定义另一个人，名字为abruzzi  
var abruzzi = {  
    name : "abruzzi",  
    age : 26  
}  

//定义一个全局的函数对象  
function printName(){  
    return this.name;  
}  

//设置printName的上下文为jack, 此时的this为jack  
console.log(printName.call(jack));  
//设置printName的上下文为abruzzi,此时的this为abruzzi  
console.log(printName.call(abruzzi));  

console.log(printName.apply(jack));  
console.log(printName.apply(abruzzi));  

//只有一个参数的时候call和apply的使用方式是一样的，如果有多个参数：
//apply 的第二个参数为一个函数需要的参数组成的一个数组，而 call 则需要跟若干个参数，参数之间以逗号(,)隔开即可

///////////////////////JavaScript 的数组//////////////////////////////
// concat()  连接两个或更多的数组，并返回结果。
// join()  把数组的所有元素放入一个字符串。元素通过指定的分隔符进行分隔。
// pop() 删除并返回数组的最后一个元素。
// push()  向数组的末尾添加一个或更多元素，并返回新的长度。
// reverse() 颠倒数组中元素的顺序。
// shift() 删除并返回数组的第一个元素。
// slice() 从某个已有的数组返回选定的元素。
// sort()  对数组的元素进行排序。
// splice()  删除元素，并向数组添加新元素。
// unshift() 向数组的开头添加一个或更多元素，并返回新的长度。
// valueOf() 返回数组对象的原始值。
var arr1 = [1,2,3];
var arr2 = [4,5,6];
var arr3 = [7,8,9];
arr1.push("four");
console.log(arr1);
arr1.pop();
console.log(arr1);
console.log(arr1.join("|"));
var arrconcat = arr1.concat(arr2);//连接多个数组为一个数组
console.log(arrconcat);
var arrconcat = arr1.concat(arr2,arr3);
console.log(arrconcat);
console.log("----slice splice----")
console.log(arrconcat.slice(1,3));//左闭右开
console.log(arrconcat);
console.log(arrconcat.splice(5, 2));  
console.log(arrconcat);
arrconcat = arrconcat.splice(5, 1,"kai")
console.log(arrconcat); 
// 第一行代码表示，从 bigArray 数组中，从第 5 个元素起，删除 2 个元素；
// 而第二行代码表示，从第 5 个元素起，删除0个元素，并把随后的所有参数插入到从第 5 个开始的位置

var array = ["Cisio", "Borland", "Apple", "Dell"];  
console.log(array);  
array.sort();  
console.log(array); 

var array = [10, 23, 44, 58, 106, 235];  
array.sort();  
console.log(array); 

function sorter(a,b){
  return a-b;
}
//return 1 0 -1
var array = [10, 23, 44, 58, 106, 235];  
array.sort(sorter);  
console.log(array); 


/////////////////////////// 正则表达式 ////////////////////////////////////
var emailval = /^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$/;
console.log(emailval.test("kmustlinux@hotmail.com"));
console.log(emailval.test("john.abruzzi@pl.kunming.china"));
console.log(emailval.test("@invalid.com"));
// 应该注意的是，test 方法只是测试目标串中是否有表达式匹配的部分，而不一定整个串都匹配
var variable = /[a-zA-Z_][a-zA-Z0-9_]*/;
console.log(variable.test("0871_hello_world"));
console.log(variable.test("@main"));
var variable = /^[a-zA-Z_][a-zA-Z0-9_]*$/;
console.log(variable.test("0871_hello_world"));
console.log(variable.test("@main"));

var pid = /^[\d{15}|\d{18}]$/;//身份证  
var mphone = /\d{11}/;//手机号码  
var phone = /\d{3,4}-\d{7,8}/;//电话号码  

console.log(mphone.test("13893939392"));//true  
console.log(phone.test("010-99392333"));//true  
console.log(phone.test("0771-3993923"));//true  

var pattern = /\w{4}(\d{4})(\w{2})/;  
var result = pattern.exec("yunn0871cg");  
console.log("city code = "+result[1]+", county code = "+result[2]);  
// 正则表达式的 exec 方法会返回一个数组(如果匹配成功的话)，数组的第一个元素(下标为 0)表示整个串
var pattern = /(['"])[^'"]*\1/;
var str = "hel'lo,wor'ld";
console.log(pattern.exec(str));

//var regex = /pattern/[switchs];
//switchs 有三种情况 i 忽略大小写开关;g 全局搜索开关;m 多行搜索开关(重定义^与$的意义)
console.log("----String 中的正则表达式----");
////////String 中的正则表达式////////
var str = "life is very much like a mirror.";
var result = str.match(/is|a/g);//匹配正则表达式，返回匹配数组
console.log(result);

var str = "<span>Welcome, John</span>";
var result = str.replace(/span/g,"div");//替换
console.log(str);//replace 方法不会影响原始字符串，而将新的串作为返回值
console.log(result);
var result = str.replace(/(\w+),\s(\w+)/g,"$2, $1");//将 Welcome 和 John 两个单词调换顺序
console.log(str)
console.log(result);

var str = "john : tomorrow        :remove:file";  
var result = str.split(/\s*:\s*/);//分割  
console.log(str);  
console.log(result);

var str = "Tomorrow is another day";  
var index = str.search(/another/);//search 方法会返回查找到的文本在模式中的位置，如果查找不到，返回-1。 
console.log(index);//12  


////////////////////闭包//////////////////////////
var datamodel = {
  table:[],
  tree:{}
};
function dataModel(dm){
  for(var i = 0;i < dm.table.rows;i++){
    var row = dm.table.rows[i];
    for(var j=0;j<row.cells;i++){
      drawCell(i,j);
    }
  }
}
dataModel(datamodel);

//实现封装
//1.
var Person1=function(){
  var name = "default";
  return{
    getName1:function(){
      return name;
    },
    setName1:function(newname){
      name = newname;
    }
  }
}();//对象 方法 并执行
console.log(Person1.name);
// var person = Person1();
console.log(Person1.getName1());
Person1.setName1("reman");
console.log(Person1.getName1());

//2.
function Pers(){
  var name = "default";
  return{
    getName : function(){  
           return name;  
       },  
       setName : function(newName){  
           name = newName;  
       } 
  }
};
var pers = Pers();
console.log(pers.getName());
pers.setName("reman");
console.log(pers.getName());

//实现面向对象中的对象
function Person2(){  
    var name = "default";     
    return {  
       getName : function(){  
           return name;  
       },  
       setName : function(newName){  
           name = newName;  
       }  
    }  
};  

var john = Person2();  
console.log(john.getName());  
john.setName("john");  
console.log(john.getName());  

var jack = Person2();  
console.log(jack.getName());  
jack.setName("jack");  
console.log(jack.getName());


////////////////////////面向对象的 Javascript////////////////////
function Base1(){
  this.baseFunc = function(){
    console.log("base behavior");
  }
}
function Middle(){
  this.middleFunc = function(){
    console.log("middle behavior");
  }
}
function Final(){
  this.finalFunc = function(){
    console.log("final behavior");
  }
}
Middle.prototype = new Base1();
Final.prototype = new Middle();
function test(){
  var obj = new Final();
  obj.baseFunc();
  obj.middleFunc();
  obj.finalFunc();
}
test();

var obj = {};
var ref = obj;
obj.name = "remanman";
console.log(ref.name);
console.log(obj.name);




function Personfengzhuang(name){
  var address = "The Earth";

  //public method
  this.getAddress = function(){
    return address;
  }

  //public variable
  this.name = name;
}

//Public
Personfengzhuang.prototype.getName = function(){
  return this.name;
}
//public
Personfengzhuang.prototype.setName = function(name){
  this.name = name;
}
Personfengzhuang.TAG = "new four";

var jack = new Personfengzhuang("jack");
console.log(jack.name);
console.log(jack.getName());
console.log(jack.address);
console.log(jack.getAddress());
console.log(jack.setName("reman for setname"));
console.log(jack.getName());
console.log(Personfengzhuang.TAG);

console.log(this);


