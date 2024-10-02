# frozen_string_literal: true

module ::Decidim::FollowsControllerDecorator
end

::Decidim::FollowsController.class_eval do
  def create
    @form = form(Decidim::FollowForm).from_params(params)
    @inline = params[:follow][:inline] == "true"
    enforce_permission_to :create, :follow

    Decidim::CreateFollow.call(@form, current_user) do
      on(:ok) do
        send_notification
        render :update_button
      end

      on(:invalid) do
        render json: { error: I18n.t("follows.create.error", scope: "decidim") }, status: :unprocessable_entity
      end
    end
  end

  private

  def send_notification
    return if params[:slug].nil? || assembly.nil?

    Decidim::EventsManager.publish(
      event: "decidim.events.follows.created",
      event_class: Decidim::Admin::UserFollowEvent,
      resource: assembly,
      affected_users: admin_users,
      extra: { user: current_user }
    )
  end

  def assembly
    @assembly ||= Decidim::Assembly.find_by(slug: params[:slug], organization: current_organization)
  end

  def admin_users
    Decidim::User.where(admin: true, organization: current_organization)
  end
end
