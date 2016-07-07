require "rails_helper"

describe ProjectsController do
  describe "GET #show" do
    let!(:project) { FactoryGirl.create(:project) }

    context "with valid id" do
      before { get :show, id: project.id }

      it "renders the show view" do
        expect(response).to render_template :show
      end

      it "has the status code 200" do
        expect(response).to have_http_status 200
      end
    end

    context "with invalid id" do
      before { get :show, id: 99999 }

      it "renders the 404 view" do
        expect(response).to render_template "layouts/404"
      end

      it "has the status code 404" do
        expect(response).to have_http_status 404
      end
    end
  end

  describe "GET #new" do
    context "as logged in user" do
      it "renders the new view" do
        # create a user first
        user = FactoryGirl.create(:user)
        # login the user
        session[:user_id] = user.id

        get :new

        expect(response).to render_template :new
      end
    end

    context "as logged out user" do
      it "redirects to login" do
        get :new

        expect(response).to redirect_to "/login"
      end
    end
  end
end
