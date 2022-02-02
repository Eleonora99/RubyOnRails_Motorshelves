class User < ApplicationRecord
  has_many :bikeadvs, dependent: :delete_all
  has_many :bikesellingadvs, dependent: :delete_all
  acts_as_user :roles => [:basic, :admin]
  before_save :capitalize
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, 
         :registerable, :rememberable,
         #:validatable
         :omniauthable, :omniauth_providers => [:facebook]
   def self.from_omniauth(auth) 
      where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      end
    end 
       
    def self.new_with_session(params, session)
      super.tap do |user|
        if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
            user.email = data["email"] if user.email.blank?
          end
        end
    end
    
    def is_basic?
      return (self.roles_mask & 1) == 1
    end
  
    def is_banned?
      return (self.roles_mask | 0) == 0
    end
  
    def set_basic
      self.roles_mask = (self.roles_mask | 1)
      self.save
    end
  
    def unset_basic
      self.roles_mask = 0
      self.save
    end
  
    def is_admin?
      return (self.roles_mask & 2) == 2
    end
  
    def set_admin
      self.roles_mask = (self.roles_mask | 2)
      self.save
    end
  
    def unset_admin
      self.roles_mask = (self.roles_mask & 1)
      self.save
    end
  

    def capitalize
      if(self.firstname!=nil)
        self.firstname = self.firstname.split(/\s+/).map(&:downcase).map(&:capitalize).join(' ')
      end
      if(self.lastname!=nil)
        self.lastname = self.lastname.split(/\s+/).map(&:downcase).map(&:capitalize).join(' ')
      end
    end

end
