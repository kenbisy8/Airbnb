class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  # require "countries/global"
end
