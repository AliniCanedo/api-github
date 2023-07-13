class RepositoriesController < ApplicationController
  before_action :repository, only: %i[show update]

  def index
    @repositories = Repository.all
  end

  def show;  end

  def create
    result = ::Repositories::QueryRepositories.new(payload: params).call
  
    if result[:status] == 200
      create_repositories(result)
      flash[:notice] = "Lista atualizada com sucesso!"
      redirect_to repositories_path
    else
      render json: { status: :unprocessable_entity }
    end
  end

  def update
    @repository.favorite == false ? @repository.update(favorite: true) : @repository.update(favorite: false)

    redirect_to repository_path(@repository)
  end

  private

  def repository
    @repository = Repository.find(params[:id])
  end

  def create_repositories(result)
    repositories = []
    result[:body]['items'].each do |item|
      data = {
        name: item['name'],
        owner: item['owner']['id'],
        language: item['full_name'],
        stars: nil,
        forks: item['fork']
      }
      repository = Repository.create!(data)
      repositories << repository
    end
    repositories
  end
end
