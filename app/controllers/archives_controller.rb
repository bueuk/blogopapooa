class ArchivesController < ApplicationController

  def index
    @posts = BlogPost.order(created_at: :desc)
    @posts_by_month = @posts.group_by { |p| p.created_at.beginning_of_month }
  end

end
