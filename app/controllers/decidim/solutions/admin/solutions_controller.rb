module Decidim
  module Solutions
    module Admin
      class SolutionsController < Decidim::Solutions::Admin::ApplicationController
        include Decidim::Admin::Filterable

        def index
          @solutions = filtered_collection
        end

        private

        def collection
          Solution.where(component: current_component)
        end

        def base_query
          collection.order(created_at: :desc)
        end

        def filters
          [:state_eq, :created_at_gteq, :created_at_lteq]
        end
      end
    end
  end
end