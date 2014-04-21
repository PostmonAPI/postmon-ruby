require "spec_helper"

module PostmonRuby
  module Finders
    describe CityFinder do
      describe "#search" do
        context "with too many arguments" do
          it "raise an ArgumentError" do
            expect{ PostmonRuby::Client.search(:cidade, "SP", "Araraquara", "xxxxx") }.to raise_error(ArgumentError)
          end
        end

        context "with less arguments" do
          it "raise an ArgumentError" do
            expect{ PostmonRuby::Client.search(:cidade, "SP") }.to raise_error(ArgumentError)
          end
        end        

        context "with valid city" do
          let(:city) { PostmonRuby::Client.search(:cidade, "SP", "Araraquara") }
          it "returns a PostmonRuby::City object" do
            expect(city).to be_a(PostmonRuby::City)
          end
          it "returns a complete city info" do
            expect(city.area_km2).to eq "1003,674"
            expect(city.codigo_ibge).to eq "3503208"
          end          
        end

        context "with valid city with special characters" do
          let(:city) { PostmonRuby::Client.search(:cidade, "SP", "São Paulo") }
          it "returns a PostmonRuby::City object" do
            expect(city).to be_a(PostmonRuby::City)
          end
          it "returns a complete city info" do
            expect(city.area_km2).to eq "1521,101"
            expect(city.codigo_ibge).to eq "3550308"
          end          
        end        

        context "with invalid city" do
          let(:city) { PostmonRuby::Client.search(:cidade, "SP", "Xxxx") }
          it "returns a PostmonRuby::City object" do
            expect(city).to be_a(PostmonRuby::City)
          end
          it "returns true in 'not_found'" do
            expect(city.not_found).to be_true
          end          
        end        

      end
    end  
  end
end