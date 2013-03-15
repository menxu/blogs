# encoding: utf-8
class Api::BlogListsController < ApplicationController
  before_filter :login_required

  def pull
    print "pull  blog_lists"
    render :json => {
      :blog_lists => Blog.all.as_json
    }
  end

end

# {"blog_lists":
#   [{
#     "category_id":4,
#     "content":"ca5mpfiu5efa684\\u7801 ",
#     "created_at":"2012-12-12T02:01:14Z",
#     "id":1,
#     "title":"\u6587\u4ef6\u548c\u76ee\u5f55 - linux",
#     "updated_at":"2012-12-12T02:01:14Z",
#     "user_id":6},

#     {"category_id":4,"content":"\u5173\u673a (\u7cfb\u7edf\u7684\u5173\u673a\u3001\u91cd\u542f\u4ee5\u53ca\u767b\u51fa ) \r\nshutdown -h now \u5173\u95ed\u7cfb\u7edf(1) \r\ninit 0 \u5173\u95ed\u7cfb\u7edf(2) \r\ntelinit 0 \u5173\u95ed\u7cfb\u7edf(3) \r\nshutdown -h hours:minutes & \u6309\u9884\u5b9a\u65f6\u95f4\u5173\u95ed\u7cfb\u7edf \r\nshutdown -c \u53d6\u6d88\u6309\u9884\u5b9a\u65f6\u95f4\u5173\u95ed\u7cfb\u7edf \r\nshutdown -r now \u91cd\u542f(1) \r\nreboot \u91cd\u542f(2) \r\nlogout \u6ce8\u9500 ","created_at":"2012-12-12T02:02:50Z","id":2,"title":"\u5173\u673a (\u7cfb\u7edf\u7684\u5173\u673a\u3001\u91cd\u542f\u4ee5\u53ca\u767b\u51fa ) ","updated_at":"2012-12-12T02:02:50Z","user_id":6},{"category_id":1,"content":"\u4e0b\u4e2a\u624b\u673a\u52a9\u624b\u3002\r\n\u8ffd\u95ee\r\n\u80fd\u6e05\u7406\u6b8b\u4f59\u6587\u4ef6\u5939\u4e48\uff1f\r\n\u56de\u7b54\r\n\u6709\u6587\u4ef6\u7ba1\u7406\u7684\uff0c\u76f4\u63a5\u5220\u6389\u4f60\u4e0b\u7684\u5b89\u88c5\u5305\u3002\r\n\u8ffd\u95ee\r\n\u5b89\u88c5\u5305\u6211\u77e5\u9053\uff0c\u4f46\u662f\u6bcf\u5b89\u88c5\u4e00\u4e2a\u7a0b\u5e8f\u90fd\u4f1a\u751f\u6210\u90a3\u4e2a\u6587\u4ef6\u5939\uff0c\u5378\u8f7d\u540e\u6587\u4ef6\u5939\u8fd8\u5728\uff0c\u6bcf\u6b21\u90fd\u8981\u624b\u52a8\u5220\u9664\uff0c\u6709\u6ca1\u6709\u4ec0\u4e48\u529e\u6cd5\u80fd\u5378\u8f7d\u7684\u65f6\u5019\u628a\u6587\u4ef6\u5939\u4e5f\u4e00\u8d77\u5220\u
