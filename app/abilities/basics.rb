Canard::Abilities.for(:basic) do
  can [:index, :show, :new, :create, :findadv, :edit, :update, :destroy], Bikeadv
  can [:index,  :new, :create, :findadv, :edit, :update, :destroy], Bikesellingadv
  cannot [:index, :ban, :unban, :admin, :unadmin], User
end
