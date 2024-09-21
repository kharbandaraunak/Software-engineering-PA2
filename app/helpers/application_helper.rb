module ApplicationHelper
  def sort_col(column, title = nil)
    title ||= column.titleize
    current_sort_column = session[:sort] || 'title'
    current_sort_direction = session[:direction] || 'asc'

    direction = (column == current_sort_column) ? (current_sort_direction == "asc" ? "desc" : "asc") : "asc"

    css_class = column == current_sort_column ? "sorted-#{current_sort_direction}" : ""
    symbol = column == current_sort_column ? (current_sort_direction == "asc" ? "↑" : "↓") : ""

    link_to "#{title} #{symbol}".html_safe, movies_path(sort: column, direction: direction), class: css_class, data: { turbo: false }
  end
end