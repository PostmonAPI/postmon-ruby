# encoding: utf-8
require "spec_helper"

module PostmonRuby
  module Finders
    describe StateFinder do
      describe "#search" do
        context "with too many arguments" do
          it "raise an ArgumentError" do
            expect{ PostmonRuby::Client.search(:estado, "SP", "xxxxx") }.to raise_error(ArgumentError)
          end
        end

        context "with less arguments" do
          it "raise an ArgumentError" do
            expect{ PostmonRuby::Client.search(:estado) }.to raise_error(ArgumentError)
          end
        end        

        context "with valid state" do
          let(:state) { PostmonRuby::Client.search(:estado, "SP" ) }
          it "returns a PostmonRuby::State object" do
            expect(state).to be_a(PostmonRuby::State)
          end
          it "returns a complete state info" do
            expect(state.area_km2).to eq "248.222,801"
            expect(state.codigo_ibge).to eq "35"
            expect(state.nome).to eq "São Paulo"
          end          
        end
 
        context "with invalid state" do
          let(:state) { PostmonRuby::Client.search(:estado, "SK") }
          it "returns a PostmonRuby::State object" do
            expect(state).to be_a(PostmonRuby::State)
          end
          it "returns true in 'not_found'" do
            expect(state.not_found).to be_true
          end          
        end        

      end
    end  
  end
end
