class TagsController < ApplicationController
  LIMIT = 30

  def show
    tag_name = params[:id]
    @functions = Tag.find_by(name: tag_name).functions
  end

  def index; end
end
