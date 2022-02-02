Canard::Abilities.for(:admin) do
  can [:index, :ban, :unban, :admin, :unadmin], User
  can [:index, :show, :new, :create, :findadv, :edit, :update, :destroy], Bikeadv
  can [:index, :new, :create, :findadv, :edit, :update, :destroy], Bikesellingadv
end
