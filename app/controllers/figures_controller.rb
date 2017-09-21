class FiguresController < ApplicationController
  get '/figures' do
    @figures = Figure.all
    erb :"figures/index"
  end

  post '/figures' do
    #for new figures
    @figure = Figure.create(params)
    redirect "/figures/#{@figure.id}"
  end

  get '/figures/new' do
    erb :"figures/new"
  end

  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    erb :"figures/show"
  end

  post '/figures/:id' do
    #for editing
    @figure = figure.find(params[:id])
    erb :"figures/show"
  end

  get '/figures/:id/edit' do
    @figure = figure.find(parmas[:id])
    erb :"figures/edit"
  end
end
