
Decidim.register_component(:solutions) do |component|
  component.exports :solutions do |exports|
    exports.collection do |component_instance|
      Decidim::Solutions::Solution.where(component: component_instance)
    end

    exports.include_in_open_data = true

    exports.serializer Decidim::Solutions::SolutionSerializer
  end
end