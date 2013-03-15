

pie={};

pie.load = function(func){
  jQuery(function(){
    try{
      func();
    }catch(e){
      conclse.log("PIE: js加载错误 " + e);
    }
  });
}