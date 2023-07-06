require 'rails_helper'

RSpec.describe 'Api::V1::Automobiles', type: :request do
  describe 'GET /api/v1/automobiles' do
    it 'returns a list of automobiles' do
      # Create test data
      automobile1 = Automobile.create(model: 'Toyota', year: 2020, rate: 100, location: 'New York', photo: 'https://imgd.aeplcdn.com/370x208/n/cw/ec/130591/fronx-exterior-right-front-three-quarter-4.jpeg?isig=0&q=75')
      automobile2 = Automobile.create(model: 'Honda', year: 2019, rate: 90, location: 'Los Angeles', photo: 'https://cdni.autocarindia.com/utils/imageresizer.ashx?n=https://cms.haymarketindia.net/model/uploads/modelimages/Hyundai-Grand-i10-Nios-200120231541.jpg&w=872&h=578&q=75&c=1')

      # Send GET request
      get '/api/v1/automobiles'

      # Check response
      expect(response).to have_http_status(:ok)
      expect(response.body).to include(automobile1.model)
      expect(response.body).to include(automobile2.model)
    end
  end

  describe 'GET /api/v1/automobiles/:id' do
    it 'returns a specific automobile' do
      # Create test data
      automobile = Automobile.create(model: 'Toyota', year: 2020, rate: 100, location: 'New York', photo: 'https://imgd.aeplcdn.com/370x208/n/cw/ec/130591/fronx-exterior-right-front-three-quarter-4.jpeg?isig=0&q=75')

      # Send GET request
      get "/api/v1/automobiles/#{automobile.id}"

      # Check response
      expect(response).to have_http_status(:ok)
      expect(response.body).to include(automobile.model)
    end
  end

  describe 'POST /api/v1/automobiles' do
    it 'creates a new automobile' do
      # Parameters for the new automobile
      automobile_params = {
        automobile: {
          model: 'Toyota',
          year: 2022,
          rate: 120,
          location: 'Chicago',
          photo: 'https://cdni.autocarindia.com/utils/imageresizer.ashx?n=https://cms.haymarketindia.net/model/uploads/modelimages/Hyundai-Grand-i10-Nios-200120231541.jpg&w=872&h=578&q=75&c=1'
        }
      }

      # Send POST request
      post '/api/v1/automobiles', params: automobile_params

      # Check response
      expect(response).to have_http_status(:created)
      expect(response.body).to include(automobile_params[:automobile][:model])

      # Check if the automobile was actually created in the database
      automobile = Automobile.last
      expect(automobile.model).to eq(automobile_params[:automobile][:model])
      expect(automobile.year).to eq(automobile_params[:automobile][:year])
      expect(automobile.rate).to eq(automobile_params[:automobile][:rate])
      expect(automobile.location).to eq(automobile_params[:automobile][:location])
      expect(automobile.photo).to eq(automobile_params[:automobile][:photo])
    end
  end
end
