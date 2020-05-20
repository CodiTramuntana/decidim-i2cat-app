# frozen_string_literal: true

module Decidim
  module Assemblies
    module Admin
      # Controller that allows managing assembly followers.
      #
      class AssemblyFollowersController < Decidim::Assemblies::Admin::ApplicationController
        include Concerns::AssemblyAdmin
        layout "decidim/admin/assembly"

        def index
          @followers = Decidim::Assembly.find_by(
            slug: permitted_params[:assembly_slug],
            organization: current_organization
          ).followers
        end
      end
    end
  end
end
