require 'rails_helper'

RSpec.shared_context 'logged_user' do
  let(:user) { FactoryBot.create(:user) }

  before do
    request.headers.merge! user.create_new_auth_token
  end
end
