$ ->
  
  $userData = {
    name:"Sankyu Name",
    account:"sankyu",
    level:1,
    disabled:true
  }

  localStorage.getItem("userData")
  
  jQuery('.get').on 'click', ->
    $localStorage = jQuery('.localStorage')
    $localStorage.html(localStorage.getItem("userData"))

  jQuery('.add').on 'click', ->
    $localStorage = jQuery('.localStorage')
    localStorage.setItem("userData",JSON.stringify($userData))
    $localStorage.html("增加成功")

  jQuery('.remove').on 'click', ->
    localStorage.removeItem("userData")
    $localStorage = jQuery('.localStorage')
    $localStorage.html("删除成功")

  jQuery('.click').on 'click', ->
    localStorage.clear
    $localStorage = jQuery('.localStorage')
    $localStorage.html("已清除")

  jQuery('.parse').on 'click', ->
    $parse = JSON.parse(localStorage.getItem("userData")).name
    $localStorage = jQuery('.localStorage')
    $localStorage.html($parse)

  jQuery(window).on 'load', ->
    window.addEventListener("storage", 
      ((e) -> 
        console.log(e)
        $storage = jQuery('p .storage')
        $storage.html("删除成功")
      ),true)
    localStorage.clear
    localStorage.setItem("userData","storage demo")
    localStorage.setItem("userData", "storge event demo")
  
  # if( window.applicationCache){
  #   //浏览器支持离线应用，在此编写离线应用功能
  # }
    # ...
  
  navigator.geolocation.getCurrentPosition(
    (
      (pos)-> 
        # alert("当前地理位置的纬度： " + pos.coords.latitude)
        # alert("当前地理位置的经度： " + pos.coords.longitude)
        # alert("当前地理经度的精度： " + pos.coords.accuracy)
    )
  )

  navigator.geolocation.watchPosition(
    (
      (pos)->
        # alert("当前地理位置的变化纬度： " + pos.coords.latitude)
        # alert("当前地理位置的变化经度： " + pos.coords.longitude)
        # alert("当前地理经度的变化精度： " + pos.coords.accuracy)
        navigator.geolocation.clearWatch(watchID)
    )
  )

  $mobil = document.getElementsByClassName('mobiletitle')[0]
  if ($mobil.dataset)
    # alert($mobil.dataset.category)
  else
    alert("不支持")
  

