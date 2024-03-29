# frozen_string_literal: true

require "active_support/concern"

module Decidim
  module Challenges
    # Common logic to sorting resources
    module OrderableChallenges
      extend ActiveSupport::Concern

      included do
        include Decidim::Orderable

        private

        def available_orders
          @available_orders ||= %w(alphabetically random recent)
        end

        def default_order
          "alphabetically"
        end

        def reorder(challenges)
          case order
          when "recent"
            challenges.order("created_at DESC")
          when "random"
            challenges.order_randomly(random_seed)
          when "alphabetically"
            challenges.order("title ASC")
          else
            challenges
          end
        end
      end
    end
  end
end
