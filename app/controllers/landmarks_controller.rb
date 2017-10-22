class LandmarksController < ApplicationController

  set :views, Proc.new { File.join(root, "../views/") }

  get '/landmarks/new' do
    erb :'/landmarks/new'
  end

  post '/landmarks' do
    landmark = Landmark.create(name: params[:landmark][:name], year_completed: params[:landmark][:year_completed])
    redirect to '/landmarks'
  end

  get '/landmarks' do
    @landmarks = Landmark.all
    erb :'/landmarks/index'
  end

  get '/landmarks/:id' do
    @landmark = Landmark.find(params[:id])
    erb :'/landmarks/show'
  end

  get '/landmarks/:id/edit' do
    @landmark = Landmark.find(params[:id])
    erb :'/landmarks/edit'
  end

  patch '/landmarks/:id' do
    @landmark = Landmark.find(params[:id])
    @landmark.name = params["landmark"]["name"]
    @landmark.year_completed = params["landmark"]["year_completed"]
    @landmark.save
    redirect to "/landmarks/#{@landmark.id}"
  end
end
