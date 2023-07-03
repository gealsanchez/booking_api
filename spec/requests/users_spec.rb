require 'rails_helper'

RSpec.describe Api::V1::UsersController, type: :controller do
  describe 'GET #index' do
    it 'returns a success response' do
      get :index
      expect(response).to have_http_status(:ok)
    end

    it 'returns all users' do
      user1 = User.create(name: 'John')
      user2 = User.create(name: 'Jane')

      get :index
      expect(response.body).to include(user1.to_json)
      expect(response.body).to include(user2.to_json)
    end
  end

  describe 'POST #create' do
    context 'with valid parameters' do
      let(:valid_params) { { user: { name: 'John' } } }

      it 'creates a new user' do
        expect {
          post :create, params: valid_params
        }.to change(User, :count).by(1)
      end

      it 'returns a success response' do
        post :create, params: valid_params
        expect(response).to have_http_status(:created)
      end
    end

    context 'with invalid parameters' do
      let(:invalid_params) { { user: { name: '' } } }

      it 'does not create a new user' do
        expect {
          post :create, params: invalid_params
        }.to_not change(User, :count)
      end

      it 'returns an unprocessable entity response' do
        post :create, params: invalid_params
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'GET #show' do
    context 'when user exists' do
      let(:user) { User.create(name: 'John') }

      it 'returns a success response' do
        get :show, params: { id: user.name }
        expect(response).to have_http_status(:ok)
      end

      it 'returns the user' do
        get :show, params: { id: user.name }
        expect(response.body).to eq(user.to_json)
      end
    end

    context 'when user does not exist' do
      it 'returns a not found response' do
        get :show, params: { id: 'nonexistent' }
        expect(response).to have_http_status(:not_found)
      end

      it 'returns an error message' do
        get :show, params: { id: 'nonexistent' }
        expect(response.body).to eq({ error: 'User not found.' }.to_json)
      end
    end
  end
end
