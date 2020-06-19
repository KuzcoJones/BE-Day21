class TagsController < ApplicationController
  def create

  end

  def show
  end

  def index
    tags = Tag.all
    render json: tags.to_json(
      :only => [:id, :title]
    )
  end
end
