package Jemplate::Runtime::Compact;
use strict;
use warnings;

sub main { return &kernel }
sub kernel {
    <<'...';
if(typeof Jemplate=="undefined"){var Jemplate=function(){this.init.apply(this,arguments)}}Jemplate.VERSION="0.22";Jemplate.GLOBAL=this;Jemplate.process=function(){var A=new Jemplate(Jemplate.prototype.config);return A.process.apply(A,arguments)};(function(){if(!Jemplate.templateMap){Jemplate.templateMap={}}var B=Jemplate.prototype={};B.config={AUTO_RESET:true,BLOCKS:{},CONTEXT:null,DEBUG_UNDEF:false,DEFAULT:null,ERROR:null,EVAL_JAVASCRIPT:false,GLOBAL_ACCESS:1,FILTERS:{},INCLUDE_PATH:[""],INTERPOLATE:false,OUTPUT:null,PLUGINS:{},POST_PROCESS:[],PRE_PROCESS:[],PROCESS:null,RECURSION:false,STASH:null,TOLERANT:null,VARIABLES:{},WRAPPER:[]};B.defaults={AUTO_RESET:true,BLOCKS:{},CONTEXT:null,DEBUG_UNDEF:false,DEFAULT:null,ERROR:null,EVAL_JAVASCRIPT:false,GLOBAL_ACCESS:1,FILTERS:{},INCLUDE_PATH:[""],INTERPOLATE:false,OUTPUT:null,PLUGINS:{},POST_PROCESS:[],PRE_PROCESS:[],PROCESS:null,RECURSION:false,STASH:null,TOLERANT:null,VARIABLES:{},WRAPPER:[]};Jemplate.init=function(C){Jemplate.prototype.config=C||{};for(var D in Jemplate.prototype.defaults){if(typeof Jemplate.prototype.config[D]=="undefined"){Jemplate.prototype.config[D]=Jemplate.prototype.defaults[D]}}};B.init=function(C){this.config=C||{};for(var D in Jemplate.prototype.defaults){if(typeof this.config[D]=="undefined"){this.config[D]=Jemplate.prototype.defaults[D]}}};B.process=function(H,I,E){var G=this.config.CONTEXT||new Jemplate.Context();G.config=this.config;G.stash=this.config.STASH||new Jemplate.Stash();G.stash.__config__=this.config;G.__filter__=new Jemplate.Filter();G.__filter__.config=this.config;G.__plugin__=new Jemplate.Plugin();G.__plugin__.config=this.config;var C;var D=function(J){try{if(typeof G.config.PRE_PROCESS=="string"){G.config.PRE_PROCESS=[G.config.PRE_PROCESS]}for(var L=0;L<G.config.PRE_PROCESS.length;L++){G.process(G.config.PRE_PROCESS[L])}C=G.process(H,J);if(typeof G.config.POST_PROCESS=="string"){G.config.PRE_PROCESS=[G.config.POST_PROCESS]}for(L=0;L<G.config.POST_PROCESS.length;L++){G.process(G.config.POST_PROCESS[L])}}catch(M){if(!String(M).match(/Jemplate\.STOP\n/)){throw (M)}C=M.toString().replace(/Jemplate\.STOP\n/,"")}if(typeof E=="undefined"){return C}if(typeof E=="function"){E(C);return null}if(typeof (E)=="string"||E instanceof String){if(E.match(/^#[\w\-]+$/)){var N=E.replace(/^#/,"");var K=document.getElementById(N);if(typeof K=="undefined"){throw ('No element found with id="'+N+'"')}K.innerHTML=C;return null}}else{E.innerHTML=C;return null}throw ("Invalid arguments in call to Jemplate.process");return 1};if(typeof I=="function"){I=I()}else{if(typeof I=="string"){var F=I;Jemplate.Ajax.processGet(F,function(J){D(J)});return null}}return D(I)};if(typeof Jemplate.Context=="undefined"){Jemplate.Context=function(){}}B=Jemplate.Context.prototype;B.include=function(D,C){return this.process(D,C,true)};B.process=function(E,D,G){if(G){this.stash.clone(D)}else{this.stash.update(D)}var F=Jemplate.templateMap[E];if(typeof F=="undefined"){throw ('No Jemplate template named "'+E+'" available')}var C=F(this);if(G){this.stash.declone()}return C};B.set_error=function(D,C){this._error=[D,C];return D};B.plugin=function(D,C){if(typeof D=="undefined"){throw"Unknown plugin name ':"+D+"'"}return new Jemplate.GLOBAL[D](this,C)};B.filter=function(E,D,C){if(D=="null"){D="null_filter"}if(typeof this.__filter__.filters[D]=="function"){return this.__filter__.filters[D](E,C,this)}else{throw"Unknown filter name ':"+D+"'"}};if(typeof Jemplate.Plugin=="undefined"){Jemplate.Plugin=function(){}}B=Jemplate.Plugin.prototype;B.plugins={};if(typeof Jemplate.Filter=="undefined"){Jemplate.Filter=function(){}}B=Jemplate.Filter.prototype;B.filters={};B.filters.null_filter=function(C){return""};B.filters.upper=function(C){return C.toUpperCase()};B.filters.lower=function(C){return C.toLowerCase()};B.filters.ucfirst=function(E){var D=E.charAt(0);var C=E.substr(1);return D.toUpperCase()+C};B.filters.lcfirst=function(E){var D=E.charAt(0);var C=E.substr(1);return D.toLowerCase()+C};B.filters.trim=function(C){return C.replace(/^\s+/g,"").replace(/\s+$/g,"")};B.filters.collapse=function(C){return C.replace(/^\s+/g,"").replace(/\s+$/g,"").replace(/\s+/," ")};B.filters.html=function(C){C=C.replace(/&/g,"&amp;");C=C.replace(/</g,"&lt;");C=C.replace(/>/g,"&gt;");C=C.replace(/"/g,"&quot;");return C};B.filters.html_para=function(D){var C=D.split(/(?:\r?\n){2,}/);return"<p>\n"+C.join("\n</p>\n\n<p>\n")+"</p>\n"};B.filters.html_break=function(C){return C.replace(/(\r?\n){2,}/g,"$1<br />$1<br />$1")};B.filters.html_line_break=function(C){return C.replace(/(\r?\n)/g,"$1<br />$1")};B.filters.uri=function(C){return encodeURIComponent(C)};B.filters.url=function(C){return encodeURI(C)};B.filters.indent=function(H,D){var F=D[0];if(!H){return null}if(typeof F=="undefined"){F=4}var G="";if(typeof F=="number"||String(F).match(/^\d$/)){for(var E=0;E<F;E++){G+=" "}}else{G=F}var C=H.replace(/^/gm,G);return C};B.filters.truncate=function(F,D){var C=D[0];if(!F){return null}if(!C){C=32}if(F.length<C){return F}var E=C-3;return F.substr(0,E)+"..."};B.filters.repeat=function(F,C){if(!F){return null}if(!C||C==0){C=1}if(C==1){return F}var D=F;for(var E=1;E<C;E++){D+=F}return D};B.filters.replace=function(G,D){if(!G){return null}var C=D[0];var F=D[1];if(!C){C=""}if(!F){F=""}var E=new RegExp(C,"g");return G.replace(E,F)};if(typeof Jemplate.Stash=="undefined"){Jemplate.Stash=function(){this.data={}}}B=Jemplate.Stash.prototype;B.clone=function(C){var D=this.data;this.data={};this.update(D);this.update(C);this.data._PARENT=D};B.declone=function(C){this.data=this.data._PARENT||this.data};B.update=function(C){if(typeof C=="undefined"){return }for(var D in C){var E=C[D];this.set(D,E)}};B.get=function(H,E){var D=this.data;var G;if((H instanceof Array)||(typeof H=="string"&&/\./.test(H))){if(typeof H=="string"){H=H.split(".");var I=[];for(var F=0;F<H.length;F++){I.push(H.replace(/\(.*$/,""));I.push(0)}H=I}for(var F=0;F<H.length;F+=2){var C=H.slice(F,F+2);C.unshift(D);G=this._dotop.apply(this,C);if(typeof G=="undefined"){break}D=G}}else{G=this._dotop(D,H,E)}if(typeof G=="undefined"||G==null){if(this.__config__.DEBUG_UNDEF){throw ("undefined value found while using DEBUG_UNDEF")}G=""}return G};B.set=function(D,J,C){var I,L,G;I=this.data;while(true){if((D instanceof Array)||(typeof D=="string"&&/\./.test(D))){if(typeof D=="string"){D=D.split(".");var H=[];for(var E=0;E<D.length;E++){H.push(D.replace(/\(.*$/,""));H.push(0)}D=H}for(var E=0;E<D.length-2;E+=2){var F=D.slice(E,E+2);F.unshift(I);F.push(1);L=this._dotop.apply(this,F);if(typeof J=="undefined"){break}I=L}var K=D.slice(D.length-2,D.length);K.unshift(I);K.push(J);K.push(C);L=this._assign.apply(this,K)}else{L=this._assign(I,D,0,J,C)}break}return(typeof L!="undefined")?L:""};B._dotop=function(I,K,H,L){var E=I==this.data;var J,M=undefined;var F=H instanceof Array;H=H||[];if(typeof I=="undefined"||typeof K=="undefined"||typeof K=="string"&&K.match(/^[\._]/)){return undefined}if(E||I.constructor==Object.prototype.constructor||I==Jemplate.GLOBAL){if(typeof I[K]!="undefined"&&I[K]!=null&&(!F||!this.hash_functions[K])){if(typeof I[K]=="function"){M=I[K].apply(I,H)}else{return I[K]}}else{if(E&&typeof Jemplate.GLOBAL[K]!="undefined"&&this.__config__.GLOBAL_ACCESS&&(L?this.__config__.GLOBAL_ACCESS==2:true)){if(typeof Jemplate.GLOBAL[K]=="function"){M=Jemplate.GLOBAL[K].apply(Jemplate.GLOBAL,H)}else{return Jemplate.GLOBAL[K]}}else{if(L){return I[K]={}}else{if(this.hash_functions[K]&&!E||K=="import"){H.unshift(I);M=this.hash_functions[K].apply(this,H)}else{if(K instanceof Array){M={};for(var D=0;D<K.length;D++){M[K[D]]=I[K[D]]}return M}}}}}}else{if(I instanceof Array){if(this.list_functions[K]){H.unshift(I);M=this.list_functions[K].apply(this,H)}else{if(typeof K=="string"&&/^-?\d+$/.test(K)||typeof K=="number"){if(typeof I[K]!="function"){return I[K]}M=I[K].apply(this,H)}else{if(K instanceof Array){for(var D=0;D<K.length;D++){M.push(I[K[D]])}return M}}}}else{if((I.constructor!=Object.prototype.constructor)&&(I instanceof Object)){try{M=I[K].apply(I,H)}catch(G){var C=I.constructor.name;if(false){throw"Cant locate method"}if(I instanceof Array){if(this.list_functions[K]){H.unshift(I);M=this.list_functions[K].apply(this,H)}else{if(typeof K=="string"&&/^-?\d+$/.test(K)||typeof K=="number"){if(typeof I[K]!="function"){return I[K]}M=I[K].apply(this,H)}else{if(K instanceof Array){for(var D=0;D<K.length;D++){M.push(I[K[D]])}return M}}}}else{if(typeof I=="object"){if(typeof I[K]!="undefined"&&I[K]!=null){if(typeof I[K]=="function"){M=I[K].apply(this,H)}else{return I[K]}}else{if(this.hash_functions[K]){H.unshift(I);M=this.hash_functions[K].apply(this,H)}}}else{if(this.string_functions[K]){H.unshift(I);M=this.string_functions[K].apply(this,H)}else{if(this.list_functions[K]){H.unshift([I]);M=this.list_functions[K].apply(this,H)}}}}}}else{if(this.string_functions[K]&&!L){H.unshift(I);M=this.string_functions[K].apply(this,H)}else{if(this.list_functions[K]&&!L){H.unshift([I]);M=this.list_functions[K].apply(this,H)}else{M=undefined}}}}}if(M instanceof Array){if(typeof M[0]=="undefined"&&typeof M[1]!="undefined"){throw M[1]}}return M};B._assign=function(E,G,F,H,D){var J=E==this.data;var C;F=F||[];if(typeof E=="undefined"||typeof G=="undefined"||typeof G=="string"&&G.match(/^[\._]/)){return undefined}if(J||(E.constructor==Object.prototype.constructor)){if(!(D&&typeof E[G]!="undefined")){return E[G]=H}}else{if((E instanceof Array)&&(typeof G=="string"&&/^-?\d+$/.test(G)||typeof G=="number")){if(!(D&&typeof E[G]!="undefined")){return E[G]=H}}else{if((E.constructor!=Object.prototype.constructor)&&(E instanceof Object)){try{C=E[G].apply(E,F)}catch(I){}}else{throw"dont know how to assign to ["+E+"."+G+"]"}}}return undefined};B.string_functions={};B.string_functions.chunk=function(C,E){var F=new Array();if(!E){E=1}if(E<0){E=0-E;for(var D=C.length-E;D>=0;D=D-E){F.unshift(C.substr(D,E))}if(C.length%E){F.unshift(C.substr(0,C.length%E))}}else{for(D=0;D<C.length;D=D+E){F.push(C.substr(D,E))}}return F};B.string_functions.defined=function(C){return 1};B.string_functions.hash=function(C){return{"value":C}};B.string_functions.length=function(C){return C.length};B.string_functions.list=function(C){return[C]};B.string_functions.match=function(D,E,C){var G=new RegExp(E,C);var F=D.match(G);return F};B.string_functions.repeat=function(E,D){var G=D||1;var C="";for(var F=0;F<G;F++){C+=E}return C};B.string_functions.replace=function(D,F,E,C){var G=new RegExp(F,C);if(!E){E=""}return D.replace(G,E)};B.string_functions.search=function(C,D){var E=new RegExp(D);return(C.search(E)>=0)?1:0};B.string_functions.size=function(C){return 1};B.string_functions.split=function(C,D){var F=new RegExp(D);var E=C.split(F);return E};B.list_functions={};B.list_functions.list=function(C){return C};B.list_functions.join=function(C,D){return C.join(D)};B.list_functions.sort=function(D,C){if(typeof (C)!="undefined"&&C!=""){return D.sort(function(F,E){if(F[C]==E[C]){return 0}else{if(F[C]>E[C]){return 1}else{return -1}}})}return D.sort()};B.list_functions.nsort=function(C){return C.sort(function(E,D){return(E-D)})};B.list_functions.grep=function(G,E){var F=new RegExp(E);var C=[];for(var D=0;D<G.length;D++){if(G[D].match(F)){C.push(G[D])}}return C};B.list_functions.unique=function(G){var C=[];var D={};for(var E=0;E<G.length;E++){var F=G[E];if(!D[F]){C.push(F)}D[F]=true}return C};B.list_functions.reverse=function(E){var C=[];for(var D=E.length-1;D>=0;D--){C.push(E[D])}return C};B.list_functions.merge=function(F){var C=[];var D=function(H){if(H instanceof Array){for(var G=0;G<H.length;G++){C.push(H[G])}}else{C.push(H)}};D(F);for(var E=1;E<arguments.length;E++){D(arguments[E])}return C};B.list_functions.slice=function(D,E,C){return D.slice(E,C)};B.list_functions.splice=function(D){var C=Array.prototype.slice.call(arguments);C.shift();return D.splice.apply(D,C)};B.list_functions.push=function(D,C){D.push(C);return D};B.list_functions.pop=function(C){return C.pop()};B.list_functions.unshift=function(D,C){D.unshift(C);return D};B.list_functions.shift=function(C){return C.shift()};B.list_functions.first=function(C){return C[0]};B.list_functions.size=function(C){return C.length};B.list_functions.max=function(C){return C.length-1};B.list_functions.last=function(C){return C.slice(-1)};B.hash_functions={};B.hash_functions.each=function(E){var D=new Array();for(var C in E){D.push(C,E[C])}return D};B.hash_functions.exists=function(D,C){return(typeof (D[C])=="undefined")?0:1};B.hash_functions["import"]=function(E,D){for(var C in D){E[C]=D[C]}return""};B.hash_functions.keys=function(E){var D=new Array();for(var C in E){D.push(C)}return D};B.hash_functions.list=function(F,E){var D=new Array();var C;if(E=="keys"){for(C in F){D.push(C)}}else{if(E=="values"){for(C in F){D.push(F[C])}}else{if(E=="each"){for(C in F){D.push(C,F[C])}}else{for(C in F){D.push({"key":C,"value":F[C]})}}}}return D};B.hash_functions.nsort=function(E){var D=new Array();for(var C in E){D.push(C)}return D.sort(function(G,F){return(G-F)})};B.hash_functions.size=function(E){var D=0;for(var C in E){D++}return D};B.hash_functions.sort=function(E){var D=new Array();for(var C in E){D.push(C)}return D.sort()};B.hash_functions.values=function(E){var D=new Array();for(var C in E){D.push(E[C])}return D};B.hash_functions.remove=function(D,C){return delete D[C]};B.hash_functions["delete"]=B.hash_functions.remove;if(typeof Jemplate.Iterator=="undefined"){Jemplate.Iterator=function(D){if(D instanceof Array){this.object=D;this.size=D.length;this.max=this.size-1}else{if(D instanceof Object){this.object=D;var C=new Array;for(var E in D){C[C.length]=E}this.object_keys=C.sort();this.size=C.length;this.max=this.size-1}else{if(typeof D=="undefined"||D==null||D==""){this.object=null;this.max=-1}}}}}B=Jemplate.Iterator.prototype;B.get_first=function(){this.index=0;this.first=1;this.last=0;this.count=1;return this.get_next(1)};B.get_next=function(C){var E=this.object;var D;if(typeof (C)!="undefined"&&C){D=this.index}else{D=++this.index;this.first=0;this.count=this.index+1;if(this.index==this.size-1){this.last=1}}if(typeof E=="undefined"){throw ("No object to iterate")}if(this.object_keys){if(D<this.object_keys.length){this.prev=D>0?this.object_keys[D-1]:"";this.next=D<this.max?this.object_keys[D+1]:"";return[this.object_keys[D],false]}}else{if(D<=this.max){this.prev=D>0?E[D-1]:"";this.next=D<this.max?E[D+1]:"";return[E[D],false]}}return[null,true]};var A="stub that doesn't do anything. Try including the jQuery, YUI, or XHR option when building the runtime";Jemplate.Ajax={get:function(C,D){throw ("This is a Jemplate.Ajax.get "+A)},processGet:function(C,D){throw ("This is a Jemplate.Ajax.processGet "+A)},post:function(C,D){throw ("This is a Jemplate.Ajax.post "+A)}};Jemplate.JSON={parse:function(C){throw ("This is a Jemplate.JSON.parse "+A)},stringify:function(C){throw ("This is a Jemplate.JSON.stringify "+A)}}}())
...
}

sub ajax_jquery {
    <<'...';
(function(){Jemplate.Ajax={get:function(A,B){jQuery.get(A,null,B)},processGet:function(A,B){jQuery.getJSON(A,null,B)},post:function(A,B,C){jQuery.post(A,B,C)}}}())
...
}

sub ajax_xhr {
    <<'...';
(function(){Jemplate.Ajax={get:function(A,C){var B=new XMLHttpRequest();B.open("GET",A,Boolean(C));B.setRequestHeader("Accept","text/json; text/x-json; application/json");return this.request(B,null,C)},processGet:function(A,B){this.get(A,function(C){B(Jemplate.JSON.parse(C))})},post:function(A,C,D){var B=new XMLHttpRequest();B.open("POST",A,Boolean(D));B.setRequestHeader("Accept","text/json; text/x-json; application/json");B.setRequestHeader("Content-Type","application/x-www-form-urlencoded");return this.request(B,C,D)},request:function(A,B,C){if(C){A.onreadystatechange=function(){if(A.readyState==4){if(A.status==200){C(A.responseText)}}}}A.send(B);if(!C){if(A.status!=200){throw ('Request for "'+url+'" failed with status: '+A.status)}return A.responseText}return null}}}())
...
}

sub ajax_yui {
    <<'...';
(function(){Jemplate.Ajax={get:function(A,B){if(typeof B=="function"){B={success:B}}YAHOO.connect.asyncRequest("GET",A,B)},processGet:function(A,B){this.get(A,function(C){B(YAHOO.lang.JSON.parse(C))})},post:function(A,B,C){if(typeof C=="function"){C={success:C}}YAHOO.connect.asyncRequest("POST",A,C,B)}}}())
...
}

sub json_json2 {
    <<'...';
(function(){Jemplate.JSON={parse:function(A){return JSON.parse(A)},stringify:function(A){return JSON.stringify(A)}}}())
...
}

sub json_json2_internal {
    <<'...';
;(function(){

var JSON;

if(!JSON){var JSON}if(!JSON){JSON=function(){function f(n){return n<10?"0"+n:n}Date.prototype.toJSON=function(){return this.getUTCFullYear()+"-"+f(this.getUTCMonth()+1)+"-"+f(this.getUTCDate())+"T"+f(this.getUTCHours())+":"+f(this.getUTCMinutes())+":"+f(this.getUTCSeconds())+"Z"};var escapeable=/["\\\x00-\x1f\x7f-\x9f]/g,gap,indent,meta={"\b":"\\b","\t":"\\t","\n":"\\n","\f":"\\f","\r":"\\r",'"':'\\"',"\\":"\\\\"},rep;function quote(string){return escapeable.test(string)?'"'+string.replace(escapeable,function(a){var c=meta[a];if(typeof c==="string"){return c}c=a.charCodeAt();return"\\u00"+Math.floor(c/16).toString(16)+(c%16).toString(16)})+'"':'"'+string+'"'}function str(key,holder){var i,k,v,length,mind=gap,partial,value=holder[key];if(value&&typeof value==="object"&&typeof value.toJSON==="function"){value=value.toJSON(key)}if(typeof rep==="function"){value=rep.call(holder,key,value)}switch(typeof value){case"string":return quote(value);case"number":return isFinite(value)?String(value):"null";case"boolean":case"null":return String(value);case"object":if(!value){return"null"}gap+=indent;partial=[];if(typeof value.length==="number"&&!(value.propertyIsEnumerable("length"))){length=value.length;for(i=0;i<length;i+=1){partial[i]=str(i,value)||"null"}v=partial.length===0?"[]":gap?"[\n"+gap+partial.join(",\n"+gap)+"\n"+mind+"]":"["+partial.join(",")+"]";gap=mind;return v}if(typeof rep==="object"){length=rep.length;for(i=0;i<length;i+=1){k=rep[i];if(typeof k==="string"){v=str(k,value,rep);if(v){partial.push(quote(k)+(gap?": ":":")+v)}}}}else{for(k in value){v=str(k,value,rep);if(v){partial.push(quote(k)+(gap?": ":":")+v)}}}v=partial.length===0?"{}":gap?"{\n"+gap+partial.join(",\n"+gap)+"\n"+mind+"}":"{"+partial.join(",")+"}";gap=mind;return v}return null}return{stringify:function(value,replacer,space){var i;gap="";indent="";if(space){if(typeof space==="number"){for(i=0;i<space;i+=1){indent+=" "}}else{if(typeof space==="string"){indent=space}}}if(!replacer){rep=function(key,value){if(!Object.hasOwnProperty.call(this,key)){return undefined}return value}}else{if(typeof replacer==="function"||(typeof replacer==="object"&&typeof replacer.length==="number")){rep=replacer}else{throw new Error("JSON.stringify")}}return str("",{"":value})},parse:function(text,reviver){var j;function walk(holder,key){var k,v,value=holder[key];if(value&&typeof value==="object"){for(k in value){if(Object.hasOwnProperty.call(value,k)){v=walk(value,k);if(v!==undefined){value[k]=v}else{delete value[k]}}}}return reviver.call(holder,key,value)}if(/^[\],:{}\s]*$/.test(text.replace(/\\["\\\/bfnrtu]/g,"@").replace(/"[^"\\\n\r]*"|true|false|null|-?\d+(?:\.\d*)?(?:[eE][+\-]?\d+)?/g,"]").replace(/(?:^|:|,)(?:\s*\[)+/g,""))){j=eval("("+text+")");return typeof reviver==="function"?walk({"":j},""):j}throw new SyntaxError("JSON.parse")},quote:quote}}()}

Jemplate.JSON={parse:function(A){return JSON.parse(A)},stringify:function(A){return JSON.stringify(A)}}

}());
...
}

sub json_yui {
    <<'...';
(function(){Jemplate.JSON={parse:function(A){return YAHOO.lang.JSON.parse(A)},stringify:function(A){return YAHOO.lang.JSON.stringify(A)}}}())
...
}

sub json2 {
    <<'...';
if(!JSON){var JSON}if(!JSON){JSON=function(){function f(n){return n<10?"0"+n:n}Date.prototype.toJSON=function(){return this.getUTCFullYear()+"-"+f(this.getUTCMonth()+1)+"-"+f(this.getUTCDate())+"T"+f(this.getUTCHours())+":"+f(this.getUTCMinutes())+":"+f(this.getUTCSeconds())+"Z"};var escapeable=/["\\\x00-\x1f\x7f-\x9f]/g,gap,indent,meta={"\b":"\\b","\t":"\\t","\n":"\\n","\f":"\\f","\r":"\\r",'"':'\\"',"\\":"\\\\"},rep;function quote(string){return escapeable.test(string)?'"'+string.replace(escapeable,function(a){var c=meta[a];if(typeof c==="string"){return c}c=a.charCodeAt();return"\\u00"+Math.floor(c/16).toString(16)+(c%16).toString(16)})+'"':'"'+string+'"'}function str(key,holder){var i,k,v,length,mind=gap,partial,value=holder[key];if(value&&typeof value==="object"&&typeof value.toJSON==="function"){value=value.toJSON(key)}if(typeof rep==="function"){value=rep.call(holder,key,value)}switch(typeof value){case"string":return quote(value);case"number":return isFinite(value)?String(value):"null";case"boolean":case"null":return String(value);case"object":if(!value){return"null"}gap+=indent;partial=[];if(typeof value.length==="number"&&!(value.propertyIsEnumerable("length"))){length=value.length;for(i=0;i<length;i+=1){partial[i]=str(i,value)||"null"}v=partial.length===0?"[]":gap?"[\n"+gap+partial.join(",\n"+gap)+"\n"+mind+"]":"["+partial.join(",")+"]";gap=mind;return v}if(typeof rep==="object"){length=rep.length;for(i=0;i<length;i+=1){k=rep[i];if(typeof k==="string"){v=str(k,value,rep);if(v){partial.push(quote(k)+(gap?": ":":")+v)}}}}else{for(k in value){v=str(k,value,rep);if(v){partial.push(quote(k)+(gap?": ":":")+v)}}}v=partial.length===0?"{}":gap?"{\n"+gap+partial.join(",\n"+gap)+"\n"+mind+"}":"{"+partial.join(",")+"}";gap=mind;return v}return null}return{stringify:function(value,replacer,space){var i;gap="";indent="";if(space){if(typeof space==="number"){for(i=0;i<space;i+=1){indent+=" "}}else{if(typeof space==="string"){indent=space}}}if(!replacer){rep=function(key,value){if(!Object.hasOwnProperty.call(this,key)){return undefined}return value}}else{if(typeof replacer==="function"||(typeof replacer==="object"&&typeof replacer.length==="number")){rep=replacer}else{throw new Error("JSON.stringify")}}return str("",{"":value})},parse:function(text,reviver){var j;function walk(holder,key){var k,v,value=holder[key];if(value&&typeof value==="object"){for(k in value){if(Object.hasOwnProperty.call(value,k)){v=walk(value,k);if(v!==undefined){value[k]=v}else{delete value[k]}}}}return reviver.call(holder,key,value)}if(/^[\],:{}\s]*$/.test(text.replace(/\\["\\\/bfnrtu]/g,"@").replace(/"[^"\\\n\r]*"|true|false|null|-?\d+(?:\.\d*)?(?:[eE][+\-]?\d+)?/g,"]").replace(/(?:^|:|,)(?:\s*\[)+/g,""))){j=eval("("+text+")");return typeof reviver==="function"?walk({"":j},""):j}throw new SyntaxError("JSON.parse")},quote:quote}}()}
...
}

sub xhr_gregory {
    <<'...';
if(window.ActiveXObject&&!window.XMLHttpRequest){window.XMLHttpRequest=function(){var C=new Array("Msxml2.XMLHTTP.5.0","Msxml2.XMLHTTP.4.0","Msxml2.XMLHTTP.3.0","Msxml2.XMLHTTP","Microsoft.XMLHTTP");for(var A=0;A<C.length;A++){try{return new ActiveXObject(C[A])}catch(B){}}return null}}if(window.opera&&!window.XMLHttpRequest){window.XMLHttpRequest=function(){this.readyState=0;this.status=0;this.statusText="";this._headers=[];this._aborted=false;this._async=true;this._defaultCharset="ISO-8859-1";this._getCharset=function(){var B=_defaultCharset;var A=this.getResponseHeader("Content-type").toUpperCase();val=A.indexOf("CHARSET=");if(val!=-1){B=A.substring(val)}val=B.indexOf(";");if(val!=-1){B=B.substring(0,val)}val=B.indexOf(",");if(val!=-1){B=B.substring(0,val)}return B};this.abort=function(){this._aborted=true};this.getAllResponseHeaders=function(){return this.getAllResponseHeader("*")};this.getAllResponseHeader=function(C){var A="";for(var B=0;B<this._headers.length;B++){if(C=="*"||this._headers[B].h==C){A+=this._headers[B].h+": "+this._headers[B].v+"\n"}}return A};this.getResponseHeader=function(C){var A=getAllResponseHeader(C);var B=A.indexOf("\n");if(B!=-1){A=A.substring(0,B)}return A};this.setRequestHeader=function(B,A){this._headers[this._headers.length]={h:B,v:A}};this.open=function(E,C,D,A,B){this.method=E;this.url=C;this._async=true;this._aborted=false;this._headers=[];if(arguments.length>=3){this._async=D}if(arguments.length>3){opera.postError("XMLHttpRequest.open() - user/password not supported")}this.readyState=1;if(this.onreadystatechange){this.onreadystatechange()}};this.send=function(A){if(!navigator.javaEnabled()){alert("XMLHttpRequest.send() - Java must be installed and enabled.");return }if(this._async){setTimeout(this._sendasync,0,this,A)}else{this._sendsync(A)}};this._sendasync=function(A,B){if(!A._aborted){A._sendsync(B)}};this._sendsync=function(Q){this.readyState=2;if(this.onreadystatechange){this.onreadystatechange()}var F=new java.net.URL(new java.net.URL(window.location.href),this.url);var I=F.openConnection();for(var O=0;O<this._headers.length;O++){I.setRequestProperty(this._headers[O].h,this._headers[O].v)}this._headers=[];if(this.method=="POST"){I.setDoOutput(true);var B=new java.io.OutputStreamWriter(I.getOutputStream(),this._getCharset());B.write(Q);B.flush();B.close()}var L=false;var J=false;var E=false;var C=false;var H=false;var P=false;for(var O=0;;O++){var N=I.getHeaderFieldKey(O);var K=I.getHeaderField(O);if(N==null&&K==null){break}if(N!=null){this._headers[this._headers.length]={h:N,v:K};switch(N.toLowerCase()){case"content-encoding":L=true;break;case"content-length":J=true;break;case"content-type":E=true;break;case"date":C=true;break;case"expires":H=true;break;case"last-modified":P=true;break}}}var R;R=I.getContentEncoding();if(R!=null&&!L){this._headers[this._headers.length]={h:"Content-encoding",v:R}}R=I.getContentLength();if(R!=-1&&!J){this._headers[this._headers.length]={h:"Content-length",v:R}}R=I.getContentType();if(R!=null&&!E){this._headers[this._headers.length]={h:"Content-type",v:R}}R=I.getDate();if(R!=0&&!C){this._headers[this._headers.length]={h:"Date",v:(new Date(R)).toUTCString()}}R=I.getExpiration();if(R!=0&&!H){this._headers[this._headers.length]={h:"Expires",v:(new Date(R)).toUTCString()}}R=I.getLastModified();if(R!=0&&!P){this._headers[this._headers.length]={h:"Last-modified",v:(new Date(R)).toUTCString()}}var D="";var G=I.getInputStream();if(G){var A=new java.io.BufferedReader(new java.io.InputStreamReader(G,this._getCharset()));var M;while((M=A.readLine())!=null){if(this.readyState==2){this.readyState=3;if(this.onreadystatechange){this.onreadystatechange()}}D+=M+"\n"}A.close();this.status=200;this.statusText="OK";this.responseText=D;this.readyState=4;if(this.onreadystatechange){this.onreadystatechange()}if(this.onload){this.onload()}}else{this.status=404;this.statusText="Not Found";this.responseText="";this.readyState=4;if(this.onreadystatechange){this.onreadystatechange()}if(this.onerror){this.onerror()}}}}}if(!window.ActiveXObject&&window.XMLHttpRequest){window.ActiveXObject=function(A){switch(A.toLowerCase()){case"microsoft.xmlhttp":case"msxml2.xmlhttp":case"msxml2.xmlhttp.3.0":case"msxml2.xmlhttp.4.0":case"msxml2.xmlhttp.5.0":return new XMLHttpRequest()}return null}}
...
}

sub xhr_ilinsky {
    <<'...';
(function(){var D=window.XMLHttpRequest;var H=!!window.controllers,E=window.document.all&&!window.opera;function C(){this._object=D?new D:new window.ActiveXObject("Microsoft.XMLHTTP")}if(H&&D.wrapped){C.wrapped=D.wrapped}C.UNSENT=0;C.OPENED=1;C.HEADERS_RECEIVED=2;C.LOADING=3;C.DONE=4;C.prototype.readyState=C.UNSENT;C.prototype.responseText="";C.prototype.responseXML=null;C.prototype.status=0;C.prototype.statusText="";C.prototype.onreadystatechange=null;C.onreadystatechange=null;C.onopen=null;C.onsend=null;C.onabort=null;C.prototype.open=function(L,O,K,P,J){this._async=K;var N=this,M=this.readyState;if(E){var I=function(){if(N._object.readyState!=C.DONE){A(N)}};if(K){window.attachEvent("onunload",I)}}this._object.onreadystatechange=function(){if(H&&!K){return }N.readyState=N._object.readyState;G(N);if(N._aborted){N.readyState=C.UNSENT;return }if(N.readyState==C.DONE){A(N);if(E&&K){window.detachEvent("onunload",I)}}if(M!=N.readyState){F(N)}M=N.readyState};if(C.onopen){C.onopen.apply(this,arguments)}this._object.open(L,O,K,P,J);if(!K&&H){this.readyState=C.OPENED;F(this)}};C.prototype.send=function(I){if(C.onsend){C.onsend.apply(this,arguments)}if(I&&I.nodeType){I=window.XMLSerializer?new window.XMLSerializer().serializeToString(I):I.xml;if(!this._headers["Content-Type"]){this._object.setRequestHeader("Content-Type","application/xml")}}this._object.send(I);if(H&&!this._async){this.readyState=C.OPENED;G(this);while(this.readyState<C.DONE){this.readyState++;F(this);if(this._aborted){return }}}};C.prototype.abort=function(){if(C.onabort){C.onabort.apply(this,arguments)}if(this.readyState>C.UNSENT){this._aborted=true}this._object.abort();A(this)};C.prototype.getAllResponseHeaders=function(){return this._object.getAllResponseHeaders()};C.prototype.getResponseHeader=function(I){return this._object.getResponseHeader(I)};C.prototype.setRequestHeader=function(I,J){if(!this._headers){this._headers={}}this._headers[I]=J;return this._object.setRequestHeader(I,J)};C.prototype.toString=function(){return"[object XMLHttpRequest]"};C.toString=function(){return"[XMLHttpRequest]"};function F(I){if(I.onreadystatechange){I.onreadystatechange.apply(I)}if(C.onreadystatechange){C.onreadystatechange.apply(I)}}function B(J){var I=J.responseXML;if(E&&I&&!I.documentElement&&J.getResponseHeader("Content-Type").match(/[^\/]+\/[^\+]+\+xml/)){I=new ActiveXObject("Microsoft.XMLDOM");I.loadXML(J.responseText)}if(I){if((E&&I.parseError!=0)||(I.documentElement&&I.documentElement.tagName=="parsererror")){return null}}return I}function G(I){try{I.responseText=I._object.responseText}catch(J){}try{I.responseXML=B(I._object)}catch(J){}try{I.status=I._object.status}catch(J){}try{I.statusText=I._object.statusText}catch(J){}}function A(I){I._object.onreadystatechange=new window.Function;delete I._headers}if(!window.Function.prototype.apply){window.Function.prototype.apply=function(I,J){if(!J){J=[]}I.__func=this;I.__func(J[0],J[1],J[2],J[3],J[4]);delete I.__func}}window.XMLHttpRequest=C})()
...
}

sub xxx {
    <<'...';
function XXX(A){if(!confirm(A)){throw ("terminated...")}return A}function JJJ(A){return XXX(JSON.stringify(A))}
...
}

1;

=head1 NAME

Jemplate::Runtime - Perl Module containing the Jemplate JavaScript Runtime

=head1 SYNOPSIS

    use Jemplate::Runtime;
    print Jemplate::Runtime->main;

=head1 DESCRIPTION

This module is auto-generated and used internally by Jemplate. It
contains subroutines that simply return various parts of the Jemplate
JavaScript Runtime code.

=head1 METHODS

head2 kernel

head2 ajax_jquery

head2 ajax_xhr

head2 ajax_yui

head2 json_json2

head2 json_yui

head2 json2

head2 xhr_gregory

head2 xhr_ilinsky

head2 xxx

=head1 COPYRIGHT

Copyright (c) 2008. Ingy döt Net.

This program is free software; you can redistribute it and/or modify it
under the same terms as Perl itself.

See L<http://www.perl.com/perl/misc/Artistic.html>

=cut
