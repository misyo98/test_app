require 'rails_helper'

RSpec.describe CarsController, type: :controller do
  render_views

  describe 'GET #index' do
    before(:each) do
      get :index
    end

    subject { response }

    it { is_expected.to have_http_status(200) }
    it { is_expected.to render_template(:index) }
  end

  describe 'GET #new' do
    before(:each) do
      get :new
    end

    subject { response }

    it { is_expected.to have_http_status(200) }
    it { is_expected.to render_template(:new) }
  end

  describe "POST #create" do
    let!(:car) { create(:car) }

    it 'create car' do
      expect do
        post :create, params: { car: attributes_for(:car) }
      end.to change(Car, :count).by(1)
    end
    
    it 'it should redirect after save' do
      post :create, params: { car: attributes_for(:car) }
      expect(response).to redirect_to(car_path(Car.last.id))
    end
  end

  describe 'GET #edit' do
    let!(:car) { create(:car) }

    before(:each) do
      get :edit, params: { id: car.id }
    end

      subject { response }

      it { is_expected.to have_http_status(200) }
      it { is_expected.to render_template(:edit) }
  end

  describe 'PUT #update' do
    let!(:car) { create(:car)}

    it 'update journey' do
      new_car_params = FactoryBot.attributes_for(:car, model: 'Updated model')
      put :update, params: { id: car.id, car: new_car_params }
      car.reload
      expect(car.model).to eq 'Updated model'
      expect(response).to redirect_to(cars_path)
    end
  end

  describe 'GET #show' do
    let!(:car) { create(:car) }

    before(:each) do
      get :show, params: { id: car.id }
    end

      subject { response }

      it { is_expected.to have_http_status(200) }
      it { is_expected.to render_template(:show) }
  end

  describe '#delete' do
    let!(:car) { create(:car)}

    it 'delete journey' do
      expect { delete :destroy, params: { id: car.id } }
        .to change(Car, :count).by(-1)
    end

    it 'it should redirect after delete' do
      delete :destroy, params: { id: car.id }
      expect(response).to redirect_to(cars_path)
    end
  end
end
