# frozen_string_literal: true

module ::Cells::Decidim::Assemblies::AssemblyMCellDecorator
end

::Decidim::Assemblies::AssemblyMCell.class_eval do
  private

  def statuses
    [:open_close, :follow]
  end

  def open_close_status
    closing_date = model.closing_date

    if closing_date.present? && closing_date > Time.zone.today
      tag.p(t(".open"), class: "tag open")
    else
      tag.p(t(".close"), class: "tag close")
    end
  end
end
