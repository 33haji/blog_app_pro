class AnalysisController < ApplicationController
  def required_time
    # 求めたい'月'を取得
    require "date"
    @year = params[:year].nil? ? Date.today.year : params[:year].to_i
    @month = params[:month].nil? ? Date.today.month : params[:month].to_i
    if @month == 0
      @year = @year - 1
      @month = 12
    elsif @month == 13
      @year = @year + 1
      @month = 1
    end
    
    this_month_works = Work.by_month(@month, year: @year)
    @chart_data = this_month_works.includes(:blog).where(blogs: {delete_flag: FALSE}).pluck(:created_at, :required_time)
  end
end
