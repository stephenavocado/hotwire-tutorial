module Discussions
  class PostsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_discussion

    def create
      @post = @discussion.posts.new(post_params)

      respond_to do |format|
        if @post.save
          format.html { redirect_to discussion_path(@discussion), notice: "Post created" }
        else
          format.turbo_stream
          #create.turbo_stream.erb
          format.html { render :new, status: :unprocessable_entity }
        end
      end
    end

    private

    def post_params
      params.require(:post).permit(:body)
    end

    def set_discussion
      @discussion = Discussion.find(params[:discussion_id])
    end

  end
end