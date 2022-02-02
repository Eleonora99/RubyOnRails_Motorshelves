class Bikesellingadv < ApplicationRecord
  belongs_to :user
  before_save :capitalize

  def self.search_by(id,par)
      if par && par !=""
          par = par.split(/\s+/).map(&:downcase).map(&:capitalize).join(' ')
          self.where("user_id != '#{id}' and city = '#{par}'")
      else
          Bikesellingadv.all.where("user_id != '#{id}'")
      end
  end

  def check
      self.start_date <= self.end_date
  end

  def capitalize
      self.city = self.city.split(/\s+/).map(&:downcase).map(&:capitalize).join(' ')
  end
end
