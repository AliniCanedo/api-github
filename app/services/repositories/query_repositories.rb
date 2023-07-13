class Repositories::QueryRepositories < ApplicationService
  def initialize(options)
    @options = options
  end

  def call
    ::Repositories::Api.new(@options).repositories    
  end
end
