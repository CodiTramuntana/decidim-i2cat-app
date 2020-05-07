# frozen_string_literal: true

module Decidim
  module Admin
    class UserFollowEvent < Decidim::Events::SimpleEvent
      i18n_attributes :resource_user_name

      def resource_text
        translated_attribute(resource.body)
      end

      def resource_user_name
        extra[:user].try(:[], :name)
      end
    end
  end
end
