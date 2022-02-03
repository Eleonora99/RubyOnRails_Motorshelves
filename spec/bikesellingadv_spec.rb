require 'rails_helper.rb'
describe BikesellingadvsController, type: :controller do

    fixtures :all

    context "With basic privileges" do

        #Create
        it "Should not create bikesellingadvs with :start_date > :end_date" do
            basic = users(:three)
            sign_in basic
            params = {:bikesellingadv => { :city => "Rome", :start_date => "2022-01-01", :end_date => "2021-01-01"}, :user_id => "3" }
            post :create, :params => params
            m_tst = Bikesellingadv.all
            expect(m_tst).to be_empty
        end

        #Create
        it "Should create bikesellingadvs" do
            basic = users(:three)
            sign_in basic
            params = {:bikesellingadv => { :id => 1, :city => "Rome", :start_date => "2021-01-01", :end_date => "2022-01-01"}, :user_id => 3 }
            post :create, :params => params
            m_tst = Bikesellingadv.all
            expect(m_tst.size).to eql(1)
        end

        #Findadv
        it "Should not find advs because the only one exists has the same :user_id" do
            p = Bikesellingadv.create(:id => 2, :city => "Rome", :start_date => "2021-01-01", :end_date => "2022-01-01", :user_id => 3)
            basic = users(:three)
            sign_in basic
            params = { :user_id => 3}
            get :findadv, :params => params
            expect(assigns(:bikesellingadvs)).to be_empty
        end

        #Findadv
        it "Should find advs" do
            p = Bikesellingadv.create(:id => 2, :city => "Rome", :start_date => "2021-01-01", :end_date => "2022-01-01", :user_id => 3)
            basic = users(:three)
            sign_in basic
            params = {:bikesellingadv => {:par =>"Rome"}, :user_id => 2}
            get :findadv, :params => params
            expect(assigns(:bikesellingadvs)).not_to be_empty
        end
    end
end
