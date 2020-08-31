require 'rails_helper'

RSpec.describe "Todos", type: :request do

  #initialize the test data with the help of Bactory-bot
  let!(:todos) { create_list(:todo, 10) }
  let(:todo_id) { todos.first.id }


  # Test suite for GET /todos
  describe('GET /todos') do
    #make an HTTP request before each example
    before { get '/todos' }

    it('returns todos') do
      # Note 'json' is a custom helper to parse JSON responses
      expect(json).not_to be_empty
      expect(json.size).to eql(10)
    end

    it('returns status code 200') do
      expect(response).to have_http_status(200)
    end
  end

end
