require 'spec_helper'

describe SubscribersController do
  
  before(:each) do 
    @user = FactoryGirl.create(:user)
    sign_in @user
  end
  
  describe "GET methods" do
    before(:each) do
      @subscriber = FactoryGirl.create(:subscriber)
    end
      
    describe "GET index" do
      it "should be successful" do 
        get :index, {}
        assigns(:subscribers).should eq([@subscriber])
      end
    end
  
    describe "GET show" do
      it "assigns the requested subscriber as @subscriber" do
        get :show, {:id => @subscriber.to_param}
        assigns(:subscriber).should eq(@subscriber)
      end
    end
  
    describe "GET new" do
      it "assigns a new subscriber as @subscriber" do
        get :new, {}
        assigns(:subscriber).should be_a_new(Subscriber)
      end
    end
  
    describe "GET edit" do
      it "assigns the requested subscriber as @subscriber" do
        get :edit, {:id => @subscriber.to_param}
        assigns(:subscriber).should eq(@subscriber)
      end
    end
    
  end
  
  describe "POST create" do
    describe "with valid params" do 
      it "creates a new Subscriber" do
        expect {
          post :create, subscriber: FactoryGirl.attributes_for(:subscriber)
        }.to change(Subscriber, :count).by(1)
      end
  
      it "assigns a newly created subscriber as @subscriber" do
        post :create, {:subscriber => FactoryGirl.attributes_for(:subscriber)}
        assigns(:subscriber).should be_a(Subscriber)
        assigns(:subscriber).should be_persisted
      end
        
      it "redirects to the created subscriber" do
        post :create, {:subscriber => FactoryGirl.attributes_for(:subscriber)}
        response.should redirect_to(Subscriber.last)
      end
    end
  
    describe "with invalid params" do
      it "assigns a newly created but unsaved subscriber as @subscriber" do
        # Trigger the behavior that occurs when invalid params are submitted
        Subscriber.any_instance.stub(:save).and_return(false)
        post :create, {:subscriber => { "first_name" => "ab" }}
        assigns(:subscriber).should be_a_new(Subscriber)
      end
  
      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Subscriber.any_instance.stub(:save).and_return(false)
        post :create, {:subscriber => { "first_name" => "ab" }}
        response.should render_template("new")
      end
    end
  end
  
  describe "PUT update" do
    before(:each) do
      @subscriber = FactoryGirl.create(:subscriber)
    end
    
    describe "with valid params" do
      it "updates the requested subscriber" do
        # Assuming there are no other subscribers in the database, this
        # specifies that the Subscriber created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Subscriber.any_instance.should_receive(:update_attributes).with({ "first_name" => "MyString" })
        put :update, {:id => @subscriber.to_param, :subscriber => { "first_name" => "MyString" }}
      end
  
      it "assigns the requested subscriber as @subscriber" do
        put :update, {:id => @subscriber.to_param, :subscriber => FactoryGirl.attributes_for(:subscriber)}
        assigns(:subscriber).should eq(@subscriber)
      end
  
      it "redirects to the subscriber" do
        put :update, {:id => @subscriber.to_param, :subscriber => FactoryGirl.attributes_for(:subscriber)}
        response.should redirect_to(@subscriber)
      end
    end
  
    describe "with invalid params" do
      it "assigns the subscriber as @subscriber" do
        # Trigger the behavior that occurs when invalid params are submitted
        Subscriber.any_instance.stub(:save).and_return(false)
        put :update, {:id => @subscriber.to_param, :subscriber => { "first_name" => "" }}
        assigns(:subscriber).should eq(@subscriber)
      end
  
      it "re-renders the 'edit' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Subscriber.any_instance.stub(:save).and_return(false)
        put :update, {:id => @subscriber.to_param, :subscriber => { "first_name" => "" }}
        response.should render_template("edit")
      end
    end
  end
  
  describe "DELETE destroy" do
    before(:each) do
      @subscriber = FactoryGirl.create(:subscriber)
    end
    
    it "destroys the requested subscriber" do
      expect {
        delete :destroy, {:id => @subscriber.to_param}
      }.to change(Subscriber, :count).by(-1)
    end
  
    it "redirects to the subscribers list" do
      delete :destroy, {:id => @subscriber.to_param}
      response.should redirect_to(subscribers_url)
    end
  end

end
