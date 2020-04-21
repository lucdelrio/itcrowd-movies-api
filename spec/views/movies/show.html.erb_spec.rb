require 'rails_helper'

RSpec.describe "movies/show", type: :view do
  let(:movie) { create(:movie, title: 'Gladiator') }

  before(:each) do
    @movie = assign(:movie, movie)
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Gladiator/)
  end
end
