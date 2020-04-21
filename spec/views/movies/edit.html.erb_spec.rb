require 'rails_helper'

RSpec.describe "movies/edit", type: :view do
  let(:movie) { create(:movie) }

  before(:each) do
    @movie = assign(:movie, movie)
  end

  it "renders the edit movie form" do
    render

    assert_select "form[action=?][method=?]", movie_path(@movie), "post" do

      assert_select "input#movie_title[name=?]", "movie[title]"
      assert_select "input#movie_release_year[name=?]", "movie[release_year]"
    end
  end
end
