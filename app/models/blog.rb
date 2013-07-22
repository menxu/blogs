class Blog < ActiveRecord::Base
  CONTEXT_TYPE = {
    'ContentTypeText'  => 'ContentTypeText',
    'ContentTypeImage' => 'ContentTypeText',
    'ContentTypeAudio' => 'ContentTypeAudio',
    'ContentTypeVideo' => 'ContentTypeVideo',
    'ContentTypeOther' => 'ContentTypeOther'
  }

  attr_accessible :category_id, :user_id, :id, :title, :content, :context_type, :image_url

  belongs_to :user
  belongs_to :category

  validates :user,    :presence  => true
  validates :category,:presence  => true
  validates :context_type, 
    :inclusion => { 
      :in => [
        'ContentTypeText',
        'ContentTypeImage',
        'ContentTypeAudio',
        'ContentTypeVideo',
        'ContentTypeOther'
      ] 
    }
  mount_uploader :image_url, BlogImageUrlUploader

  # has_many :comments, :dependent => :destory
  has_many :comments, :dependent => :destroy
  
  def to_hash
    return {
      :id             => self.id,
      :title          => self.title,
      :content        => self.content,
      :comment_count  => self.comments.count,
      :context_type   => self.context_type,
      :image_url      => self.image_url,
      :created_time   => self.created_at.to_i,
      :updated_time   => self.updated_at.to_i,
      
      :creator => {
        :user_id     => self.user.id.to_i,
        :user_name   => self.user.username,
        :user_avatar => self.user.avatar
      },

      :category => {
        :category_id    => self.category.id,
        :category_name  => self.category.name
      }
   }
  end
end
# 06-09 17:26:17.289: I/System.out(3328): avatar   =   http://192.168.1.14:3000/uploads/user/avatar/1/BusanSkyline_EN-US11706692536_1366x768.jpg
# 06-09 17:35:46.799: I/System.out(3440): /mnt/sdcard/blog/search_history/search_list.txt

# "user_avatar":{"avatar":{"url":"/uploads/user/avatar/1/BusanSkyline_EN-US1170669
# 2536_1366x768.jpg"}}},

# - (void)viewDidLoad
# {
#     [super viewDidLoad];
#   // Do any additional setup after loading the view, typically from a nib.
    
#     //启动BMKMapManager
#     _mapManager = [[BMKMapManager alloc]init];
#     BOOL ret = [_mapManager start:@"2772BD5CAFF652491F65707D6D5E9ABEBF3639CC" generalDelegate:self];
#     if (!ret) {
#         NSLog(@"manager start failed!");
#     }
    
#     //创建一张百度地图
#     BMKMapView* mapView = [[BMKMapView alloc]initWithFrame:CGRectMake(0, 0, 320, 480)];
#     [mapView setShowsUserLocation:YES];               //开启定位功能
#     mapView.delegate = self;




# - (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
# {
#     self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
#     if (self) {
       
#         _mapManager = [[BMKMapManager alloc]init];
#         // 如果要关注网络及授权验证事件,请设定 generalDelegate 参数
#         [_mapManager start:@"708BAA2A8CCF60D4D422D348371881F72A0FC020" generalDelegate:nil];
#         BMKMapView *mapView=[[BMKMapView alloc] initWithFrame:CGRectMake(0, 44, 320, 440)];
#         [self.view addSubview:mapView];

#     }
#     return self;
# }
