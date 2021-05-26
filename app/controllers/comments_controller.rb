class CommentsController < ApplicationController
    def create
        @daily_report = DailyReport.find(params[:daily_report_id])
        @comment = Comment.new(comment_params)

        if @comment.save!
        redirect_back(fallback_location: root_path)
        else
        redirect_back(fallback_location: root_path)
        end
    end

    def destroy
        @comment = Comment.find(params[:id])
        if @comment.destroy
            redirect_back(fallback_location: root_path)       
        else
            redirect_back(fallback_location: root_path)       
        end
    end

    private
    def comment_params
        params.require(:comment).permit(:comment_content, :daily_report_id, :comment_name) 
    end
end
