require "rails_helper"

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe "/pokemons", type: :request do
  # This should return the minimal set of attributes required to create a valid
  # Pokemon. As you add validations to Pokemon, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    {
      "name" => "Bulbasaur",
      "type_1" => "Grass",
      "type_2" => "Poison",
      "total" => 318,
      "hp" => 45,
      "attack" => 49,
      "defense" => 49,
      "sp_atk" => 65,
      "sp_def" => 65,
      "speed" => 45,
      "generation" => 1,
      "legendary" => false,
    }
  }

  let(:invalid_attributes) {
    {
      "name" => "Bulbasaur",
      "type_1" => "Grass",
      "type_2" => "Poison",
      "total" => 318,
      "hp" => nil,
      "attack" => 49,
      "defense" => 49,
      "sp_atk" => 65,
      "sp_def" => 65,
      "speed" => 45,
      "generation" => 1,
      "legendary" => false,
    }
  }

  # This should return the minimal set of values that should be in the headers
  # in order to pass any filters (e.g. authentication) defined in
  # PokemonsController, or in your router and rack
  # middleware. Be sure to keep this updated too.
  let(:valid_headers) {
    {}
  }

  describe "GET /index" do
    it "renders a successful response" do
      Pokemon.create! valid_attributes
      get pokemons_url, headers: valid_headers, as: :json
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      pokemon = Pokemon.create! valid_attributes
      get pokemon_url(pokemon), as: :json
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Pokemon" do
        expect {
          post pokemons_url,
               params: { pokemon: valid_attributes }, headers: valid_headers, as: :json
        }.to change(Pokemon, :count).by(1)
      end

      it "renders a JSON response with the new pokemon" do
        post pokemons_url,
             params: { pokemon: valid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Pokemon" do
        expect {
          post pokemons_url,
               params: { pokemon: invalid_attributes }, as: :json
        }.to change(Pokemon, :count).by(0)
      end

      it "renders a JSON response with errors for the new pokemon" do
        post pokemons_url,
             params: { pokemon: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(%r{application/json})
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        { hp: 3 }
      }

      it "updates the requested pokemon" do
        pokemon = Pokemon.create! valid_attributes
        patch pokemon_url(pokemon),
              params: { pokemon: new_attributes }, headers: valid_headers, as: :json
        pokemon.reload
      end

      it "renders a JSON response with the pokemon" do
        pokemon = Pokemon.create! valid_attributes
        patch pokemon_url(pokemon),
              params: { pokemon: new_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      it "renders a JSON response with errors for the pokemon" do
        pokemon = Pokemon.create! valid_attributes
        patch pokemon_url(pokemon),
              params: { pokemon: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(%r{application/json})
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested pokemon" do
      pokemon = Pokemon.create! valid_attributes
      expect {
        delete pokemon_url(pokemon), headers: valid_headers, as: :json
      }.to change(Pokemon, :count).by(-1)
    end
  end
end
