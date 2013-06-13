

pie={};

pie.load = function(func){
  jQuery(function(){
    try{
      func();
    }catch(e){
      console.log("PIE: js加载错误 " + e);
    }
  });
}