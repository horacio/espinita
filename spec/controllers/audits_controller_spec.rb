require 'spec_helper'

class AuditsController < ActionController::Base
  def audit
    @general_model = create(:general_model)

    render nothing: true
  end

  def update_user
    current_user.update_attributes(password: 'foo')

    render nothing: true
  end

  private

  attr_accessor :custom_user
end


describe AuditsController, type: :controller do
  before :each do
    GeneralModel.auditable
  end

  let(:general_model) { create(:general_model) }
  let(:user ) { create(:user) }

  describe "POST audit" do
    it "should audit user" do
      AuditsController.send(:define_method, 'current_user=') do |user|
        self.instance_variable_set("@current_user", user)
      end

      AuditsController.send(:define_method, 'current_user') do
        self.instance_variable_get("@current_user")
      end

      controller.send(:current_user=, user)

      expect { post :audit }.to change(Espinita::Audit, :count)

      expect(assigns(:general_model).audits.last.user).to be == user
      expect(assigns(:general_model).audits.last.remote_address).to be == "0.0.0.0"
    end

    it "should audit without current_user defined" do
      expect { post :audit }.to change(Espinita::Audit, :count)

      expect(assigns(:general_model).audits.last.user).to be == nil
      expect(assigns(:general_model).audits.last.remote_address).to be == "0.0.0.0"
    end
  end
end
