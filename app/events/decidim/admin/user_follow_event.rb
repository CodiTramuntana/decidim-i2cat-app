# frozen_string_literal: true

module Decidim
  module Admin
  	class UserFollowEvent < Decidim::Events::SimpleEvent
  		def resource_text
  			translated_attribute(resource.body)
  		end
  	end
  end
end
