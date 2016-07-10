class SubsController < ApplicationController
    before_action :authorized?, only: [:edit, :update]
    before_action :consequences_of_not_logged_in
    def authorized?
      unless self.moderator.id == @current_user.id
        flash[:errors] = "only moderators are only to modify subs"
      end
    end

    def new
      @sub = Sub.new
      render :new
    end

    def edit
      @sub = Sub.find_by_id(params[:id])
      render :edit
    end

    def show
      @sub = Sub.find_by_id(params[:id])
    end

    def create
      new_subbie = Sub.new(sub_params)
      new_subbie.user_id = @current_user.id
      if new_subbie.save
        redirect_to sub_url(new_subbie)
      else
        new_subbie.errors.full_messages
      end
    end

    def update
      subbie = Sub.find_by_id(params[:id])
      subbie.update!(sub_params)
      redirect_to sub_url(subbie)
    end

    private
    def sub_params
      params.require(:sub).permit(:title, :description)
    end
end
