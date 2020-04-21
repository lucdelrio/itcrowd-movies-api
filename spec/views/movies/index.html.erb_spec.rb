require 'rails_helper'

RSpec.describe "movies/index", type: :view do
  let(:movie) { create(:movie, title: 'Gladiator') }
  let(:second_movie) { create(:movie, title: 'Gladiator') }

  before(:each) do
    assign(:movies, [ movie, second_movie ])
  end

  it "renders a list of movies" do
    render
    assert_select "tr>td", :text => "Gladiator".to_s, :count => 2
  end
end
