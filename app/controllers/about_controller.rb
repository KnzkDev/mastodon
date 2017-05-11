# frozen_string_literal: true

class AboutController < ApplicationController
  before_action :set_body_classes
  before_action :set_instance_presenter, only: [:show, :more]
  before_action :set_explaine

  def show; end

  def more; end

  def terms; end

  private
  def new_user
    User.new.tap(&:build_account)
  end
  helper_method :new_user
  def set_instance_presenter

    @instance_presenter = InstancePresenter.new
  end

  def set_body_classes
    @body_classes = 'about-body'
  end

  Dotenv.load
  def set_explaine
    jsonArray = ENV['EXPLAINE']
    if(jsonArray != nil)
      @explaine = JSON.parse(jsonArray)
    end
  end

  def terms # terms_url　にしてもだめ
     redirect_to ENV['PRIVACY_POLICY_PATH'];
  end
  # helper_method :terms_url
end
