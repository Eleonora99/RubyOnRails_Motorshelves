require 'rails_helper.rb'
describe UsersController, type: :controller do

    fixtures :all

    it "It should be banned" do
        banned = users(:one)
        expect(banned.is_banned?).to be true
    end
    
    it "It should be admin" do
        admin = users(:two)
        expect(admin.is_admin?).to be true
    end

    it "It should became admin" do
        basic = users(:three)
        basic.set_admin
        expect(basic.roles_mask).to be 3
    end

    it "It should became banned" do
        banned=users(:one)
        banned.unset_basic
        expect(banned.roles_mask).to be 0
    end

    it "It should have firstname='Giorgio'" do
        basic = users(:three)
        basic.capitalize
        expect(basic.firstname).to eql("Giorgio") and expect(basic.lastname).to eql("De Rossi")
    end

    context "With admin privileges" do
        #Update
        it "Should update himself" do
            admin = users(:two)
            sign_in admin
            params = {:id => admin.id, :user => {:firstname => "Franco", :lastname => "Bianchi"}}
            get :update, :params => params
            u_tst = User.find(admin.id)
            expect(u_tst.firstname).to eql("Franco") and expect(u_tst.lastname).to eql("Bianchi")
        end

        #Index
        it "Should see index of users" do
            admin = users(:two)
            sign_in admin
            get :index
            u_tst = User.all
            expect(assigns(:users)).to eq(u_tst)
        end
        
        #Show
        it "Should retrieve himself" do
            admin = users(:two)
            sign_in admin
            params = {:id => admin.id}
            get :show, :params => params
            expect(assigns(:user)).to eql(admin)
        end
    end

    context "With basic privileges" do
        #Update
        it "Should update himself" do
            basic = users(:three)
            sign_in basic
            params = {:id => basic.id, :user => {:firstname => "Leonardo", :lastname => "Verdi"}}
            get :update, :params => params
            u_tst = User.find(basic.id)
            expect(u_tst.firstname).to eql("Leonardo") and expect(u_tst.lastname).to eql("Verdi")
        end

        #Index
        it "Should see index of users" do
            basic = users(:three)
            sign_in basic
            get :index
            u_tst = User.all
            expect(assigns(:users)).to eql(nil)
        end
        
        #Show
        it "Should retrieve himself" do
            basic = users(:three)
            sign_in basic
            params = {:id => basic.id}
            get :show, :params => params
            expect(assigns(:user)).to eql(basic)
        end

        #Destroy
        it "Should destroy himself" do
            basic = users(:three)
            sign_in basic
            params = {:id => basic.id}
            get :destroy, :params => params
            u_tst = User.where(:id => basic.id)
            expect(u_tst).to be_empty
        end        
    end
    
end
