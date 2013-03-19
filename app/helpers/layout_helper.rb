# -*- coding: utf-8 -*-
module LayoutHelper
  def page_top_fixed(klass, &block)
    css_class = [klass, 'page-top-fixed'] * ' '
    content_tag :div, :class => css_class, &block
  end

  def page_filled_list(models, options={}, &block)
    options.assert_valid_keys :cols, :class, :length
    cols = options[:cols] || {}
    length = options[:length] || 4

    content_tag :div, :class => ['page-filled-list', options[:class]] do
      items = []
      length.times do |i|
        items << models[i]
      end

      items.map do |model|
        if model.blank?
          page_list_body_empty :cols => cols, :model => EmptyModel.new, &block
        else
          page_list_body :cols => cols, :model => model, &block
        end
      end.reduce(&:+)
    end
  end

  def page_model_list(models, options={}, &block)
    options.assert_valid_keys :cols, :class
    cols = options[:cols] || {}

    content_tag :div, :class => ['page-model-list', options[:class]] do
      if models.blank?
        content_tag :div, '目前列表没有内容', :class => :blank
      else
        models.map do |model|
          page_list_body :cols => cols, :model => model, &block
        end.reduce(&:+)
      end
    end
  end

  def page_buttons
    content_tag :div, :class => :buttons do
      yield HeadWidget.new(self)
    end
  end

  def page_filters(base_url)
    content_tag :div, :class => :filters do
      yield PageFilter.new(self, base_url)
    end
  end

  def page_semester_filters(base_url)
    content_tag :div, :class => 'semester-filters' do
      SemesterFilter.new(self, base_url).semester_filters
    end
  end

  def page_field(css_class, options={}, &block)
    options.assert_valid_keys :title
    content_tag :div, :class => ['page-field', css_class] do
      content_tag(:div, options[:title], :class => 'field-title') +
      content_tag(:div, :class => 'field-data') do
        capture(&block)
      end
    end
  end

  def page_list_head(options={})
    options.assert_valid_keys :cols
    content_tag :div, :class => :cells do
      yield HeadWidget.new(self, options[:cols])
    end
  end

  def page_list_body(options={})
    options.assert_valid_keys :cols, :model
    content_tag :div, :class => :cells do
      yield BodyWidget.new(self, options[:cols], options[:model])
    end
  end

  def page_list_body_empty(options={})
    options.assert_valid_keys :cols, :model
    content_tag :div, :class => :cells do
      yield BodyWidgetEmpty.new(self, options[:cols], options[:model])
    end
  end

  def list_pagination(collection)
    str = content_tag(:span, :class => 'desc') {current_displaying_items_str_for(collection)}
    pagination = will_paginate(collection, :class => 'pagination')
    content_tag(:div, :class => 'paginate-info') {str + pagination}
  end

  def sortable(column, header)
    is_current = is_current_sort?(column)
    param_dir = params[:dir]

    dir       = is_current && param_dir == 'asc' ? 'desc' : 'asc'
    css_class = is_current ? "sortable current #{param_dir}" : 'sortable'
    link_to header, {:sort => column, :dir => dir}, {:class => css_class}
  end

  def _make_span(content, css_class=nil)
    content_tag :span, content, :class => [css_class]
  end

  def is_current_sort?(column)
    column.to_s == params[:sort].to_s
  end

