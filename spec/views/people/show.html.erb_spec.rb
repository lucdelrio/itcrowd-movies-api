require 'rails_helper'

RSpec.describe "people/show", type: :view do
  let(:person) { create(:person, first_name: 'Russell', last_name: 'Crowe') }

  before(:each) do
    @person = assign(:person, person)
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Russell/)
    expect(rendered).to match(/Crowe/)
  end
end
