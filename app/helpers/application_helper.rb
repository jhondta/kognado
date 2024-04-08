# frozen_string_literal: true

# Application helper
module ApplicationHelper
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
