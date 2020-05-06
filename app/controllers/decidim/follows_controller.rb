# frozen_string_literal: true

module Decidim
  class FollowsController < Decidim::ApplicationController
    include FormFactory
    before_action :authenticate_user!
    helper_method :resource

    def destroy
      @form = form(Decidim::FollowForm).from_params(params)
      @inline = params[:follow][:inline] == "true"
      enforce_permission_to :delete, :follow, follow: @form.follow

      DeleteFollow.call(@form, current_user) do
        on(:ok) do
          render :update_button
        end

        on(:invalid) do
          render json: { error: I18n.t("follows.destroy.error", scope: "decidim") }, status: :unprocessable_entity
        end
      end
    end

    def create
      @form = form(Decidim::FollowForm).from_params(params)
      @inline = params[:follow][:inline] == "true"
      enforce_permission_to :create, :follow

      CreateFollow.call(@form, current_user) do
        on(:ok) do
          render :update_button
          send_notification
        end

        on(:invalid) do
          render json: { error: I18n.t("follows.create.error", scope: "decidim") }, status: :unprocessable_entity
        end
      end
    end

    def resource
      @resource ||= GlobalID::Locator.locate_signed(
        params[:follow][:followable_gid]
      )
    end

    def send_notification
      Decidim::EventsManager.publish(
        event: "decidim.events.follows.created",
        event_class: Decidim::Admin::UserFollowEvent,
        resource: Decidim::Assembly.find_by(slug: params[:slug], organization: current_organization),
        affected_users: Decidim::User.where(admin: true, organization: current_organization),
        followers: Decidim::User.where(admin: true, organization: current_organization)
      )
    end
  end
end
