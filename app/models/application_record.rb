class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  def previous
    Content.where('id < ? ', id).order('id DESC').first
  end

  def next
    Content.where('id > ?', id).order('id ASC').first
  end

  def user_previous
    Content.where('id < ? AND user_id = ?', id, user_id).order('id DESC').first
  end

  def user_next
    Content.where('id > ? AND user_id = ?', id, user_id).order('id ASC').first
  end
end
