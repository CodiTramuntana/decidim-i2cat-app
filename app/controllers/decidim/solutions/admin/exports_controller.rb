module Decidim
  module Solutions
    module Admin
      class ExportsController < Decidim::Admin::ExportersController
        def default_serializer
          Decidim::Solutions::SolutionSerializer
        end

        def resource_class
          Decidim::Solutions::Solution
        end
      end
    end
  end
end