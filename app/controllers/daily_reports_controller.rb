class DailyReportsController < ApplicationController
  before_action :set_report, only: [:show, :edit, :update, :destroy]
  def index
    @daily_reports = DailyReport.all
  end

  def new
    @daily_report = DailyReport.new
  end

  def edit
  end

  def show
  end

 def create
   @daily_report = DailyReport.new(report_params)
   if @daily_report.save!
    redirect_to daily_reports_path
   else
    render :new
   end
 end

 def update
  if @daily_report.update(report_params)
    redirect_to daily_reports_path
  else
    render :edit
  end
 end

 def destroy
   if @daily_report.destroy
    redirect_to daily_reports_path
   else
    render :edit
   end
 end

 private

 def set_report
  @daily_report = DailyReport.find(params[:id])
end

def report_params
  params.require(:daily_report).permit(:title, :team, :body, :date)
end
end
