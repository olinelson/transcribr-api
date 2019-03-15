class Api::V1::EpisodesController < ApplicationController
    before_action :find_episode, only: [:update, :show, :destroy]
  def index
    @episodes = Episode.all
    render json: @episodes

  end

  def show
    render json: @episode,  methods: :audio_file_url
   
  end

  def create
   
    @episode = Episode.new(episode_params)
    @episode.audio_file.attach(params[:audio_file])
  
    @episode.save 
   
  end

    


  def destroy
    @episode.delete
  end

  def update
    @episode.update(episode_params)
    if @episode.save
      render json: @episode, status: :accepted
    else
      render json: { errors: @episode.errors.full_messages }, status: :unprocessible_entity
    end
  end


  private

  def find_episode
    @episode = Episode.find(params[:id])
  end

  def episode_params
    params.permit(:name, :length, :podcast_id)
  end
end