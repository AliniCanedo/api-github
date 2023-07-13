require 'rails_helper'

RSpec.feature "Repositories", type: :feature do
  scenario '#INDEX' do
    repository = FactoryBot.create(:repository)

    visit repositories_path

    expect(page).to have_content("Consulta de repositorios do GITHUB")
    expect(page).to have_content("Consulte e favorite seus repositorios do github.")
    expect(page).to have_button("Consultar repositórios", class: "btn btn-info")
    expect(page).to have_link("ver detalhes", href: repository_path(repository), class: "btn btn-primary")
  end

  scenario "SHOW" do
    repository = FactoryBot.create(:repository)

    visit repository_path(repository)

    expect(page).to have_content("Detalhes do repositório")
    expect(page).to have_content("Forks: #{repository.forks}")
    expect(page).to have_content("Language: #{repository.language}")
  end  
end
