module ApplicationHelper
  # Render tags
  #
  # @param tags Array
  # @return String
  def tag_list(tags)
    raw tags.map { |t| link_to t, root_path(tag: t), class: 'label' }.join(', ')
  end
end
