class Api::CategoryListsController < ApplicationController
  before_filter :login_required

  def pull
    render(:json => Category.all.as_json )
  end
end

# 06-14 16:02:27.559: I/System.out(12204): category pull response_text= 
# [
#   {
#     "created_at":"2013-04-12T15:48:45+08:00",
#     "id":1,
#     "level":1,
#     "name":"\u56fe\u7247\u96c6\u5408",
#     "updated_at":"2013-04-12T15:48:45+08:00"
#   },

#   {
#     "created_at":"2013-05-08T17:22:27+08:00",
#     "id":2,
#     "level":2,
#     "name":"\u5728IOS\u4e0a\u53ef\u4ee5\u7b2c\u4e00\u6b21\u663e\u793a",
#     "updated_at":"2013-05-08T17:22:27+08:00"
#   },

#   {
#     "created_at":"2013-05-08T17:22:50+08:00",
#     "id":3,
#     "level":3,
#     "name":"\u589e\u52a0\u4e00\u4e9b\u4f7f\u7528\u7684\u4e1c\u897f\u770b\u770b",
#     "updated_at":"2013-05-08T17:22:50+08:00"
#   },

#   {
#     "created_at":"2013-05-08T17:23:15+08:00",
#     "id":4,
#     "level":5,
#     "name":"\u81f4\u9752\u6625\u7684\u6545\u4e8b\u60c5\u8282\u5206\u4eab",
#     "updated_at":"2013-05-08T17:23:15+08:00"
#   },

#   {
#     "created_at":"2013-05-08T17:23:36+08:00",
#     "id":5,
#     "level":4,
#     "name":"\u94a2\u94c1\u4fa03 \u7684 \u4e2d\u56fd\u4e4b\u65c5",
#     "updated_at":"2013-05-08T17:23:36+08:00"
#   }
# ]
