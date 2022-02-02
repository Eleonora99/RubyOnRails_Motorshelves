class Bikeadv < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  before_save :capitalize

  def self.search_by(id,search,par)
      if par && par !=""
          par = par.split(/\s+/).map(&:downcase).map(&:capitalize).join(' ')
          self.where("user_id != '#{id}' and #{search} = '#{par}'")
      else
          Bikeadv.all.where("user_id != '#{id}'")
      end
    end
    def capitalize
        self.city = self.city.split(/\s+/).map(&:downcase).map(&:capitalize).join(' ')
        self.scuderia = self.scuderia.split(/\s+/).map(&:downcase).map(&:capitalize).join(' ')
        self.modello = self.modello.split(/\s+/).map(&:downcase).map(&:capitalize).join(' ')
    end
  
end
