class Supervisor::CommentsController < Supervisor::BaseController

  def index
    find_comments
  end

  def create
    comment = Comment.new(comment_params)
    # Now that we are saving 'checks' without comment text too, we can list them in the view with the text comments.
    # For the user, checks with or without text are treated the same (except for the mailer).
    if can? :supervise, comment.team
      if comment.save
        if comment.text.present?
          CommentMailer.email(comment).deliver_later
        end
      else
        flash[:alert] = "O no! We can't save your text. Please try again?"
      end
    end
  redirect_to supervisor_dashboard_path
  end


private

  def comment_params
    params.require(:comment).permit(:team_id, :text).merge(user_id: current_user.id)
  end

  def find_comments
    @comments = Comment.includes(:team).ordered.page(params[:page])
  end

end