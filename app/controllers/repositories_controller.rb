class RepositoriesController < ApplicationController
  def index
    @repositories = Repository.all
  end

  def show
  end

  def create
    result = ::Repositories::QueryRepositories.new(payload: params).call
    
    if result[:status] == 200
      create_repositories(result)
      return render json: { status: result[:status], message: 'Repositorios salvos com sucesso!' }
    else
      render json: { status: :unprocessable_entity }
    end
  end

  private 

  def create_repositories(result)
    result[:body]['items'].each do |item|
      data = {
        name: item['name'],
        owner: item['owner']['id'],
        language: item['full_name'],
        stars: nil,
        forks: item['fork']
      }
      Repository.create!(data)
    end
  end
end
