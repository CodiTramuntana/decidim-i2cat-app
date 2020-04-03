# frozen_string_literal: true

Decidim::Devise::RegistrationsController.class_eval do
  prepend_before_action :check_captcha, only: [:create]

  def check_captcha
    unless verify_recaptcha
      @form = form(::Decidim::RegistrationForm).from_params(params[:user])
      unless @form.valid?
        flash.now[:alert] = @form.errors[:base].join(", ") if @form.errors[:base].any?
        respond_with_navigational(@form) { render :new }
      end
    end
  end

end
