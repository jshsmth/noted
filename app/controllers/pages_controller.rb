class PagesController < ApplicationController

  def home
    @artists = MusicAPI.new.displayArtist('frank')
    @albums = MusicAPI.new.displayAlbums('drake')
    @tracks = MusicAPI.new.displayTracks('bush')
  end

  def searchArtist
    # if general search term is provided, search for artist, album, and track
    if params[:searchText]
      @resultsArtist = MusicAPI.new.findArtist(params[:searchText])
      @top_tracks = @resultsArtist.top_tracks(:US).first(4)
      @top_albums = @resultsArtist.albums(limit: 8, country: 'US')

    else
      @resultsArtist = MusicAPI.new.findArtist(params[:id])
      @top_tracks = @resultsArtist.top_tracks(:US).first(4)
      @top_albums = @resultsArtist.albums(limit: 8, country: 'US')
    end
  end

  def searchTrack
    @resultsTrack = MusicAPI.new.findTrack(params[:id])
  end
end
