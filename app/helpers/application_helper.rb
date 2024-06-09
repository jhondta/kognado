# frozen_string_literal: true

# Application helper
module ApplicationHelper
  # Returns the full title on a per-page basis
  def full_title(page_title = '')
    base_title = 'Kognado'
    page_title.empty? ? base_title : "#{page_title} | #{base_title}"
  end

  # Returns the color for the alert
  def alert_color(type)
    colors = { 'notice' => 'blue',
               'alert' => 'red',
               'error' => 'red',
               'success' => 'green',
               'warning' => 'yellow' }
    colors[type] || 'blue'
  end
end