private

  def current_displaying_items_str_for(collection)
    offset = (params[:page] ? params[:page].to_i : 1) * Paginated::PERPAGE
    start  = collection.blank? ? 0 : offset - Paginated::PERPAGE + 1
    total  = collection.all.count
    stop   = offset > total ? total : offset
    "当前显示第#{start}-#{stop}项(共#{total}项)"
    [_make_span('当前显示第'),
     _make_span(start, 'count'),
     _make_span('-第'),
     _make_span(stop, 'count'),
     _make_span('条结果（共'),
     _make_span(total, 'count'),
     _make_span('条结果）')].reduce(&:+)
  end

  class BaseFilter < ActionView::Base
    def initialize(context, base_url, filter_key, options={})
      options.assert_valid_keys :filter_class
      @context = context
      @base_url = base_url
      @filter_key = filter_key
      @filter_class = options[:filter_class] || :filter
    end

    def filter(text, options={})
      css_class = self.is_current_filter?(options) ? :current : nil
      path = "#{@base_url}?#{@filter_key.to_s}=#{options[@filter_key]}"

      link_to text, path, :class => [@filter_class, css_class]
    end

    def is_current_filter?(options={})
      options.assert_valid_keys @filter_key, :default
      options[@filter_key].to_s == @context.params[@filter_key].to_s || is_default_filter?(options[:default])
    end

    private
    def is_default_filter?(default)
      !@context.params[@filter_key] && default ? true : false
    end
  end

  class SemesterFilter < BaseFilter
    def initialize(context, base_url)
      super(context, base_url, :semester, :filter_class => :semester)
    end

    def semester_filters
      Semester.get_recent_semesters.map do |semester|
        is_default = Semester.now == semester
        self.filter(semester.to_s,
                    :semester => semester.value,
                    :default  => is_default)
      end.reduce(&:+)

    end
  end

  class PageFilter < BaseFilter
    def initialize(context, base_url)
      super(context, base_url, :tab)
    end
  end

  class HeadWidget < ActionView::Base
    def initialize(context, cols_hash=nil)
      @context = context
      @cols_hash = cols_hash
    end

    def button(text, path, options={})
      options.assert_valid_keys :class, :'data-model'
      link_to text, path, :class => [:button, options[:class]], :'data-model' => options[:'data-model']
    end

    def cell(attr_name, text, options={})
      options.assert_valid_keys :sortable
      col = @cols_hash[attr_name] ? "col_#{@cols_hash[attr_name]}" : 'col_1'
      content_tag :div, :class => [:cell, col, attr_name.to_s.dasherize] do
        options[:sortable] ? @context.sortable(attr_name, text) : @context._make_span(text)
      end
    end

    def checkbox(options={})
      col = options[:col] ? "col_#{options[:col]}" : 'col_1'
      content_tag :div, :class => [:cell, col, :checkbox] do
        @context.jcheckbox :checkbox, :check, false, ''
      end

    end

    def batch_destroy(model)
      self.button '删除选中项', 'javascript:;', :class => 'batch-destroy', :'data-model' => model.to_s
    end

    # 用于封装使用fbox进行model create的行为逻辑
    def ajax_create_button(name, title, url, &block)
      c1 = @context.jfbox_link name, title

      block_content = @context.capture(&block)

      form_buttons_content = @context.content_tag :div, :class=>'box-buttons' do
        b1 = link_to '确定', 'javascript:;', :class => 'ajax-submit'
        b2 = link_to '取消', 'javascript:;', :class => 'ajax-cancel'
        b1 + b2
      end

      @context.content_for :fbox do
        @context.jfbox name, title do
          @context.form_tag url, :method=>:post do
            block_content + form_buttons_content
          end
        end
      end

      return c1
    end
  end

  class BodyWidget < ActionView::Base
    attr_reader :model

    def initialize(context, cols_hash, model=nil)
      @context   = context
      @cols_hash = cols_hash
      @model     = model
    end

    def cell(*args, &block)
      attr_name = args.first

      if block_given?
        options = args.second || {}
        content = @context.capture(&block)
      else
        text = args.second
        content = @context._make_span(text)
        options = args.third || {}
      end

      col = @cols_hash[attr_name] ? "col_#{@cols_hash[attr_name]}" : 'col_1'

      content_tag :div, content, :class => [:cell, col, attr_name.to_s.dasherize]
    end

    def checkbox(model, options={})
      col = options[:col] ? "col_#{options[:col]}" : 'col_1'
      content_tag :div, :class => [:cell, col, :checkbox], :'data-model-id' => model.id do
        @context.jcheckbox :checkbox, :check, false, ''
      end

    end
  end

  class BodyWidgetEmpty < BodyWidget
    def cell(*args, &block)
      attr_name = args.first
      col = @cols_hash[attr_name] ? "col_#{@cols_hash[attr_name]}" : 'col_1'
      content_tag :div, '', :class => [:cell, col, attr_name.to_s.dasherize]
    end
  end

  class EmptyModel
    def method_missing(name)
      return '-'
    end
  end

end
