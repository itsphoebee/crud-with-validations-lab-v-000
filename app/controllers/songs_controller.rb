class SongsController < ApplicationController
  
  def index
    @songs = Song.all
  end
  
  def new
    @song = Song.new
  end

  def create
    @song = Song.create(song_params)
    if @song.valid?
      redirect_to song_path(@song)
    else
      render :new
    end
  end

  private

  def song_params
    
  end

  
end
