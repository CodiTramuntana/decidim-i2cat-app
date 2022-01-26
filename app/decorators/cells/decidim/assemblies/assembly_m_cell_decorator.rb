# frozen_string_literal: true

Decidim::Assemblies::AssemblyMCell.class_eval do

  alias_method :original_statuses, :statuses

  private

  def statuses
    if current_organization.host == I2cat::HOST_W_CUSTOM_TAGS_ASSEMBLIES
      [:open_close, :follow]
    else
      original_statuses
    end
  end

  def open_close_status
    closing_date = model.closing_date

    if closing_date > Date.today
      content_tag(:p, t(".open"), class: 'tag open')
    else
      content_tag(:p, t(".close"), class: 'tag close')
    end
  end
end
