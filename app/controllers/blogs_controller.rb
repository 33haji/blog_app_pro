class BlogsController < ApplicationController
  before_action :set_blog, only: %w(edit update delete)
  
  def index
    @q = Blog.ransack(params[:q])
    blogs = @q.result
    
    # "削除されたBlogを表示しない"にチェックが入っている場合(or 'q'がnilの場合)
    if params[:q].nil? || params[:q][:delete_flag_check] == 'true'
      blogs = blogs.where(delete_flag: false)
    end
  
    # 作業時間のチェック
    if !params[:q].nil? && !params[:q][:work][:condition].empty? && !params[:q][:work][:required_time_form].empty?
      if params[:q][:work][:condition] == '1'
        ids = Work.where(required_time: params[:q][:work][:required_time_form]).select(:blog_id)
      elsif params[:q][:work][:condition] == '2'
        ids = Work.where("required_time > ?", params[:q][:work][:required_time_form]).select(:blog_id)
      elsif params[:q][:work][:condition] == '3'
        ids = Work.where("required_time < ?", params[:q][:work][:required_time_form]).select(:blog_id)
      end
      blogs = blogs.where(id: ids)
    end
    
    @works = Work.all
    @blogs = blogs.page(params[:page]).order(created_at: :desc)
  end
  
  def new
    @blog = Blog.new
    @blog.build_work
  end
  
  def create
    @blog = Blog.new(blog_params)
    if @blog.save
      redirect_to blogs_path
    else
      render 'new'
    end
  end
  
  def show
    @blog = Blog.find(params[:id])
  end
  
  def edit
  end
  
  def update
    if @blog.update(update_blog_params)
      redirect_to blogs_path
    else
      render 'edit'
    end
  end
  
  def delete
    if @blog.update_attribute(:delete_flag, true)
      redirect_to blogs_path
    else
      redirect_to blogs_path, alert: '削除に失敗しました'
    end
  end
  
  private

    def blog_params
      params.require(:blog).permit(:title, :body, :image, :image_cache, :remove_image, work_attributes: [:required_time])
    end
    
    def update_blog_params
      params.require(:blog).permit(:title, :body, :image, :image_cache, :remove_image, work_attributes: [:required_time, :id])
    end
    
    def set_blog
        @blog = Blog.find(params[:id])
    end
end