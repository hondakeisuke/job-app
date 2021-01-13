require 'rails_helper'

RSpec.describe "ユーザーログイン機能", type: :system do
  it 'ログインに成功し、トップページに遷移する' do
    @user = FactoryBot.create(:user)
    visit  new_user_session_path
    expect(current_path).to eq new_user_session_path
    fill_in 'user_email', with: @user.email
    fill_in 'user_password', with: @user.password
    click_on("Log in")
    expect(current_path).to eq root_path
  end

end
