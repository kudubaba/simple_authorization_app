require "rails_helper"

RSpec.describe UsersController, :type => :controller do
  describe "Get #new" do
    before { get :new }

    it { should render_template('new') }
    it { should route(:get, '/users/new').to(action: :new)}
    it "assigns @user" do
      expect(assigns(:user)).to be_kind_of(User)
    end
  end    
end
