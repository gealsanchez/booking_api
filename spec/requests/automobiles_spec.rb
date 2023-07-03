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
end  