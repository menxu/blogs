# -*- coding: utf-8 -*-
MindpinSidebar::Base.config do
  # example
  # 
  # rule :admin do
  #   nav :students, :name => '学生', :url => '/admin/students' do
  #     controller :'admin/students'
  #     subnav :student_info, :name => '学生信息', :url => '/admin/students/info' do
  #       controller :'admin/student_infos'
  #     end
  #   end
  # end

  # rule [:teacher,:student] do
  #   nav :media_resources, :name => '我的文件夹', :url => '/file' do
  #     controller :media_resources, :except => [:xxx]
  #     controller :file_entities, :only => [:upload]
  #   end
  # end
  rule :blog do
    group :default, :name => '博客功能…' do
      nav :home, :name => '博客首页', :url => '/admin/blogs' do
        controller :'admin/blogs'
      end

      nav :students, :name => '博客管理', :url => '/admin/students' do
        controller :'admin/students'
      end

    end
  end


  rule :admin do
    group :default, :name => '博客资源管理' do
      nav :home, :name => '首页', :url => '/admin' do
        controller :'admin/index'
      end

      nav :categories, :name => '博客分类管理', :url => '/admin/categories' do
        controller :'admin/categories'
      end

      nav :blogs, :name => '博客管理', :url => '/admin/blogs' do
        controller :'admin/blogs'
      end

      nav :comments, :name => '评论管理', :url => '/admin/comments' do
        controller :'admin/comments'
      end

      nav :users, :name => '用户管理管理', :url => '/admin/users' do
        controller :'admin/users'
      end

    end
  end

  # -------------------------
  # 教师
  rule :teacher do
    group :resources, :name => '教师功能…' do

      nav :dashboard, :name => '课程首页', :url => '/dashboard' do
        controller :index, :only => :dashboard
      end

      nav :media_resources, :name => '资源网盘', :url => '/file' do
        subnav :my_resources, :name => '我的文件夹', :url => '/file' do
          controller :media_resources
        end

        subnav :media_shares, :name => '收到的共享', :url => '/media_shares' do
          controller :media_shares
        end

        subnav :public_resources, :name => '公共资源库', :url => '/public_resources' do
          controller :public_resources
        end
      end

      nav :homeworks, :name => '作业', :url => '/homeworks' do
        controller :homeworks
      end

      nav :questions, :name => '问答', :url => '/questions' do
        controller :questions
      end

      nav :course_surveys, :name => '课程调查', :url => '/course_surveys' do
        controller :course_surveys
      end

      nav :announcements, :name => '系统通知', :url => '/announcements' do
        controller :announcements
      end

      nav :comments, :name => '收到的评论', :url => '/comments/received' do
        controller :comments
      end

    end
  end

  # ------------------
  # 学生
  rule :student do
    group :resources, :name => '学生功能…' do

      nav :dashboard, :name => '课程首页', :url => '/dashboard' do
        controller :index, :only => :dashboard
      end

      nav :media_resources, :name => '资源网盘', :url => '/file' do
        subnav :my_resources, :name => '我的文件夹', :url => '/file' do
          controller :media_resources
        end

        subnav :media_shares, :name => '收到的共享', :url => '/media_shares' do
          controller :media_shares
        end

        subnav :public_resources, :name => '公共资源库', :url => '/public_resources' do
          controller :public_resources
        end
      end

      nav :homeworks, :name => '作业', :url => '/homeworks' do
        controller :homeworks
      end

      nav :questions, :name => '问答', :url => '/questions' do
        controller :questions
      end

      nav :course_surveys, :name => '课程调查', :url => '/course_surveys' do
        controller :course_surveys
      end

      nav :announcements, :name => '系统通知', :url => '/announcements' do
        controller :announcements
      end

      nav :comments, :name => '收到的评论', :url => '/comments/received' do
        controller :comments
      end

    end
  end
end
