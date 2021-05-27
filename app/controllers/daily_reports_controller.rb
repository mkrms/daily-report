class DailyReportsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_report, only: [:show, :edit, :update, :destroy]
  before_action :rate_calc, only: [:show]
  def index
    @daily_reports = current_user.daily_reports.page(params[:page]).per(10).order(date: 'DESC')

    current_user.rate =  1000 + current_user.daily_reports.pluck(:rate).compact.sum
    current_user.save

    @chart = current_user.daily_reports.group(:date).sum(:rate)
  end

  def new
    @daily_report = DailyReport.new
  end

  def edit
  end

  def show
    @comment = Comment.new
    @comments = @daily_report.comments
  end

 def create
  @daily_report = DailyReport.new(report_params)
   @daily_report.user_id = current_user.id
   if @daily_report.save!
    redirect_to @daily_report
   else
    render 'new'
   end
 end

 def update
  if @daily_report.update(report_params)
    redirect_to @daily_report
  else
    render 'edit'
  end
 end

 def destroy
   if @daily_report.destroy
    redirect_to daily_reports_path
   else
    render 'edit'
   end
 end

 private

 def set_report
  @daily_report = DailyReport.find(params[:id])
end

def report_params
  params.require(:daily_report).permit(:title, :team, :body, :date, :username, :winround, :loseround, :tire, :decide)
end

def rate_calc
    if @daily_report.decide == 'win'
    @daily_report.rate = (((@daily_report.winround - @daily_report.loseround)* 10) +100)+(1 / @daily_report.tire * 50)
    elsif @daily_report.decide == 'lose'
      @daily_report.rate = (((@daily_report.loseround - @daily_report.winround)* -10)-100)-(1 / @daily_report.tire * 50)
    else
    @daily_report.rate = 0
    end
  @daily_report.save
end
end
