require 'rails_helper'

RSpec.describe "people/edit", type: :view do
  let(:person) { create(:person, first_name: 'Russell', last_name: 'Crowe') }

  before(:each) do
    @person = assign(:person, person)
  end

  it "renders the edit person form" do
    render

    assert_select "form[action=?][method=?]", person_path(@person), "post" do
      assert_select "input[name=?]", "person[first_name]"
      assert_select "input[name=?]", "person[last_name]"
    end
  end
end
