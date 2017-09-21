class LandmarksController < ApplicationController

  get '/landmarks' do
    @landmarks = Landmark.all
    erb :"landmarks/index"
  end

  post '/landmarks' do
    #for new landmarks
    @landmark = Landmark.create(params)
    redirect "/landmarks/#{@landmark.id}"
  end

  get '/landmarks/new' do
    erb :"landmarks/new"
  end

  get '/landmarks/:id' do
    @landmark = Landmark.find(params[:id])
    erb :"landmarks/show"
  end

  post '/landmarks/:id' do
    #for editing
    @landmark = Landmark.find(params[:id])
    erb :"landmarks/show"
  end

  get '/landmarks/:id/edit' do
    @landmark = Landmark.find(parmas[:id])
    erb :"landmarks/edit"
  end
end
