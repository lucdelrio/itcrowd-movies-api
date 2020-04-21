require 'rails_helper'

RSpec.describe "people/index", type: :view do
  let(:person_one) { create(:person, first_name: 'Russell', last_name: 'Crowe') }
  let(:person_two) { create(:person, first_name: 'Russell', last_name: 'Crowe') }

  before(:each) do
    assign(:people, [ person_one, person_two ])
  end

  it "renders a list of people" do
    render
    assert_select "tr>td", :text => "Russell".to_s, :count => 2
    assert_select "tr>td", :text => "Crowe".to_s, :count => 2
  end
end
