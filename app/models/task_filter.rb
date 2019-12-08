class TaskFilter
  include ActiveModel::Model
  attr_accessor :search_term, :only_unfinished, :tag_ids, :category_ids

  def initialize parameters = {}
    if parameters.keys.count > 0
      @search_term = parameters[:search_term]

      # Convert to boolean
      @only_unfinished = (parameters[:only_unfinished] == "0") ? false : true

      # Convert to integers and remove leftover 0
      categories = parameters[:category_ids].map(&:to_i)
      categories.delete(0)
      @category_ids = categories

      # Convert to integers and remove leftover 0
      tags = parameters[:tag_ids].map(&:to_i)
      tags.delete(0)
      @tag_ids = tags
    else
      @search_term = ""
      @only_unfinished = false
      @category_ids = []
      @tag_ids = []
    end
  end
end