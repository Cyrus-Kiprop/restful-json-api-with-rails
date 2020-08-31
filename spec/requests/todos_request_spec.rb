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
      expect(json.size).to eq(10)
    end

    it('returns status code 200') do
      expect(response).to have_http_status(200)
    end
  end

  # Test suite for GET /todos/:id
  describe('GET /todos/:id') do
    before { get "/todos/#{todo_id}" }

    context 'when the record exist' do
      it 'returns the todo item' do
        expect(json).not_to be_empty
        expect(json[:id]).to eq(todo_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:todo_id) { 100 } # initialize with an id that does not exist

      it 'should return status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'should  return a not found message' do
        expect(response.body).to match(/Couldn't find Todo/)

      end
    end
  end
end
