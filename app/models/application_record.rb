class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class
  # scope :overdue ,->{ where('hours>10')}
end
