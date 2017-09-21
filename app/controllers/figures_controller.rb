class FiguresController < ApplicationController
  get '/figures' do
    @figures = Figure.all
    erb :"figures/index"
  end

  post '/figures' do
    #for new figures
    @figure = Figure.create(params[:figure])
    if !params[:landmark].empty?
      @figure.landmarks << Landmark.find_or_create_by(:name => params[:landmark]['name'])
    end

    if !params[:title].empty?
      @figure.titles << Title.find_or_create_by(:name => params[:title]['name'])
    end

    redirect "/figures/#{@figure.id}"
  end

  get '/figures/new' do
    erb :"figures/new"
  end

  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    erb :"figures/show"
  end

  get '/figures/:id/edit' do
    @figure = Figure.find(params[:id])
    erb :"figures/edit"
  end

  patch '/figures/:id/edit' do
    @figure = Figure.find(params[:id])
    @figure.update(params[:figure])
    if !params[:landmark].empty?
      @figure.landmarks << Landmark.find_or_create_by(:name => params[:landmark]['name'])
    end

    if !params[:title].empty?
      @figure.titles << Title.find_or_create_by(:name => params[:title]['name'])
    end
    @figure.save
    redirect "/figures/#{@figure.id}"
  end
end
